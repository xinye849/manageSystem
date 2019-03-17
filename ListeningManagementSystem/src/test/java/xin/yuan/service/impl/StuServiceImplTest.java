package xin.yuan.service.impl;

import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import xin.yuan.entity.Student;
import xin.yuan.service.StuService;

import java.util.List;

import static org.junit.Assert.*;

public class StuServiceImplTest {

    @Test
    public void stuLogin() {
        Student student = new Student();
        student.setStuName("jj");
        student.setStuAccount("123");
        ApplicationContext ac = new ClassPathXmlApplicationContext("applicationContext.xml");
        StuService service = (StuService) ac.getBean("stuService");
        //List<Student> list = service.stuLogin(student);
        //if (list==null&&list.equals("[]")) {
            System.out.println("木有学生：" );
        }
       // System.out.println(list.equals("[]"));
   // }

}