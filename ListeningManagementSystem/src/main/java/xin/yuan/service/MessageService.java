package xin.yuan.service;

import xin.yuan.entity.Message;
import xin.yuan.entity.Student;
import xin.yuan.utils.PageModel;

public interface MessageService {
    PageModel findMessageWithPage(int currentNum, Student student);

    void addMessage(Message message);

    PageModel findMessageWithPageByTeacher(int currentPageNum);

    void replayMessage(Message message);

    PageModel findAllMessages(int currentNum);

    Message teacherResponseById(Message message);
}
