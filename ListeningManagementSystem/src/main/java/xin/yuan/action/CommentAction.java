package xin.yuan.action;

import com.opensymphony.xwork2.ActionSupport;
import net.sf.json.JSONObject;
import org.apache.struts2.ServletActionContext;
import xin.yuan.entity.Student;
import xin.yuan.service.CommentService;

import javax.servlet.ServletException;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

/**
 * @authorknightx
 * @create2019/3/19
 * @since 1.0.0
 */
public class CommentAction extends ActionSupport {
    private CommentService commentService;

    public void setCommentService(CommentService commentService) {
        this.commentService = commentService;
    }

    //对帖子进行评论
    public String addComment() throws IOException {
        Map<String, Object> map = new HashMap<String, Object>();
        String uesrID = ServletActionContext.getRequest().getParameter("userID");
        String postID = ServletActionContext.getRequest().getParameter("postID");
        String content = ServletActionContext.getRequest().getParameter("content");
        int res = commentService.addCommentByPostID(Integer.parseInt(uesrID), Integer.parseInt(postID), content);

        if(res >= 1) {

            map.put("addCommentResult", "success");
        }else {
            map.put("addCommentResult", "fail");
        }

        JSONObject jsonMap = JSONObject.fromObject(map);
        PrintWriter out = ServletActionContext.getResponse().getWriter();
        out.println(jsonMap.toString());
        out.flush();
        out.close();
        return SUCCESS;
    }


    //对帖子进行回复
public String addCommentByPostID() throws ServletException, IOException {

    String postID = ServletActionContext.getRequest().getParameter("postID");
    String replyText = ServletActionContext.getRequest().getParameter("replyText");
    String commentName = ServletActionContext.getRequest().getParameter("commentName");
    String commentContent = ServletActionContext.getRequest().getParameter("commentContent");
    Student loginUser = (Student)ServletActionContext.getRequest().getSession().getAttribute("existUser");
    String userID = Long.toString(loginUser.getStuId());
    String text =loginUser.getStuName()+"回复"+commentName + ":" + replyText + "</br>" + commentContent;
    int res = commentService.addCommentByPostID(Integer.parseInt(userID), Integer.parseInt(postID), text);
    ServletActionContext.getRequest().getServletContext().getRequestDispatcher("/postDetail.jsp?postID=" + postID + "&pageNum=1")
            .forward(ServletActionContext.getRequest(), ServletActionContext.getResponse());



    return SUCCESS;
}
}
