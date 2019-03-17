package xin.yuan.entity;

import org.hibernate.annotations.DynamicUpdate;

import javax.persistence.*;
import java.io.Serializable;

/**
 * @authorknightx
 * @create2019/1/30
 * @since 1.0.0
 */
@Entity
@Table(name = "L_listenClass")
@DynamicUpdate(true)
public class ListenClass implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "listenclass_id")
    private Integer listenClassId;

    @Column(name = "listenClass_date")
    private String listenClassDate;//日期
    @Column(name = "listens")
    private String listens;//节数
    @Column(name = "listenClass_course")
    private String listenClassCourse;//课程
    @Column(name = "listenClass_teachers")
    private String listenClassTeachers;//听课老师
    @Column(name = "listenClass_lectureTeacher")
    private String listenClassLectureTeacher;//讲课老师
    @Column(name = "classRoom")
    private String classRoom;//听课地点


    public Integer getListenClassId() {
        return listenClassId;
    }

    public void setListenClassId(Integer listenClassId) {
        this.listenClassId = listenClassId;
    }



    public String getListenClassDate() {
        return listenClassDate;
    }

    public void setListenClassDate(String listenClassDate) {
        this.listenClassDate = listenClassDate;
    }

    public String getListens() {
        return listens;
    }

    public void setListens(String listens) {
        this.listens = listens;
    }

    public String getListenClassCourse() {
        return listenClassCourse;
    }

    public void setListenClassCourse(String listenClassCourse) {
        this.listenClassCourse = listenClassCourse;
    }

    public String getListenClassTeachers() {
        return listenClassTeachers;
    }

    public void setListenClassTeachers(String listenClassTeachers) {
        this.listenClassTeachers = listenClassTeachers;
    }

    public String getListenClassLectureTeacher() {
        return listenClassLectureTeacher;
    }

    public void setListenClassLectureTeacher(String listenClassLectureTeacher) {
        this.listenClassLectureTeacher = listenClassLectureTeacher;
    }

    public String getClassRoom() {
        return classRoom;
    }

    public void setClassRoom(String classRoom) {
        this.classRoom = classRoom;
    }

    @Override
    public String toString() {
        return "ListenClass{" +
                "listenClassId=" + listenClassId +

                ", listenClassDate='" + listenClassDate + '\'' +
                ", listens='" + listens + '\'' +
                ", listenClassCourse='" + listenClassCourse + '\'' +
                ", listenClassTeachers='" + listenClassTeachers + '\'' +
                ", listenClassLectureTeacher='" + listenClassLectureTeacher + '\'' +
                ", classRoom='" + classRoom + '\'' +
                '}';
    }
}
