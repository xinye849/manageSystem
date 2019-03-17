package xin.yuan.service.impl;

import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import xin.yuan.entity.ListenClass;
import xin.yuan.service.ListenClassService;

import static org.junit.Assert.*;

public class ListenClassServiceImplTest {

    @Test
    public void addListenClass() {
        ApplicationContext ac = new ClassPathXmlApplicationContext("applicationContext.xml");
        ListenClassService lc = (ListenClassService)ac.getBean("listenClassService");
        ListenClass listenClass = new ListenClass();
        listenClass.setClassRoom("a6");
        listenClass.setListenClassCourse("yuwen");
        listenClass.setListenClassLectureTeacher("方00丈");
        lc.addListenClass(listenClass);
    }
}