package xin.yuan.entity;

import javax.persistence.*;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionBindingEvent;
import javax.servlet.http.HttpSessionBindingListener;
import java.io.Serializable;
import java.util.Map;
import java.util.Objects;

/**
 * @authorknightx
 * @create2019/1/16
 * @since 1.0.0
 */
@Entity
@Table(name = "L_admin")
public class Admin implements Serializable, HttpSessionBindingListener {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "admin_id")
    private Long adminId;
    @Column(name = "admin_name")
    private String adminName;
    @Column(name = "admin_account")
    private String adminAccount;
    @Column(name = "admin_password")
    private  String adminPassword;
    @Column(name = "admin_gender")
    private  String gender;
    @Column(name = "admin_status")
    private String adminStatus;

    @Column(name = "type")
    private String type;


    public Long getAdminId() {
        return adminId;
    }

    public void setAdminId(Long adminId) {
        this.adminId = adminId;
    }

    public String getAdminName() {
        return adminName;
    }

    public void setAdminName(String adminName) {
        this.adminName = adminName;
    }

    public String getAdminAccount() {
        return adminAccount;
    }

    public void setAdminAccount(String adminAccount) {
        this.adminAccount = adminAccount;
    }

    public String getAdminPassword() {
        return adminPassword;
    }

    public void setAdminPassword(String adminPassword) {
        this.adminPassword = adminPassword;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getAdminStatus() {
        return adminStatus;
    }

    public void setAdminStatus(String adminStatus) {
        this.adminStatus = adminStatus;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    @Override
    public String toString() {
        return "Admin{" +
                "adminId=" + adminId +
                ", adminName='" + adminName + '\'' +
                ", adminAccount='" + adminAccount + '\'' +
                ", adminPassword='" + adminPassword + '\'' +
                ", gender='" + gender + '\'' +
                ", adminStatus='" + adminStatus + '\'' +
                ", adminStatus='" + type + '\'' +
                '}';
    }

    @Override
    public void valueBound(HttpSessionBindingEvent event) {
        HttpSession session = event.getSession();
        Map<Admin,HttpSession> userMap = (Map<Admin, HttpSession>) session.getServletContext().getAttribute("userMap");
        userMap.put(this,session);

    }

    @Override
    public void valueUnbound(HttpSessionBindingEvent event) {
        HttpSession session = event.getSession();
        // 获得人员列表
        Map<Admin, HttpSession> userMap = (Map<Admin, HttpSession>) session
                .getServletContext().getAttribute("userMap");
        // 将用户移除了
        userMap.remove(this);
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }
        Admin admin = (Admin) o;
        return adminAccount.equals(admin.adminAccount) &&
                adminPassword.equals(admin.adminPassword);
    }

    @Override
    public int hashCode() {
        return Objects.hash(adminAccount, adminPassword);
    }
}
