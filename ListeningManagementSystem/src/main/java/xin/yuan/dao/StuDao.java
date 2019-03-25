package xin.yuan.dao;

import xin.yuan.entity.Student;

import java.util.List;


/*
 *学生登录Dao接口
 *

 */

public interface StuDao {

    Student stuLogin(Student student);

    Student findStudentByID(Student student);

    void updateStudent(Student student);

    Student findStudentWithOne(Student student);

    void addStudent(Student student);
}
