package xin.yuan.dao;

import xin.yuan.entity.ListenClass;

import java.util.List;

public interface ListenClassDao {
    void addListenClass(ListenClass listenClass);

    List fingAllListens();

    List findTeacherListensByName(String teaName);

    List<ListenClass> findStudentListensByClassRoom(String classRoom);
}
