package xin.yuan.dao;

import java.util.List;

public interface CommentDao {
    List<Object> getCommentByPostID(int postID, int page);

    int getTotalCommentPagesByPostId(int postID);

    int addCommentByPostID(int userID, int postID, String content);
}
