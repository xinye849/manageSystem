package xin.yuan.service.impl;

import xin.yuan.dao.PostDao;
import xin.yuan.entity.Post;
import xin.yuan.service.PostService;

import java.util.List;

/**
 * @authorknightx
 * @create2019/3/13
 * @since 1.0.0
 */
public class PostServiceImpl implements PostService {
    PostDao postDao;

    public void setPostDao(PostDao postDao) {
        this.postDao = postDao;
    }

    @Override
    public int addPost(Post post) {


        return postDao.addPost(post);
    }

    @Override
    public List<Object> newPosts() {

        return postDao.newPosts();
    }

    @Override
    public List<Object> hotPosts() {

        return postDao.hotPost();
    }


}
