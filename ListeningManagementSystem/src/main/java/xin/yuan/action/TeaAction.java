package xin.yuan.action;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.apache.struts2.ServletActionContext;
import xin.yuan.entity.Student;
import xin.yuan.entity.Teacher;
import xin.yuan.service.TeaService;
import xin.yuan.utils.Md5Encode;
import xin.yuan.utils.PageModel;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @authorknightx
 * @create2019/1/16
 * @since 1.0.0
 */
public class TeaAction extends ActionSupport implements ModelDriven {
    private Teacher teacher = new Teacher();
    private String teacherList;

    public String getTeacherList() {
        return teacherList;
    }

    public void setTeacherList(String teacherList) {
        this.teacherList = teacherList;
    }

    private TeaService teaService;

    public void setTeaService(TeaService teaService) {
        this.teaService = teaService;
    }

    @Override
    public Teacher getModel() {
        return teacher;
    }


    public String teaLogin() throws UnsupportedEncodingException, NoSuchAlgorithmException {
        //进行md5加密
        String md5Psw = Md5Encode.encodeByMd5(teacher.getTeaPassword());
        teacher.setTeaPassword(md5Psw);

        Teacher tea = teaService.teaLogin(teacher);
        if (tea == null) {
            HttpServletRequest request = ServletActionContext.getRequest();
            request.setAttribute("msg", "用户名或密码错误，请重新登录");
            return ERROR;
        } else {
            if ("0".equals(tea.getTeaStatus())) {
                ServletActionContext.getRequest().getSession().removeAttribute("existUser");
                HttpSession session = ServletActionContext.getRequest().getSession();
                session.setAttribute("existUser", tea);
                return SUCCESS;

            } else {
                HttpServletRequest request = ServletActionContext.getRequest();
                request.setAttribute("msg", "你的账户已被冻结，请联系管理员");
                return ERROR;
            }
        }
    }

    //教师退出
    public String teaLogOut() {

        HttpSession session = ServletActionContext.getRequest().getSession();
        /*session.invalidate();//session失效*/
        session.removeAttribute("existUser");

        return SUCCESS;
    }

    //分页查看教师
    public String findTeachersWithPage() {
        HttpServletRequest request = ServletActionContext.getRequest();
        //拿到当前页
        int currentNum = Integer.parseInt(request.getParameter("num"));


        PageModel pm = teaService.findTeachersWithPage(currentNum);
        request.setAttribute("pageModel", pm);


        return SUCCESS;
    }

    //页面空跳转
    public String addTeacherUI() {


        return SUCCESS;
    }

    //添加老师
    public String addTeacher() throws UnsupportedEncodingException, NoSuchAlgorithmException {
        //进行md5加密
        String md5Psw = Md5Encode.encodeByMd5(teacher.getTeaPassword());
        teacher.setTeaPassword(md5Psw);


        Teacher tea = teaService.findTeacherWithOne(teacher);

        if (tea == null) {

            teaService.addTeacher(teacher);

            return SUCCESS;
        } else {
            HttpServletRequest request = ServletActionContext.getRequest();
            request.setAttribute("msg", "这个账号已经存在了，请重新添加");
        }
        return ERROR;

    }

    //根据账户查看信息
    public String findTeacherWithOne() {

        Teacher tea = teaService.findTeacherWithOne(teacher);
        JSONObject jsonObject = JSONObject.fromObject(tea);
        try {
            ServletActionContext.getResponse().getWriter().println(jsonObject.toString());
        } catch (IOException e) {
            e.printStackTrace();
        }

        return null;
    }


    public String delTeacherById() {
        teaService.delTeacherById(teacher);

        return SUCCESS;

    }

    public String changeStatus() throws IOException {
        String status = teaService.changeStatus(teacher);

        Map<String, String> map = new HashMap<String, String>();
        map.put("status", status);
        JSONObject jsonObject = JSONObject.fromObject(map);
        PrintWriter out = ServletActionContext.getResponse().getWriter();
        out.println(jsonObject.toString());
        out.flush();
        out.close();

        return SUCCESS;

    }


    public String findInfoUI() {


        return SUCCESS;
    }

    public String updateTeacher() throws UnsupportedEncodingException, NoSuchAlgorithmException {
        //进行md5加密
        String md5Psw = Md5Encode.encodeByMd5(teacher.getTeaPassword());
        teacher.setTeaPassword(md5Psw);

        teaService.updateTeacher(teacher);
        ServletActionContext.getRequest().setAttribute("msg", "修改成功");


        return SUCCESS;
    }

    //查询所有教师
    public String findAllTeacher() {
        JSONArray jsonArray = JSONArray.fromObject((List<Teacher>) teaService.findAllTeacher());
        teacherList = jsonArray.toString();


        return SUCCESS;
    }

}
