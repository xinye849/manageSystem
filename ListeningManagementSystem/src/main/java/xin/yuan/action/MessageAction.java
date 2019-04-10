package xin.yuan.action;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import net.sf.json.JSONObject;
import org.apache.struts2.ServletActionContext;
import xin.yuan.entity.Message;
import xin.yuan.entity.Student;
import xin.yuan.service.MessageService;
import xin.yuan.utils.PageModel;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * @authorknightx
 * @create2019/1/19
 * @since 1.0.0
 */
public class MessageAction extends ActionSupport implements ModelDriven {
    private Message message = new Message();
    private MessageService messageService;

    public void setMessageService(MessageService messageService) {
        this.messageService = messageService;
    }
    @Override
    public Message getModel() {
        return message;
    }



//查看当前学生的师生交流信息
    public String findMessageWithPage(){

        HttpServletRequest request = ServletActionContext.getRequest();
        int currentNum = Integer.parseInt(request.getParameter("num"));
        HttpSession session = request.getSession();
        Student stu = (Student)session.getAttribute("existUser");

        PageModel pm = messageService.findMessageWithPage(currentNum,stu);
        request.setAttribute("pageModel",pm);



        return SUCCESS;
    }


    //查看所有的信息
    public String findAllMessages(){
        //获取当前页
        HttpServletRequest request = ServletActionContext.getRequest();
        int currentPageNum = Integer.parseInt(request.getParameter("num"));
        PageModel pm = messageService.findAllMessages(currentPageNum);
        request.setAttribute("pageModel",pm);
        return SUCCESS;
    }

    public String addMessageUI(){


        return SUCCESS;
    }

    public String addMessage(){

        HttpServletRequest request = ServletActionContext.getRequest();
       // String content = request.getParameter("content");
        Student stu = (Student)request.getSession().getAttribute("existUser");


        message.setStuId(new Integer(String.valueOf(stu.getStuId())));
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        String levelWordTime = sdf.format(new Date());
        message.setLevelWordTime(levelWordTime);
        messageService.addMessage(message);


        return SUCCESS;
    }

    public String findMessageWithPageByTeacher(){

//获取当前页
        HttpServletRequest request = ServletActionContext.getRequest();
       int currentPageNum = Integer.parseInt(request.getParameter("num"));
       PageModel pm = messageService.findMessageWithPageByTeacher(currentPageNum);
       request.setAttribute("pageModel",pm);
        return SUCCESS;
    }

    public String replayUI(){
        HttpServletRequest request = ServletActionContext.getRequest();
        String msgId = request.getParameter("id");
        request.setAttribute("msgId",msgId);


        return SUCCESS;
    }
    //回复消息内容
    public String replayMessage(){
        messageService.replayMessage(message);





        return SUCCESS;
    }

    public String teacherResponseById(){
        Message m =messageService.teacherResponseById(message);

        ServletActionContext.getRequest().setAttribute("message",m);

        return SUCCESS;
    }
}
