package xin.yuan.service.impl;

import xin.yuan.dao.NoticeDao;
import xin.yuan.service.NoticeService;

import java.util.List;

/**
 * @authorknightx
 * @create2019/3/17
 * @since 1.0.0
 */
public class NoticeServiceImpl implements NoticeService {
    NoticeDao noticeDao;

    public void setNoticeDao(NoticeDao noticeDao) {
        this.noticeDao = noticeDao;
    }

    @Override
    public List<Object> newNotice()
    {
        return noticeDao.newNotice();
    }

    @Override
    public List<Object> allNotice() {


        return noticeDao.allNotice();
    }

    @Override
    public List<Object> getPost(int id) {

        return noticeDao.getPost(id);
    }
}
