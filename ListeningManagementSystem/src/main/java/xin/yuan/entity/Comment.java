package xin.yuan.entity;

import javax.persistence.*;
import java.io.Serializable;

/**
 * @authorknightx
 * @create2019/3/18
 * @since 1.0.0
 */
@Entity
@Table(name = "comment")
public class Comment implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private int id;
    @Column(name = "content")
    private String content;
    @Column(name = "commentTime")
    private String commentTime;
    @Column(name = "post")
    private int post;
    @Column(name = "operator")
    private int operator;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getCommentTime() {
        return commentTime;
    }

    public void setCommentTime(String commentTime) {
        this.commentTime = commentTime;
    }

    public int getPost() {
        return post;
    }

    public void setPost(int post) {
        this.post = post;
    }

    public int getOperator() {
        return operator;
    }

    public void setOperator(int operator) {
        this.operator = operator;
    }

    @Override
    public String toString() {
        return "Comment{" +
                "id=" + id +
                ", content='" + content + '\'' +
                ", commentTime='" + commentTime + '\'' +
                ", post=" + post +
                ", operator=" + operator +
                '}';
    }
}
