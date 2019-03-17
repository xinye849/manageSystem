package xin.yuan.dao.impl;

import org.springframework.orm.hibernate5.support.HibernateDaoSupport;
import xin.yuan.dao.AdminDao;
import xin.yuan.entity.Admin;
import xin.yuan.entity.Student;
import xin.yuan.entity.Teacher;

import java.util.List;

/**
 * @authorknightx
 * @create2019/1/16
 * @since 1.0.0
 */
public class AdminDaoImpl extends HibernateDaoSupport implements AdminDao {

    @Override
    //public List<Admin> adminLogin(Admin admin) {

    public Admin adminLogin(Admin admin) {
       if (getHibernateTemplate().findByExample(admin,0,1).isEmpty()){
          return null;
        }
        return (Admin)getHibernateTemplate().findByExample(admin,0,1).get(0);



    }

    @Override
    public Admin findAdminByID(Admin admin) {

        return getHibernateTemplate().get(admin.getClass(),admin.getAdminId());
    }

    @Override
    public void updateAdmin(Admin admin) {
        Admin adm = getHibernateTemplate().get(admin.getClass(),admin.getAdminId());
        adm.setAdminName(admin.getAdminName());
        adm.setAdminAccount(admin.getAdminAccount());
        adm.setAdminPassword(admin.getAdminPassword());
        adm.setGender(admin.getGender());
        getHibernateTemplate().update(adm);
    }
}
