package xin.yuan.action;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.apache.struts2.ServletActionContext;
import xin.yuan.entity.Post;
import xin.yuan.service.CommentService;
import xin.yuan.service.NoticeService;
import xin.yuan.service.PostService;


import javax.servlet.ServletException;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * @authorknightx
 * @create2019/3/13
 * @since 1.0.0
 */
public class PostAction extends ActionSupport implements ModelDriven {
    private PostService postService;
    private NoticeService noticeService;
    private CommentService commentService;

    private Post post = new Post();
    public void setPostService(PostService postService) {
        this.postService = postService;
    }

    public void setNoticeService(NoticeService noticeService) {
        this.noticeService = noticeService;
    }

    public void setCommentService(CommentService commentService) {
        this.commentService = commentService;
    }

    @Override
    public Object getModel() {
        return post;
    }



    //进入论坛的空跳转
    public String enterForumUI(){
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
        //拿到全部帖子
        List<Object> allPost = postService.getAllPosts();
        ServletActionContext.getRequest().setAttribute("allPost", allPost);

        return SUCCESS;
    }

    //帖子详情
    public  String postDetail(){

        List<Object> postList = new ArrayList<Object>();
        List<Object> comments = new ArrayList<Object>();
        Map<String, Object> map = new HashMap<String, Object>();
        int postID = Integer.parseInt(ServletActionContext.getRequest().getParameter("postID"));
        String actionType = ServletActionContext.getRequest().getParameter("actionType");
        if(actionType != null) {
            postList = postService.getPost(postID);
            map.put("state", "success");
            map.put("post", postList);
        }else {
            int page = Integer.parseInt(ServletActionContext.getRequest().getParameter("pageNum"));
            postList = postService.getPost(postID);

            comments = commentService.getCommentByPostID(postID, page);

            int totalPages = commentService.getTotalCommentPagesByPostId(postID);
            int result =postService.addPageView(postID);
            map.put("post", postList);
            map.put("postID", postID);
            map.put("pages", totalPages);
            if (comments.size() > 0) {
                map.put("state", "success");
                map.put("comments", comments);
                map.put("page", page);
            }else {
                map.put("state", "false");
            }
        }
        JSONObject jsonMap = JSONObject.fromObject(map);
        try {
            PrintWriter out = ServletActionContext.getResponse().getWriter();
            out.println(jsonMap.toString());
            out.flush();
            out.close();
        } catch (IOException e) {
            e.printStackTrace();
        }

        return SUCCESS;
    }


    public String findPostsByCondition() throws ServletException, IOException {


        List<Map<String, Object>> posts = new ArrayList<Map<String, Object>>();
        String querytitle = ServletActionContext.getRequest().getParameter("querytitle");
        String actionType = ServletActionContext.getRequest().getParameter("actionType");
        if(actionType.equals("themeQuery")) {

            String condition = "";

                condition = "where title like '%" + querytitle + "%'";
            String sql = "select * from post " + condition;
            posts = postService.posts(sql);

     ServletActionContext.getRequest().setAttribute("posts",posts);
            ServletActionContext.getRequest().getServletContext().getRequestDispatcher("/postList.jsp")
                    .forward(ServletActionContext.getRequest(), ServletActionContext.getResponse());

            }



        return null;
    }
}
