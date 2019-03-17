package xin.yuan.service.impl;

import xin.yuan.dao.StuDao;
import xin.yuan.dao.impl.StuDaoImpl;
import xin.yuan.entity.Student;
import xin.yuan.service.StuService;

import java.util.List;

/**
 * @authorknightx
 * @create2019/1/15
 * @since 1.0.0
 */
public class StuServiceImpl implements StuService {
    private StuDao stuDao ;

    public void setStuDao(StuDao stuDao) {
        this.stuDao = stuDao;
    }

    //学生登录
    @Override
    public Student stuLogin(Student student) {
        return stuDao.stuLogin(student);

    }

    @Override
    public Student findStudentByID(Student student) {

        return stuDao.findStudentByID(student);
    }

    @Override
    public void updateStudent(Student student) {
        stuDao.updateStudent(student);
    }
}
