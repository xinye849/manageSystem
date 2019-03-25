package xin.yuan.service.impl;

import xin.yuan.dao.PostDao;
import xin.yuan.entity.Post;
import xin.yuan.service.PostService;

import java.util.List;
import java.util.Map;

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

        return postDao.hotPosts();
    }

    @Override
    public List<Object> getPost(int postID) {

        return postDao.getPost(postID);
    }

    @Override
    public int addPageView(int postID) {

        return  postDao.addPageView(postID);
    }

    @Override
    public List<Object> getAllPosts() {

        return  postDao.getAllPosts();
    }

    @Override
    public List<Map<String, Object>> posts(String sql) {

        return postDao.posts(sql);
    }


}
