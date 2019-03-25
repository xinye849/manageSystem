package xin.yuan.dao.impl;

import org.springframework.orm.hibernate5.support.HibernateDaoSupport;
import xin.yuan.dao.StuDao;
import xin.yuan.entity.Student;
import xin.yuan.entity.Teacher;

import java.util.List;

/**
 * @authorknightx
 * @create2019/1/15
 * @since 1.0.0
 */
public class StuDaoImpl extends HibernateDaoSupport implements StuDao   {



    //学生登录
    @Override
    public Student stuLogin(Student student) {

if (getHibernateTemplate().findByExample(student,0,1).isEmpty()){
    return null;
}
       return getHibernateTemplate().findByExample(student,0,1).get(0);

    }

    @Override
    public Student findStudentByID(Student student) {

        return getHibernateTemplate().get(student.getClass(),student.getStuId());
    }

    @Override
    public void updateStudent(Student student) {
        Student stu = getHibernateTemplate().get(student.getClass(),student.getStuId());
        stu.setStuName(student.getStuName());
        stu.setStuAccount(student.getStuAccount());
        stu.setStuPassword(student.getStuPassword());
        stu.setGender(student.getGender());
        getHibernateTemplate().update(stu);

    }

    @Override
    public Student findStudentWithOne(Student student) {


        String hql = " from Student where stuAccount=?0";
        if ( getHibernateTemplate().find(hql,student.getStuAccount()).isEmpty()){
            return null;
        }

        return (Student) getHibernateTemplate().find(hql,student.getStuAccount()).get(0);
    }

    @Override
    public void addStudent(Student student) {
        getHibernateTemplate().save(student);
    }
}
