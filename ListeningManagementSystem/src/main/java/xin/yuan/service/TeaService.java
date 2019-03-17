package xin.yuan.service;


import xin.yuan.entity.Teacher;
import xin.yuan.utils.PageModel;

import java.util.List;

public interface TeaService {
    Teacher teaLogin(Teacher teacher);

    PageModel findTeachersWithPage(int currentNum);

    void addTeacher(Teacher teacher);

    Teacher findTeacherWithOne(Teacher teacher);

    void delTeacherById(Teacher teacher);

    void updateTeacher(Teacher teacher);

    List findAllTeacher();
}
