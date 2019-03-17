package xin.yuan.service.impl;

import xin.yuan.dao.TeaDao;
import xin.yuan.entity.Teacher;
import xin.yuan.service.TeaService;
import xin.yuan.utils.PageModel;

import java.util.List;

/**
 * @authorknightx
 * @create2019/1/16
 * @since 1.0.0
 */
public class TeaServiceImpl implements TeaService {
    private TeaDao teaDao;

    public void setTeaDao(TeaDao teaDao) {
        this.teaDao = teaDao;
    }

    @Override
    public Teacher teaLogin(Teacher teacher) {


        return teaDao.teaLogin(teacher);
    }

    @Override
    public PageModel findTeachersWithPage(int currentNum) {
        //拿到总记录数
            int totalRecords = teaDao.findTotalRecords();
            //根据总记录数计算出pagemodel的各项参数
        PageModel pageModel= new PageModel(currentNum,totalRecords,5);
        //拿到当前页的数据
        List<Teacher> list = teaDao.findTeachersWithPage((currentNum-1)*5,pageModel.getPageSize());
        //把当前页数据封装到pagemodel中
        pageModel.setList(list);

        return pageModel;
    }

    @Override
    public void addTeacher(Teacher teacher) {
        teaDao.addTeacher(teacher);
    }

    @Override
    public Teacher findTeacherWithOne(Teacher teacher) {


        return teaDao.findTeacherWithOne(teacher);
    }

    @Override
    public void delTeacherById(Teacher teacher) {
        teaDao.delTeacherById(teacher);
    }

    @Override
    public void updateTeacher(Teacher teacher) {
        teaDao.updateTeacher(teacher);
    }

    @Override
    public List findAllTeacher() {

        return teaDao.findAllTeacher();
    }
}
