package xin.yuan.dao.impl;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.query.Query;
import org.springframework.orm.hibernate5.HibernateCallback;
import org.springframework.orm.hibernate5.support.HibernateDaoSupport;
import xin.yuan.dao.TeaDao;
import xin.yuan.entity.Teacher;

import java.util.List;

/**
 * @authorknightx
 * @create2019/1/16
 * @since 1.0.0
 */
public class TeaDaoImpl extends HibernateDaoSupport implements TeaDao {
    @Override
    public Teacher teaLogin(Teacher teacher) {
        if (getHibernateTemplate().findByExample(teacher,0,1).isEmpty()){
            return null;
        }
        return getHibernateTemplate().findByExample(teacher,0,1).get(0);
    }

    @Override
    public int findTotalRecords() {
        String hql = "select count(*) from Teacher ";
        Long count = (Long)getHibernateTemplate().find(hql).listIterator().next();
        Integer countt= new Integer(String.valueOf(count));
        return countt.intValue();
    }

    @Override
    //拿到当前页数据
    public List findTeachersWithPage(final int i, final int pageSize) {
         return (List) getHibernateTemplate().execute(
                new HibernateCallback()
                {
                    @Override
                    public Object doInHibernate(Session session) throws HibernateException
                    {
                        Query query = session.createQuery("from Teacher");
                       query.setFirstResult(i);
                       query.setMaxResults(pageSize);
                       return query.list();
                    }

                });
    }

    @Override
    public void addTeacher(Teacher teacher) {
        getHibernateTemplate().save(teacher);
    }

    @Override
    public Teacher findTeacherWithOne(Teacher teacher) {
        String hql = " from Teacher where teaAccount=?0";
        if ( getHibernateTemplate().find(hql,teacher.getTeaAccount()).isEmpty()){
            return null;
        }

        return (Teacher)getHibernateTemplate().find(hql,teacher.getTeaAccount()).get(0);
    }

    @Override
    public void delTeacherById(Teacher teacher) {
        getHibernateTemplate().delete(teacher);
    }

    @Override
    public void updateTeacher(Teacher teacher) {
        Teacher tea = getHibernateTemplate().get(teacher.getClass(),teacher.getTeaId());
        tea.setTeaName(teacher.getTeaName());
        tea.setTeaAccount(teacher.getTeaAccount());
        tea.setTeaPassword(teacher.getTeaPassword());
        tea.setGender(teacher.getGender());
        getHibernateTemplate().update(tea);
    }

    @Override
    public List findAllTeacher() {
        String hql = "from Teacher ";
        List list = getHibernateTemplate().find(hql);
        return list;
    }
}
