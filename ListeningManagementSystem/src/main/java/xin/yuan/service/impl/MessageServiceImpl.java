package xin.yuan.service.impl;

import xin.yuan.dao.MessageDao;
import xin.yuan.entity.Message;
import xin.yuan.entity.Student;
import xin.yuan.service.MessageService;
import xin.yuan.utils.PageModel;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * @authorknightx
 * @create2019/1/19
 * @since 1.0.0
 */
public class MessageServiceImpl implements MessageService {
        MessageDao messageDao;

    public void setMessageDao(MessageDao messageDao) {
        this.messageDao = messageDao;
    }

    @Override
    public PageModel findMessageWithPage(int currentNum, Student student) {
        //计算分页参数
         int totalRecords =messageDao. findTotalRecordsBystudent(student);
        PageModel pm = new PageModel(currentNum,totalRecords,5);

        //得到当前页的message列表
        List<Message> list = messageDao.findMessageWithPage(pm.getStartIndex(),pm.getPageSize(),student);
        pm.setList(list );
        pm.setUrl("findMessageWithPage");
        return pm;
    }

    @Override
    public void addMessage(Message message) {
        messageDao.addMessage(message);
    }

    @Override
    public PageModel findMessageWithPageByTeacher(int currentPageNum) {

        int totalRecords = messageDao.findTotalRecords();
        PageModel pm = new PageModel(currentPageNum,totalRecords,5);

        List<Message> list = messageDao.findMessageWithPageByTeacher(pm.getStartIndex(),pm.getPageSize());
        pm.setList(list);
        pm.setUrl("findMessageWithPageByTeacher");
        return pm;
    }

    @Override
    public void replayMessage(Message message) {
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
        message.setReplayTime(simpleDateFormat.format(new Date()));
        messageDao.replayMessage(message);
    }

    @Override
    public PageModel findAllMessages(int currentNum) {

        int totalRecords = messageDao.findTotalRecords();
        PageModel pm = new PageModel(currentNum,totalRecords,5);

        List<Message> list = messageDao.findAllMessages(pm.getStartIndex(),pm.getPageSize());
        pm.setList(list);
        pm.setUrl("findAllMessages");
        return pm;
    }
}
