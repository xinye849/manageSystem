package xin.yuan.action;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import org.apache.struts2.ServletActionContext;
import xin.yuan.entity.Notice;
import xin.yuan.service.NoticeService;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * @authorknightx
 * @create2019/3/17
 * @since 1.0.0
 */
public class NoticesAction extends ActionSupport implements ModelDriven {
    NoticeService noticeService;
    private Notice notice = new Notice();

    public void setNoticeService(NoticeService noticeService) {
        this.noticeService = noticeService;
    }

    @Override
    public Object getModel() {
        return notice;
    }


public String noticesAll(){
    List<Object> notices = new ArrayList<Object>();

        if (notice.getId()==0){
            notices = noticeService.allNotice();
            ServletActionContext.getRequest().setAttribute("notices", notices);
            return "noId";


        }else {
            ServletActionContext.getRequest().setAttribute("noticeID",notice.getId());
            notices = noticeService.getPost(notice.getId());
            ServletActionContext.getRequest().setAttribute("notice", notices);

        }

        return SUCCESS;
}
}
