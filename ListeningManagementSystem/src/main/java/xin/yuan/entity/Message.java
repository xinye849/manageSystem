package xin.yuan.entity;

import org.hibernate.annotations.DynamicUpdate;

import javax.persistence.*;
import java.io.Serializable;

/**
 * @authorknightx
 * @create2019/1/19
 * @since 1.0.0
 */
@Entity
@Table(name = "L_message")
@DynamicUpdate(true)
public class Message implements Serializable {

@Id
@GeneratedValue(strategy = GenerationType.IDENTITY)
@Column(name = "message_id")
    private int messageId;//留言编号
    @Column(name = "message_content")
    private String content;//留言内容
    @Column(name = "message_levelWordTime")
    private String levelWordTime;//留言时间
    @Column(name = "stu_id")
    private int stuId;//当前登录在系统中学生的编号
    @Column(name = "message_replay")
    private String replay;//老师的回复内容
    @Column(name = "message_replayTime")
    private String replayTime;//老师的回复时间


    public int getMessageId() {
        return messageId;
    }

    public void setMessageId(int messageId) {
        this.messageId = messageId;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getLevelWordTime() {
        return levelWordTime;
    }

    public void setLevelWordTime(String levelWordTime) {
        this.levelWordTime = levelWordTime;
    }

    public int getStuId() {
        return stuId;
    }

    public void setStuId(int stuId) {
        this.stuId = stuId;
    }

    public String getReplay() {
        return replay;
    }

    public void setReplay(String replay) {
        this.replay = replay;
    }

    public String getReplayTime() {
        return replayTime;
    }

    public void setReplayTime(String replayTime) {
        this.replayTime = replayTime;
    }

    @Override
    public String toString() {
        return "Message{" +
                "messageId=" + messageId +
                ", content='" + content + '\'' +
                ", levelWordTime='" + levelWordTime + '\'' +
                ", stuId=" + stuId +
                ", replay='" + replay + '\'' +
                ", replayTime='" + replayTime + '\'' +
                '}';
    }
}
