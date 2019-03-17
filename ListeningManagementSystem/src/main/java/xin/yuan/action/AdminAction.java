package xin.yuan.action;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import net.sf.json.JSONObject;
import org.apache.struts2.ServletActionContext;
import xin.yuan.entity.Admin;
import xin.yuan.entity.Student;
import xin.yuan.service.AdminService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * @authorknightx
 * @create2019/1/16
 * @since 1.0.0
 */
public class AdminAction extends ActionSupport implements ModelDriven {
   AdminService adminService;
   Admin admin = new Admin();

   private String adminObj;

    public String getAdminObj() {
        return adminObj;
    }

    public void setAdminObj(String adminObj) {
        this.adminObj = adminObj;
    }

    public void setAdminService(AdminService adminService) {
        this.adminService = adminService;
    }

    @Override
    public Admin getModel() {
        return admin;
    }


    public String adminLogin(){

        //List<Admin> list = adminService.adminLogin(admin);
        Admin adm = adminService.adminLogin(admin);
//if(list.isEmpty()){
        if(adm==null){

            HttpServletRequest request = ServletActionContext.getRequest();
            request.setAttribute("msg","用户名或密码错误，请重新登录");

            return ERROR;
        }else {
            ServletActionContext.getRequest().getSession().removeAttribute("existUser");
            HttpSession session = ServletActionContext.getRequest().getSession();
            session.setAttribute("existUser",adm);

        }
        return SUCCESS;
    }

    public String admLogOut(){
//学生退出，使session失效
        HttpSession session = ServletActionContext.getRequest().getSession();
        session.removeAttribute("existUser");//session失效

        return SUCCESS;
    }


    public String findAdminByID(){
      /*  HttpServletRequest request = ServletActionContext.getRequest();
        request.getParameter("adminId");*/

      Admin adminOne = adminService.findAdminByID(admin);

        JSONObject jsonObject = JSONObject.fromObject(adminOne);
        adminObj = jsonObject.toString();

        return SUCCESS;
    }

    public String updateAdmin(){
        adminService.updateAdmin(admin);
        ServletActionContext.getRequest().setAttribute("msg","修改成功");
        return SUCCESS;
    }
}
