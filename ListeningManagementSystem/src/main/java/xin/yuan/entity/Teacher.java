package xin.yuan.entity;

import javax.persistence.*;
import java.io.Serializable;

/**
 * @authorknightx
 * @create2019/1/16
 * @since 1.0.0
 */
@Entity
@Table(name = "L_teacher")
public class Teacher implements Serializable {
   @Id
   @GeneratedValue(strategy = GenerationType.IDENTITY)
   @Column(name = "tea_id")
    private Long teaId;
   @Column(name = "tea_name")
    private String teaName;
   @Column(name = "tea_account")
    private String teaAccount;
   @Column(name = "tea_password")
    private String teaPassword;
   @Column(name = "tea_gender")
    private String gender;
   @Column(name = "tea_status")
    private String teaStatus;


    public Long getTeaId() {
        return teaId;
    }

    public void setTeaId(Long teaId) {
        this.teaId = teaId;
    }

    public String getTeaName() {
        return teaName;
    }

    public void setTeaName(String teaName) {
        this.teaName = teaName;
    }

    public String getTeaAccount() {
        return teaAccount;
    }

    public void setTeaAccount(String teaAccount) {
        this.teaAccount = teaAccount;
    }

    public String getTeaPassword() {
        return teaPassword;
    }

    public void setTeaPassword(String teaPassword) {
        this.teaPassword = teaPassword;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getTeaStatus() {
        return teaStatus;
    }

    public void setTeaStatus(String teaStatus) {
        this.teaStatus = teaStatus;
    }

    @Override
    public String toString() {
        return "Teacher{" +
                "teaId=" + teaId +
                ", teaName='" + teaName + '\'' +
                ", teaAccount='" + teaAccount + '\'' +
                ", teaPassword='" + teaPassword + '\'' +
                ", gender='" + gender + '\'' +
                ", teaStatus='" + teaStatus + '\'' +
                '}';
    }
}
