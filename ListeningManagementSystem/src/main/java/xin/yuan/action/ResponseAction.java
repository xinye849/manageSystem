package xin.yuan.action;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import org.apache.struts2.ServletActionContext;
import xin.yuan.entity.Response;
import xin.yuan.service.ResponseService;

import javax.servlet.http.HttpServletRequest;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * @authorknightx
 * @create2019/3/1
 * @since 1.0.0
 */
public class ResponseAction extends ActionSupport implements ModelDriven {
    private Response responsezz = new Response();
    private ResponseService responseService;

    public void setResponseService(ResponseService responseService) {
        this.responseService = responseService;
    }

    @Override
    public Object getModel() {
        return responsezz;
    }









    public String responseByIdUI(){
        HttpServletRequest request = ServletActionContext.getRequest();
        String id = request.getParameter("id");
        request.setAttribute("id",id);
       return SUCCESS;
    }

    public String addForumMessage(){
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        String replyTime = sdf.format(new Date());
        responsezz.setReplyTime(replyTime);
        responseService.addForumMessage(responsezz);
        ServletActionContext.getRequest().setAttribute("msg","评论成功");

        return SUCCESS;
    }
}
