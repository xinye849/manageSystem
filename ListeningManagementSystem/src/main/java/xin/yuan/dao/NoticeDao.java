package xin.yuan.dao;

import java.util.List;

public interface NoticeDao {
    List<Object> newNotice();

    List<Object> allNotice();

    List<Object> getPost(int id);
}
