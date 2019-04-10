package xin.yuan.action;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.apache.struts2.ServletActionContext;
import xin.yuan.service.FeedBackService;
import xin.yuan.entity.feedBack;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

/**
 * @authorknightx
 * @create2019/3/29
 * @since 1.0.0
 */
public class FeedBackAction extends ActionSupport implements ModelDriven {
    private FeedBackService feedBackService;
    private feedBack feedBack = new feedBack();

    public void setFeedBackService(FeedBackService feedBackService) {
        this.feedBackService = feedBackService;
    }



    @Override
    public Object getModel() {
        return feedBack;
    }

    //拿到某一次听课记录的id
    public String findFeedBackUI(){

       String listenClassId = ServletActionContext.getRequest().getParameter("listenClassId");
       ServletActionContext.getRequest().setAttribute("listenClassId",listenClassId);
        return SUCCESS;
    }

   //保存教师反馈
    public String saveFeedBackById(){
        try {
            feedBackService.saveFeedBackById(feedBack);
            ServletActionContext.getRequest().setAttribute("msg","提交成功");
        }catch (Exception e){
            ServletActionContext.getRequest().setAttribute("msg","提交失败，请重试");

        }

        return SUCCESS;
    }


    //根据听课安排ID获取教师反馈
    public String findFeedBackById(){
       int listenClassId = Integer.parseInt(ServletActionContext.getRequest().getParameter("listenClassId"));
       List<feedBack> feedBackList = feedBackService.findFeedBackById(listenClassId);
       ServletActionContext.getRequest().setAttribute("feedBackList",feedBackList);

        return SUCCESS;
    }

    //根据听课反馈ID获取该条反馈记录
    public String findFeedBackByOne(){
        int id = Integer.parseInt(ServletActionContext.getRequest().getParameter("id"));
        feedBack feedBack = feedBackService.findFeedBackByOne(id);
        ServletActionContext.getRequest().setAttribute("feedBack",feedBack);
        return SUCCESS;
    }

    //根据讲课老师获得评分等级
    public String findGradeByListenId(){
        int listenClassId = Integer.parseInt(ServletActionContext.getRequest().getParameter("listenClassId"));
        Map<String,Integer> gradeList =feedBackService.findGradeByListenId(listenClassId);

        ServletActionContext.getRequest().setAttribute("gradeList",JSONObject.fromObject(gradeList));
        return SUCCESS;
    }

    //根据老师名字得到该老师历史听课记录
     public String findFeedBackByTea() throws IOException {
        List<feedBack> feedBackList = feedBackService.findFeedBackByTea(feedBack);
         JSONArray jsonArray = JSONArray.fromObject(feedBackList);
         PrintWriter out = ServletActionContext.getResponse().getWriter();
         out.println(jsonArray);
         out.flush();
         out.close();

        return null;
     }



}
