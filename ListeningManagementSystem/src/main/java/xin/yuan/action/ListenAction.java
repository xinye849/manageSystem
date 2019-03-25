package xin.yuan.action;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import net.sf.json.JSONArray;
import org.apache.struts2.ServletActionContext;
import xin.yuan.entity.ListenClass;
import xin.yuan.service.ListenClassService;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * @authorknightx
 * @create2019/1/30
 * @since 1.0.0
 */
public class ListenAction extends ActionSupport implements ModelDriven {

    private String listenList;

    public String getListenList() {
        return listenList;
    }

    public void setListenList(String listenList) {
        this.listenList = listenList;
    }

    ListenClassService listenClassService;

    public void setListenClassService(ListenClassService listenClassService) {
        this.listenClassService = listenClassService;
    }

    ListenClass listenClass = new ListenClass();
    @Override
    public ListenClass getModel() {
        return listenClass;
    }


    public String addListenClassUI(){
        return SUCCESS;
    }

//管理员添加听课信息
    public String addListenClass(){
        listenClassService.addListenClass(listenClass);
        HttpServletRequest request = ServletActionContext.getRequest();
        request.setAttribute("msg","新添听课安排成功");
        return SUCCESS;
    }

    //查看所有听课信息
    public String fingAllListens(){
        List<ListenClass> listenList = listenClassService.fingAllListens();

        return SUCCESS;
    }
//查看老师讲课信息
    public String findTeacherListensByName(){
        HttpServletRequest request = ServletActionContext.getRequest();
        String teaName = request.getParameter("teaName");
        JSONArray jsonArray = JSONArray.fromObject((List<ListenClass>)listenClassService.findTeacherListensByName(teaName));
       listenList = jsonArray.toString();
        return SUCCESS;
    }

    //查看老师听课信息
    public String findTeacherListensByName2(){
        HttpServletRequest request = ServletActionContext.getRequest();
        String teaName = request.getParameter("teaName");
        JSONArray jsonArray = JSONArray.fromObject((List<ListenClass>)listenClassService.findTeacherListensByName2(teaName));
        listenList = jsonArray.toString();
        return SUCCESS;
    }


    //查看学生听课信息
    public String findStudentListensByClassRoom(){
        HttpServletRequest request = ServletActionContext.getRequest();
        String classRoom = request.getParameter("classRoom");
        JSONArray jsonArray = JSONArray.fromObject((List<ListenClass>)listenClassService.findStudentListensByClassRoom(classRoom));
        listenList = jsonArray.toString();
        return SUCCESS;
    }








}
