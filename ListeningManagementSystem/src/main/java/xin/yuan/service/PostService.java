package xin.yuan.service;

import xin.yuan.entity.Post;

import java.util.List;

public interface PostService {
    int addPost(Post post);

    List<Object> newPosts();

    List<Object> hotPosts();
}
