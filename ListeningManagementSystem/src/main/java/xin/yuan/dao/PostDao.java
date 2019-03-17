package xin.yuan.dao;

import xin.yuan.entity.Post;

import java.util.List;

public interface PostDao {
    int addPost(Post post);

    List<Object> newPosts();

    List<Object> hotPost();
}
