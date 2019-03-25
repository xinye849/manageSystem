package xin.yuan.dao;

import xin.yuan.entity.Teacher;

import java.util.List;

public interface TeaDao {
    Teacher teaLogin(Teacher teacher);

    int findTotalRecords();

    List findTeachersWithPage(int i, int pageSize);

    void addTeacher(Teacher teacher);

    Teacher findTeacherWithOne(Teacher teacher);

    void delTeacherById(Teacher teacher);

    void updateTeacher(Teacher teacher);

    List findAllTeacher();

    String changeStatus(Teacher teacher);
}
