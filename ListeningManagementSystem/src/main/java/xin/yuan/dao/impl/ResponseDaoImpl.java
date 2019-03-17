package xin.yuan.dao.impl;

import org.springframework.orm.hibernate5.support.HibernateDaoSupport;
import xin.yuan.dao.ResponseDao;
import xin.yuan.entity.Response;

/**
 * @authorknightx
 * @create2019/3/1
 * @since 1.0.0
 */
public class ResponseDaoImpl extends HibernateDaoSupport implements ResponseDao {
    @Override
    public void addForumMessage(Response responsezz) {
getHibernateTemplate().save(responsezz);
    }
}
