package xin.yuan.Filters;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * @authorknightx
 * @create2019/1/21
 * @since 1.0.0
 */
public class FilterAll implements Filter{


    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest)servletRequest;
        HttpServletResponse response = (HttpServletResponse)servletResponse;
        HttpSession session = request.getSession();
        String path = request.getRequestURI();
        String[] urls = {"Login","index",".css",".ico",".jpg",".png","jpeg","ttf","layui","jquery"};
        for (String url :urls){
            if (path.indexOf(url)!=-1){
                filterChain.doFilter(servletRequest,servletResponse);
                return;
            }
        }
        //放行首页
        /*if (path.indexOf("/index.jsp")>-1){
           filterChain.doFilter(servletRequest,servletResponse); //放行
            return;
        }
        if (path.indexOf("Login")>-1){
            filterChain.doFilter(servletRequest,servletResponse); //放行
            return;

        }*/



        if (session.getAttribute("existUser")!=null){
            filterChain.doFilter(servletRequest,servletResponse); //放行
            return;

        }else {
            response.sendRedirect(request.getContextPath()+"/index.jsp");
        }

    }

    @Override
    public void destroy() {

    }
}