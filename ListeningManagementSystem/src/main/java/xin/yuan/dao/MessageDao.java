package xin.yuan.dao;

import xin.yuan.entity.Message;
import xin.yuan.entity.Student;


import java.util.List;

public interface MessageDao {
    int findTotalRecordsBystudent(Student student);

    List findMessageWithPage(int startIndex, int pageSize,Student student);

    void addMessage(Message message);

    int findTotalRecords();

    List<Message> findMessageWithPageByTeacher(int startIndex, int pageSize);

    void replayMessage(Message message);

    List<Message> findAllMessages(int startIndex, int pageSize);

    Message teacherResponseById(Message message);
}
