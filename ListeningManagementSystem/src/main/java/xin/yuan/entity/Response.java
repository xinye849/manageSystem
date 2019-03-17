package xin.yuan.entity;

import javax.persistence.*;
import java.io.Serializable;

/**
 * @authorknightx
 * @create2019/3/1
 * @since 1.0.0
 */

@Entity
@Table(name = "L_response")
public class Response implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "response_id")
    private int responseID; //回復ID
    @Column(name = "message_id")
    private int messageID;//問題ID
    @Column(name = "wu_id")
    private String wuID;//用戶賬戶
    @Column(name = "reply_message")
    private String replyMessage;//回復內容
    @Column(name = "reply_time")
    private String replyTime;//回復時間


    public int getResponseID() {
        return responseID;
    }

    public void setResponseID(int responseID) {
        this.responseID = responseID;
    }

    public int getMessageID() {
        return messageID;
    }

    public void setMessageID(int messageID) {
        this.messageID = messageID;
    }

    public String getWuID() {
        return wuID;
    }

    public void setWuID(String wuID) {
        this.wuID = wuID;
    }

    public String getReplyMessage() {
        return replyMessage;
    }

    public void setReplyMessage(String replyMessage) {
        this.replyMessage = replyMessage;
    }

    public String getReplyTime() {
        return replyTime;
    }

    public void setReplyTime(String replyTime) {
        this.replyTime = replyTime;
    }


    @Override
    public String toString() {
        return "Response{" +
                "responseID=" + responseID +
                ", messageID=" + messageID +
                ", wuID='" + wuID + '\'' +
                ", replyMessage='" + replyMessage + '\'' +
                ", replyTime='" + replyTime + '\'' +
                '}';
    }
}
