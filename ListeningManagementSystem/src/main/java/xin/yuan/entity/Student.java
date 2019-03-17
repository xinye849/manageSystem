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
 * @create2019/1/15
 * @since 1.0.0
 */

@Entity
@Table(name = "L_student")
public class Student implements Serializable {
@Id
@GeneratedValue(strategy = GenerationType.IDENTITY)
@Column(name = "stu_id")
    private Long stuId;
@Column(name = "stu_name")
    private String stuName;
@Column(name = "stu_account")
    private String stuAccount;
@Column(name = "stu_password")
    private String stuPassword;
@Column(name = "stu_gender")
    private String gender;
@Column(name = "stu_status")
    private String stuStatus;
@Column(name = "classRoom")
private String classRoom;

    @Column(name = "type")
    private String type;

    public String getClassRoom() {
        return classRoom;
    }

    public void setClassRoom(String classRoom) {
        this.classRoom = classRoom;
    }

    public Long getStuId() {
        return stuId;
    }

    public void setStuId(Long stuId) {
        this.stuId = stuId;
    }

    public String getStuName() {
        return stuName;
    }

    public void setStuName(String stuName) {
        this.stuName = stuName;
    }

    public String getStuAccount() {
        return stuAccount;
    }

    public void setStuAccount(String stuAccount) {
        this.stuAccount = stuAccount;
    }

    public String getStuPassword() {
        return stuPassword;
    }

    public void setStuPassword(String stuPassword) {
        this.stuPassword = stuPassword;
    }



    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getStuStatus() {
        return stuStatus;
    }

    public void setStuStatus(String stuStatus) {
        this.stuStatus = stuStatus;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }


    @Override
    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }
        Student student = (Student) o;
        return stuAccount.equals(student.stuAccount) &&
                stuPassword.equals(student.stuPassword);
    }

    @Override
    public int hashCode() {
        return Objects.hash(stuAccount, stuPassword);
    }

    /*@Override
    *//*当对象一存入httpsession中时，此对象会立即执行此方法*//*
    public void valueBound(HttpSessionBindingEvent event) {


        HttpSession session = event.getSession();
        Map<Student,HttpSession> userMap = (Map<Student, HttpSession>) session.getServletContext().getAttribute("userMap");
        userMap.put(this,session);


    }

    @Override
    //当对象从httpsession中移除时，会执行此方法
    public void valueUnbound(HttpSessionBindingEvent event) {
        HttpSession session = event.getSession();
        // 获得人员列表
        Map<Student, HttpSession> userMap = (Map<Student, HttpSession>) session
                .getServletContext().getAttribute("userMap");
        // 将用户移除了
        userMap.remove(this);

    }*/

    @Override
    public String toString() {
        return "Student{" +
                "stuId=" + stuId +
                ", stuName='" + stuName + '\'' +
                ", stuAccount='" + stuAccount + '\'' +
                ", stuPassword='" + stuPassword + '\'' +
                ", gender='" + gender + '\'' +
                ", stuStatus='" + stuStatus + '\'' +
                ", type='" + type+
                '}';
    }
}
