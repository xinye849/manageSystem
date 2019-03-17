package xin.yuan.dao.impl;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.query.Query;
import org.springframework.orm.hibernate5.HibernateCallback;
import org.springframework.orm.hibernate5.support.HibernateDaoSupport;
import xin.yuan.dao.NoticeDao;

import java.util.List;

/**
 * @authorknightx
 * @create2019/3/17
 * @since 1.0.0
 */
public class NoticeDaoImpl extends HibernateDaoSupport implements NoticeDao {
    //获得最新的通告
    @Override
    public List<Object> newNotice(){
        /*String sql = "from Notice ORDER BY publishTime DESC limit 0,5";*/



        return (List<Object>) getHibernateTemplate().execute(
                new HibernateCallback() {
                    @Override
                    public Object doInHibernate(Session session) throws HibernateException {
                        Query query = session.createQuery("from Notice ORDER BY publishTime DESC");
                        query.setFirstResult(0);
                        query.setMaxResults(5);
                        return query.list();
                    }
                }
        );
    }

    @Override
    public List<Object> allNotice() {
        String sql = "from Notice ORDER BY publishTime DESC";

        return (List<Object>) getHibernateTemplate().find(sql);
    }

    @Override
    public List<Object> getPost(int id) {
        String hql ="from Notice where id=?0";

        return (List<Object>) getHibernateTemplate().find(hql,id);
    }
}
