package xin.yuan.utils;



import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import org.apache.struts2.ServletActionContext;

import javax.servlet.http.HttpServletRequest;
import java.util.List;


/**
 * @authorknightx
 * @create2019/1/17
 * @since 1.0.0
 * pagemodel为携带数据的实体类，携带的数据包括数据库信息和分页信息；
 */
public class PageModel{
    //装数据库信息
    private List list;

    //分页参数信息
    private int currentPageNum;//当前页
    private int pageSize;//每页条数;
    private int totalRecords;//总共记录条数：
    private int totalPageNum;//总页数
    private  int startIndex;//起始索引值
    private  int prevPageNum;//上一页
    private int nextPageNum;//下一页
    private int startPage;//起始页码
    private int endPage;//终止页码
    private String url;






    public PageModel(int currentPageNum,int totalRecords,int pageSize){
        this.currentPageNum=currentPageNum;
        this.totalRecords = totalRecords;
        this.pageSize = pageSize;

        totalPageNum = totalRecords%pageSize==0?(totalRecords/pageSize):(totalRecords/pageSize+1);
        startIndex = (currentPageNum-1)*pageSize;
        prevPageNum = currentPageNum - 1;
        if(currentPageNum<=1){
            prevPageNum = 1;
        }
        nextPageNum = currentPageNum+1;
        if (currentPageNum==totalPageNum){
            nextPageNum = totalPageNum;
        }


        startPage = currentPageNum - 4 ;//这里为总共显示9页
        endPage = currentPageNum + 4;
        if (totalPageNum<=9){

            startPage = 1;
            endPage = totalPageNum;
        }else {
            if (startPage<1){
                startPage = 1;
                endPage = startPage + 8;
            }
            if (endPage>totalPageNum){
                endPage=totalPageNum;
                startPage = totalPageNum - 8;
            }
        }

    }


    public List getList() {
        return list;
    }

    public void setList(List list) {
        this.list = list;
    }





    public int getCurrentPageNum() {
        return currentPageNum;
    }

    public void setCurrentPageNum(int currentPageNum) {
        this.currentPageNum = currentPageNum;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    public int getTotalRecords() {
        return totalRecords;
    }

    public void setTotalRecords(int totalRecords) {
        this.totalRecords = totalRecords;
    }

    public int getTotalPageNum() {
        return totalPageNum;
    }

    public void setTotalPageNum(int totalPageNum) {
        this.totalPageNum = totalPageNum;
    }

    public int getStartIndex() {
        return startIndex;
    }

    public void setStartIndex(int startIndex) {
        this.startIndex = startIndex;
    }

    public int getPrevPageNum() {
        return prevPageNum;
    }

    public void setPrevPageNum(int prevPageNum) {
        this.prevPageNum = prevPageNum;
    }

    public int getNextPageNum() {
        return nextPageNum;
    }

    public void setNextPageNum(int nextPageNum) {
        this.nextPageNum = nextPageNum;
    }

    public int getStartPage() {
        return startPage;
    }

    public void setStartPage(int startPage) {
        this.startPage = startPage;
    }

    public int getEndPage() {
        return endPage;
    }

    public void setEndPage(int endPage) {
        this.endPage = endPage;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }


}
