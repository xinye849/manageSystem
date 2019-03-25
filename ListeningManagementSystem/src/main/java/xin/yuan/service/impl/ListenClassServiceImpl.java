package xin.yuan.service.impl;

import xin.yuan.dao.ListenClassDao;
import xin.yuan.entity.ListenClass;
import xin.yuan.service.ListenClassService;

import java.util.List;

/**
 * @authorknightx
 * @create2019/1/30
 * @since 1.0.0
 */
public class ListenClassServiceImpl implements ListenClassService {
    private ListenClassDao listenClassDao;

    public void setListenClassDao(ListenClassDao listenClassDao) {
        this.listenClassDao = listenClassDao;
    }

    @Override
    public void addListenClass(ListenClass listenClass) {
        listenClassDao.addListenClass(listenClass);
    }

    @Override
    public List fingAllListens() {
         return listenClassDao.fingAllListens();
    }

    @Override
    public List<ListenClass> findTeacherListensByName(String teaName) {


        return listenClassDao.findTeacherListensByName(teaName);
    }

    @Override
    public List<ListenClass> findStudentListensByClassRoom(String classRoom) {

        return listenClassDao.findStudentListensByClassRoom(classRoom);
    }

    @Override
    public List<ListenClass> findTeacherListensByName2(String teaName) {
        return listenClassDao.findTeacherListensByName2(teaName);
    }
}
