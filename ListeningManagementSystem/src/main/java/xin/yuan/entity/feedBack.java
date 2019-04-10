package xin.yuan.entity;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import javax.persistence.*;
import java.io.Serializable;


/**
 * @author knightx
 * @create 2019/3/29
 * @since 1.0.0
 */

@Entity
@Table(name = "l_feedBack")
@Getter
@Setter
@ToString
public class feedBack implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private int id;
    @Column(name = "listenClassId")
    private int listenClassId;
    @Column(name = "listenClassLectureTeacher")
    private String listenClassLectureTeacher;//讲课老师
    @Column(name = "position")
    private String position;
    @Column(name = "department")
    private String department;
    @Column(name = "listenClassDate")
    private String listenClassDate;
    @Column(name = "listens")
    private String listens;
    @Column(name = "listenClass")
    private String listenClass;
    @Column(name = "shouldStu")
    private String shouldStu;
    @Column(name = "actuallyStu")
    private String actuallyStu;
    @Column(name = "lateStu")
    private String lateStu;
    @Column(name = "earlyStu")
    private String earlyStu;
    @Column(name = "content")
    private String content;
    @Column(name = "arrangement")
    private String arrangement;
    @Column(name = "score")
    private String score;
    @Column(name = "grade")
    private String grade;
    @Column(name = "totalScore")
    private String totalScore;
    @Column(name = "suggest")
    private String suggest;
    @Column(name = "listenClassTeachers")
    private String listenClassTeachers;
    @Column(name = "listenClassPosition")
    private String listenClassPosition;
    @Column(name = "listenClassDepartment")
    private String listenClassDepartment;


}
