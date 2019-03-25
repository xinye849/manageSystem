package xin.yuan.service;

import java.util.List;

public interface CommentService {
    List<Object> getCommentByPostID(int postID, int page);

    int getTotalCommentPagesByPostId(int postID);

    int addCommentByPostID(int userID, int postID, String content);
}
