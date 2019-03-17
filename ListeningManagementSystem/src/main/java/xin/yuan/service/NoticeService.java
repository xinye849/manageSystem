package xin.yuan.service;

import java.util.List;
import java.util.Map;

public interface NoticeService {
    List<Object> newNotice();

    List<Object> allNotice();

    List<Object> getPost(int id);
}
