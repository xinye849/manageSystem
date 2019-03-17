package xin.yuan.dao.impl;

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
        String sql = "from Notice ORDER BY publishTime DESC limit 0,5";



        return (List<Object>) getHibernateTemplate().find(sql);
    }
}
