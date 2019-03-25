package xin.yuan.dao.impl;

import org.springframework.dao.support.DaoSupport;
import org.springframework.orm.hibernate5.support.HibernateDaoSupport;
import xin.yuan.dao.ListenClassDao;
import xin.yuan.entity.ListenClass;

import java.util.List;

/**
 * @authorknightx
 * @create2019/1/30
 * @since 1.0.0
 */
public class ListenClassDaoImpl extends HibernateDaoSupport implements ListenClassDao {
    @Override
    public void addListenClass(ListenClass listenClass) {
        getHibernateTemplate().save(listenClass);

    }

    @Override
    public List fingAllListens() {
        String hql = "from ListenClass";
      return   getHibernateTemplate().find(hql);
    }

    @Override
    public List findTeacherListensByName(String teaName) {

       List<ListenClass> list =  (List<ListenClass>)getHibernateTemplate().find("from ListenClass l where l.listenClassLectureTeacher like ?0", "%"+teaName+"%");


       if (list.isEmpty()){
return null;
       }

        return list;
    }

    @Override
    public List<ListenClass> findStudentListensByClassRoom(String classRoom) {
        List<ListenClass> list =  (List<ListenClass>)getHibernateTemplate().find("from ListenClass l  where l.classRoom=?0",classRoom);
        if (list.isEmpty()){
            return null;
        }

        return list;
    }

    @Override
    public List<ListenClass> findTeacherListensByName2(String teaName) {

        List<ListenClass> list =  (List<ListenClass>)getHibernateTemplate().find("from ListenClass l where l.listenClassTeachers like ?0", "%"+teaName+"%");


        if (list.isEmpty()){
            return null;
        }

        return list;
    }


}
