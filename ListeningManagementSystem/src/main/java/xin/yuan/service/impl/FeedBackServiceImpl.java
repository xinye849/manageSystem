package xin.yuan.service.impl;

import xin.yuan.dao.FeedBackDao;
import xin.yuan.dao.ListenClassDao;
import xin.yuan.entity.feedBack;
import xin.yuan.service.FeedBackService;
import xin.yuan.service.ListenClassService;

import java.util.List;
import java.util.Map;

/**
 * @authorknightx
 * @create2019/3/30
 * @since 1.0.0
 */
public class FeedBackServiceImpl implements FeedBackService {
    private FeedBackDao feedBackDao;
    private ListenClassDao listenClassDao;

    public void setFeedBackDao(FeedBackDao feedBackDao) {
        this.feedBackDao = feedBackDao;
    }

    public void setListenClassDao(ListenClassDao listenClassDao) {
        this.listenClassDao = listenClassDao;
    }

    @Override
    public void saveFeedBackById(feedBack feedBack) {
        feedBackDao.saveFeedBackById(feedBack);
        listenClassDao.updateListenById(feedBack.getListenClassId());

    }

    @Override
    public List<feedBack> findFeedBackById(int listenClassId) {

        return feedBackDao.findFeedBackById(listenClassId);
    }

    @Override
    public feedBack findFeedBackByOne(int id) {

        return feedBackDao.findFeedBackByOne(id);
    }

    @Override
    public Map<String,Integer> findGradeByListenId(int listenClassId) {

        return feedBackDao.findGradeByListenId(listenClassId);
    }

    @Override
    public List<feedBack> findFeedBackByTea(feedBack feedBack) {

        return feedBackDao.findFeedBackByTea(feedBack);
    }
}
