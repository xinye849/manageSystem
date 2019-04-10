package xin.yuan.service;

import xin.yuan.entity.ListenClass;

import java.util.List;

public interface ListenClassService {
    void addListenClass(ListenClass listenClass);

    List fingAllListens();

    List<ListenClass> findTeacherListensByName(String teaName);

    List<ListenClass> findStudentListensByClassRoom(String classRoom);

    List<ListenClass> findTeacherListensByName2(String teaName);

    void updateListenById(int id);
}
