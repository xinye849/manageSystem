package xin.yuan.dao.impl;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.query.Query;
import org.springframework.orm.hibernate5.HibernateCallback;
import org.springframework.orm.hibernate5.support.HibernateDaoSupport;
import xin.yuan.dao.PostDao;
import xin.yuan.entity.Post;

import java.util.List;
import java.util.Map;

/**
 * @authorknightx
 * @create2019/3/13
 * @since 1.0.0
 */
public class PostDaoImpl extends HibernateDaoSupport implements PostDao {
    @Override
    public int addPost(Post post) {
        int rs= (int) getHibernateTemplate().save(post);
        return rs;
    }

    @Override
    public List<Object> newPosts() {
       /* String sql = "from Post ORDER BY publishTime DESC limit 0,5";*/


        return (List<Object>) getHibernateTemplate().execute(
                new HibernateCallback() {
                    @Override
                    public Object doInHibernate(Session session) throws HibernateException {
                        Query query = session.createQuery("from Post ORDER BY publishTime DESC");
                        query.setFirstResult(0);
                        query.setMaxResults(5);
                        return query.list();
                    }
                }
        );
    }

    @Override
    public List<Object> hotPosts() {
       /* String sql = "from Post ORDER BY pageview DESC limit 0,5";*/

        return (List<Object>) getHibernateTemplate().execute(
                new HibernateCallback() {
                    @Override
                    public Object doInHibernate(Session session) throws HibernateException {
                        Query query = session.createQuery("from Post ORDER BY pageview DESC");
                        query.setFirstResult(0);
                        query.setMaxResults(5);
                        return query.list();
                    }
                }
        );
    }

    @Override
    public List<Object> getPost(final int postID) {

       /* final String sql = "select post.postID,post.title,post.content,post.publishTime,post.pageview,l_student.stu_id,l_student.stu_account as account from post left join l_student on post.operator = l_student.stu_id where post.postID=:post.postID";*/
        final String sql = "select post.postID, post.title, post.content,post.publishTime, post.pageview,  l_student.stu_id, l_student.stu_name  FROM post left join l_student on post.operator = l_student.stu_id  where post.postID=:post.postID";


        return (List<Object>) getHibernateTemplate().execute(new HibernateCallback() {
            @Override
            public Object doInHibernate(Session session) throws HibernateException {

                Query query = session.createSQLQuery(sql);
               query.setParameter("post.postID",postID);


                return query.list();
            }
        });



     /*   *//* "`Student`.photo as userPhoto, " +*//*
        String hql = "select Post.postID, Post.title, Post.content, Post.publishTime, Post.pageview, Student.stuId, Student.stuAccount as account, from Post left join Student on Post.operator = Student.stuId  where Post.postID=?0";

        List<Object> list = (List<Object>) getHibernateTemplate().find(hql, postID);

            return list;*/

    }

    @Override
    public int addPageView(int postID) {
        Post post = getHibernateTemplate().get(Post.class,postID);
        post.setPageview(post.getPageview()+1);
      /*  String hql = "update Post set pageview = pageview + 1 where postID = ?0";*/
        getHibernateTemplate().update(post);
        return 1;
    }

    @Override
    public List<Object> getAllPosts() {
        String hql = "from Post ORDER BY pageview DESC";

        return (List<Object>) getHibernateTemplate().find(hql);
    }

    @Override
    public List<Map<String, Object>> posts(final String sql) {





        return (List<Map<String, Object>>) getHibernateTemplate().execute(new HibernateCallback() {
            @Override
            public Object doInHibernate(Session session) throws HibernateException {
                Query query = session.createSQLQuery(sql);

                return query.list();
            }
        });
    }
}
