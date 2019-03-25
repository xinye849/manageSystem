package xin.yuan.dao;

import xin.yuan.entity.Post;

import java.util.List;
import java.util.Map;

public interface PostDao {
    int addPost(Post post);

    List<Object> newPosts();

    List<Object> hotPosts();

    List<Object> getPost(int postID);

    int addPageView(int postID);

    List<Object> getAllPosts();

    List<Map<String, Object>> posts(String sql);
}
