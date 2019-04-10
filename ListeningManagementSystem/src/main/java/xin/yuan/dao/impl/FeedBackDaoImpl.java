package xin.yuan.dao.impl;

import org.springframework.orm.hibernate5.support.HibernateDaoSupport;
import xin.yuan.dao.FeedBackDao;
import xin.yuan.entity.feedBack;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @authorknightx
 * @create2019/3/30
 * @since 1.0.0
 */
public class FeedBackDaoImpl extends HibernateDaoSupport implements FeedBackDao {
    @Override
    public void saveFeedBackById(feedBack feedBack) {
        getHibernateTemplate().save(feedBack);

    }

    @Override
    public List<feedBack> findFeedBackById(int listenClassId) {
        String hql = "from feedBack where listenClassId = ?0";

        return (List<feedBack>) getHibernateTemplate().find(hql,listenClassId);
    }

    @Override
    public feedBack findFeedBackByOne(int id) {
        String hql = "from feedBack where id = ?0";

        return getHibernateTemplate().get(feedBack.class,id);
    }

    @Override
    public Map<String,Integer> findGradeByListenId(int listenClassId) {
        Map<String,Integer> map = new HashMap<String, Integer>();

        String hql = "SELECT COUNT(grade) FROM feedBack WHERE listenClassId =?0 and grade=?1";
        if ( getHibernateTemplate().find(hql,listenClassId,"优").isEmpty()){
            map.put("优",0);
        }else {
            Long  count = (Long) getHibernateTemplate().find(hql,listenClassId,"优").listIterator().next();
            map.put("优",count.intValue());
        }
        String hql2 = "SELECT COUNT(grade) FROM feedBack WHERE listenClassId =?0 and grade=?1";
        if ( getHibernateTemplate().find(hql,listenClassId,"良").isEmpty()){
            map.put("良",0);
        }else {
            Long  count = (Long) getHibernateTemplate().find(hql,listenClassId,"良").listIterator().next();
            map.put("良",count.intValue());
        }
        String hq3 = "SELECT COUNT(grade) FROM feedBack WHERE listenClassId =?0 and grade=?1";
        if ( getHibernateTemplate().find(hql,listenClassId,"中").isEmpty()){
            map.put("中",0);
        }else {
            Long  count = (Long) getHibernateTemplate().find(hql,listenClassId,"中").listIterator().next();
            map.put("中",count.intValue());
        }
        String hql4 = "SELECT COUNT(grade) FROM feedBack WHERE listenClassId =?0 and grade=?1";
        if ( getHibernateTemplate().find(hql,listenClassId,"及格").isEmpty()){
            map.put("及格",0);
        }else {
            Long  count = (Long) getHibernateTemplate().find(hql,listenClassId,"及格").listIterator().next();
            map.put("及格",count.intValue());
        }
        String hql5 = "SELECT COUNT(grade) FROM feedBack WHERE listenClassId =?0 and grade=?1";
        if ( getHibernateTemplate().find(hql,listenClassId,"不及格").isEmpty()){
            map.put("不及格",0);
        }else {
            Long  count = (Long) getHibernateTemplate().find(hql,listenClassId,"不及格").listIterator().next();
            map.put("不及格",count.intValue());
        }




        return map;
    }

    @Override
    public List<feedBack> findFeedBackByTea(feedBack feedBack) {
        String tea = feedBack.getListenClassTeachers();
        String hql = "from feedBack where listenClassTeachers like ?0 ";


        return (List<feedBack>) getHibernateTemplate().find(hql,"%"+tea+"%");
    }
}
