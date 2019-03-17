package xin.yuan.dao.impl;

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
        String sql = "from Post ORDER BY publishTime DESC limit 0,5";

        return (List<Object>) getHibernateTemplate().find(sql);
    }

    @Override
    public List<Object> hotPost() {
        String sql = "from Post ORDER BY pageview DESC limit 0,5";

        return (List<Object>) getHibernateTemplate().find(sql);
    }
}
