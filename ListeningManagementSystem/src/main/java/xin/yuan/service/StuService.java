package xin.yuan.service;

import xin.yuan.entity.Student;

import java.util.List;

public interface StuService {
    Student stuLogin(Student student);

    Student findStudentByID(Student student);

    void updateStudent(Student student);
}
