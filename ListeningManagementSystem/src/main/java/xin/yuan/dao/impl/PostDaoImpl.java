package xin.yuan.dao.impl;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.query.Query;
import org.springframework.orm.hibernate5.HibernateCallback;
import org.springframework.orm.hibernate5.support.HibernateDaoSupport;
import xin.yuan.dao.PostDao;
import xin.yuan.entity.Post;

import java.util.List;

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
}
