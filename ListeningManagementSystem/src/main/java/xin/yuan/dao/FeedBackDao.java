package xin.yuan.dao;

import xin.yuan.entity.feedBack;

import java.util.List;
import java.util.Map;

public interface FeedBackDao {
    void saveFeedBackById(feedBack feedBack);

    List<feedBack> findFeedBackById(int listenClassId);

    feedBack findFeedBackByOne(int id);

    Map<String,Integer> findGradeByListenId(int listenClassId);

    List<feedBack> findFeedBackByTea(feedBack feedBack);
}
