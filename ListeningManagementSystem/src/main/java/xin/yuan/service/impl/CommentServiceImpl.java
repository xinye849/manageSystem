package xin.yuan.service.impl;

import xin.yuan.dao.CommentDao;
import xin.yuan.service.CommentService;

import java.util.List;

/**
 * @authorknightx
 * @create2019/3/18
 * @since 1.0.0
 */
public class CommentServiceImpl implements CommentService {
    private CommentDao commentDao;

    public void setCommentDao(CommentDao commentDao) {
        this.commentDao = commentDao;
    }

    @Override
    public List<Object> getCommentByPostID(int postID, int page) {

        return commentDao.getCommentByPostID(postID,page);
    }

    @Override
    public int getTotalCommentPagesByPostId(int postID) {

        return commentDao.getTotalCommentPagesByPostId(postID);
    }

    @Override
    public int addCommentByPostID(int userID, int postID, String content) {

        return commentDao.addCommentByPostID(userID, postID, content);
    }
}
