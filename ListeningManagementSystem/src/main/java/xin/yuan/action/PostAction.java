package xin.yuan.action;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import net.sf.json.JSONObject;
import org.apache.struts2.ServletActionContext;
import xin.yuan.entity.Post;
import xin.yuan.service.NoticeService;
import xin.yuan.service.PostService;


import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * @authorknightx
 * @create2019/3/13
 * @since 1.0.0
 */
public class PostAction extends ActionSupport implements ModelDriven {
    private PostService postService;
    public NoticeService noticeService;
    private Post post = new Post();
    public void setPostService(PostService postService) {
        this.postService = postService;
    }

    public void setNoticeService(NoticeService noticeService) {
        this.noticeService = noticeService;
    }

    @Override
    public Object getModel() {
        return post;
    }



    //帖子的空跳转
    public String addPostUI(){
        return SUCCESS;
    }


//添加帖子
    public String addPost(){
        Map<String,Object> map = new HashMap<String, Object>();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        post.setPublishTime(sdf.format(new Date()));
        int result = postService.addPost(post);

        if(result >= 1) {
            map.put("result", "success");
        }else {
            map.put("result", "false");
        }
        JSONObject jsonMap = JSONObject.fromObject(map);
        try {
            ServletActionContext.getResponse().getWriter().println(jsonMap.toString());
            ServletActionContext.getResponse().getWriter().flush();
            ServletActionContext.getResponse().getWriter().close();
        } catch (IOException e) {
            e.printStackTrace();
        }


        return SUCCESS;
    }

//获取主题
    public String theme(){
        List<Object> notices = new ArrayList<Object>();
        //拿到最新通知
        notices = noticeService.newNotice();
        ServletActionContext.getRequest().setAttribute("noticeList", notices);
        //拿到最新帖子
        List<Object> newList = postService.newPosts();
        ServletActionContext.getRequest().setAttribute("newList", newList);
        //拿到最热的帖子
        List<Object> hotList = postService.hotPosts();
        ServletActionContext.getRequest().setAttribute("hotList", hotList);


        return SUCCESS;
    }


}
