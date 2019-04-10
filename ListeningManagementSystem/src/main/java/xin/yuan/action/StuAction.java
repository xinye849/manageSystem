package xin.yuan.action;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import net.sf.json.JSONObject;
import org.apache.struts2.ServletActionContext;


import org.hibernate.Session;
import xin.yuan.entity.Student;
import xin.yuan.entity.Teacher;
import xin.yuan.service.StuService;
import xin.yuan.utils.Md5Encode;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

/**
 * @authorknightx
 * @create2019/1/15
 * @since 1.0.0
 */
public class StuAction extends ActionSupport implements ModelDriven {
    private StuService stuService;

    public void setStuService(StuService stuService) {
        this.stuService = stuService;
    }

    private Student student = new Student();

    private String stuObj;

    public String getStuObj() {
        return stuObj;
    }

    public void setStuObj(String stuObj) {
        this.stuObj = stuObj;
    }

    @Override
    public Student getModel() {
        return student;
    }


    public String stuLogin() throws UnsupportedEncodingException, NoSuchAlgorithmException {
        //进行md5加密
        String md5Psw = Md5Encode.encodeByMd5(student.getStuPassword());
        student.setStuPassword(md5Psw);

        Student stu = stuService.stuLogin(student);

        if(stu==null){

            HttpServletRequest request = ServletActionContext.getRequest();
            request.setAttribute("msg","用户名或密码错误，请重新登录");

            return ERROR;
        }else {
            //同一浏览器的不同用户登录，把第一个用户注销
            ServletActionContext.getRequest().getSession().removeAttribute("existUser");
            //不同浏览器的同一用户登录，先把登录用户存入application中，在从application中取出，看第二个用户是不是同一个用户，如果是，把第一个注销
            Map<Student, Session> userMap = (Map<Student, Session>) ServletActionContext.getServletContext().getAttribute("userMap");
            if (userMap.containsKey(stu)){
                HttpSession session = (HttpSession) userMap.get(stu);
                session.removeAttribute("existUser");

            }


            HttpSession session = ServletActionContext.getRequest().getSession();
            session.setAttribute("existUser",stu);



        }
        return SUCCESS;
    }


    public String stuLogOut(){
//学生退出，使session失效
        HttpSession session = ServletActionContext.getRequest().getSession();
        /*session.invalidate();//session失效*/
        session.removeAttribute("existUser");

        return SUCCESS;
    }

    public String findStudentByID(){
        Student stu = stuService.findStudentByID(student);
        JSONObject jsonObject = JSONObject.fromObject(stu);
        stuObj = jsonObject.toString();
        return SUCCESS;
    }

    public String updateStudent() throws UnsupportedEncodingException, NoSuchAlgorithmException {
        //进行md5加密
        String md5Psw = Md5Encode.encodeByMd5(student.getStuPassword());
        student.setStuPassword(md5Psw);


        stuService.updateStudent(student);
        ServletActionContext.getRequest().setAttribute("msg","修改成功");
        return SUCCESS;
    }

    public String chatRoomUI(){
        Student stu = (Student) ServletActionContext.getRequest().getSession().getAttribute("existUser");
        Map<Student, HttpSession> userMap = (Map<Student, HttpSession>) ServletActionContext.getServletContext().getAttribute("userMap");
        HttpSession session = ServletActionContext.getRequest().getSession();
        userMap.put(stu,session);
        ServletContext application = ServletActionContext.getServletContext();

        StringBuilder sourceMessage =new StringBuilder();

        if (null != application.getAttribute("message")) {
            sourceMessage = (StringBuilder) application.getAttribute("message");
        }

        sourceMessage.append("系统公告：<font color='gray'>"+ stu.getStuName() + "走进了聊天室！</font><br>");
        application.setAttribute("message", sourceMessage);





        return SUCCESS;
    }

    public String onlineUI(){
        return SUCCESS;
    }
//把application中的message回显到前端
    public void getMessage() throws IOException {
        StringBuilder message = (StringBuilder) ServletActionContext.getServletContext().getAttribute("message");
        if(message != null){
            ServletActionContext.getResponse().getWriter().println(message.toString());
        }
    }

    public void sendMessage() throws IOException {

        // 1.接收数据 。

        String from = ServletActionContext.getRequest().getParameter("from"); // 发言人
        String face = ServletActionContext.getRequest().getParameter("face"); // 表情
        String to = ServletActionContext.getRequest().getParameter("to"); // 接收者
        String color = ServletActionContext.getRequest().getParameter("color"); // 字体颜色
        String content = ServletActionContext.getRequest().getParameter("content"); // 发言内容
        // 发言时间 使用SimpleDateFormat
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        String sendTime = sdf.format(new Date()); // 发言时间
        // 获得ServletContext对象.
        ServletContext application = ServletActionContext.getServletContext();
        //  从ServletContext中获取消息
        StringBuilder sourceMessage = (StringBuilder) application.getAttribute("message");
        // 拼接发言的内容:xx 对 yy 说 xxx

        sourceMessage.append("<font color='blue'><strong>" + from
                + "</strong></font><font color='#CC0000'>" + face
                + "</font>对<font color='green'>[" + to + "]</font>说："
                + "<font color='" + color + "'>" + content + "</font>（"
                + sendTime + "）<br>");
        // 将消息存入到application的范围
        application.setAttribute("message", sourceMessage);
        //回显到前端
        getMessage();

    }

    public String exit(){
        Map<Student,Session> userMap = (Map<Student, Session>) ServletActionContext.getServletContext().getAttribute("userMap");
        userMap.remove(ServletActionContext.getRequest().getSession().getAttribute("existUser"));
        return SUCCESS;
    }

    //页面空跳转
    public String addStudentUI(){


        return SUCCESS;
    }

    public String addStudent() throws UnsupportedEncodingException, NoSuchAlgorithmException {
        //进行md5加密
        String md5Psw = Md5Encode.encodeByMd5(student.getStuPassword());
        student.setStuPassword(md5Psw);
        Student stu = stuService.findStudentWithOne(student);
        if(stu==null){

            stuService.addStudent(student);
            HttpServletRequest request = ServletActionContext.getRequest();
            request.setAttribute("msg","添加成功");


        }else {
            HttpServletRequest request = ServletActionContext.getRequest();
            request.setAttribute("msg","这个账号已经存在了，请重新添加");
        }
        return SUCCESS;


    }


}
