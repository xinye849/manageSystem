package xin.yuan.service.impl;

import xin.yuan.dao.AdminDao;
import xin.yuan.entity.Admin;
import xin.yuan.entity.Student;
import xin.yuan.service.AdminService;

import java.util.List;

/**
 * @authorknightx
 * @create2019/1/16
 * @since 1.0.0
 */
public class AdminServiceImpl implements AdminService {
    private AdminDao adminDao;

    public void setAdminDao(AdminDao adminDao) {
        this.adminDao = adminDao;
    }

    @Override
    //public List<Admin> adminLogin(Admin admin) {
        public Admin adminLogin(Admin admin) {
        return adminDao.adminLogin(admin);

    }

    @Override
    public Admin findAdminByID(Admin admin) {

        return adminDao.findAdminByID(admin);
    }

    @Override
    public void updateAdmin(Admin admin) {
        adminDao.updateAdmin(admin);
    }
}
