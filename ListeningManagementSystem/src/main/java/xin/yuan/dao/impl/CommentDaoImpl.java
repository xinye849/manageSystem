package xin.yuan.dao.impl;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.query.Query;
import org.springframework.orm.hibernate5.HibernateCallback;
import org.springframework.orm.hibernate5.support.HibernateDaoSupport;
import xin.yuan.dao.CommentDao;
import xin.yuan.entity.Comment;
import xin.yuan.entity.Post;
import xin.yuan.entity.Student;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * @authorknightx
 * @create2019/3/18
 * @since 1.0.0
 */
public class CommentDaoImpl extends HibernateDaoSupport implements CommentDao {
    @Override
    public List<Object> getCommentByPostID(final int postID, final int page) {


        final String sql = "select Comment.id,Comment.content,Comment.commentTime,Comment.operator,Comment.post, l_student.stu_name from Comment LEFT JOIN Post on Comment.post =Post.postID LEFT JOIN l_student on Comment.operator = l_student.stu_id where Comment.post =:Comment.post ORDER BY commentTime ASC";

        return (List)getHibernateTemplate().execute(
                new HibernateCallback(){
                    @Override
                    public Object doInHibernate(Session session) throws HibernateException
                    {
                        Query query = session.createSQLQuery(sql);

                        query.setParameter("Comment.post",postID);
                        query.setFirstResult((page-1)*5);
                        query.setMaxResults(5);

                        return query.list();

                    }

                });
    }

    @Override
    public int getTotalCommentPagesByPostId(int postID) {
        String hql = "select count(*) AS commentTotal from Comment where post = ?0";

        Number count = (Number)getHibernateTemplate().find(hql,postID).listIterator().next();
        return count.intValue();
    }

    @Override
    public int addCommentByPostID(int userID, int postID, String content) {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        String time = sdf.format(new Date());
        Comment comment = new Comment();
        comment.setCommentTime(time);
        comment.setContent(content);
        comment.setPost(postID);
        comment.setOperator(userID);
       /* String sql = "insert into comment (content, commentTime, post, operator) values (?,?,?,?)";*/

        return (int) getHibernateTemplate().save(comment);
    }
}
