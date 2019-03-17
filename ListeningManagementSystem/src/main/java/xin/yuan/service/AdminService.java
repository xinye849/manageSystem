package xin.yuan.service;

import xin.yuan.entity.Admin;


import java.util.List;

public interface AdminService {
    //List<Admin> adminLogin(Admin admin);
    Admin adminLogin(Admin admin);

    Admin findAdminByID(Admin admin);

    void updateAdmin(Admin admin);
}
