package xin.yuan.entity;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
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
@Setter
@Getter
@ToString
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
    @Column(name = "status")
    private int status;



}
