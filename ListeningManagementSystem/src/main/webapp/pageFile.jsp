<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%--
  Created by IntelliJ IDEA.
  User: knightx
  Date: 2019/1/23
  Time: 15:35
  To change this template use File | Settings | File Templates.
--%>


<div style="text-align: center;">
    共${pageModel.totalPageNum}页/第${pageModel.currentPageNum}页
    <a class="btn btn-default" href="${pageContext.request.contextPath}/${pageModel.url}?num=1">首页</a>
    <a class="btn btn-default" href="{pageContext.request.contextPath}/${pageModel.url}?num=${pageModel.prevPageNum}">上一页</a>
    <c:forEach begin="${pageModel.startPage}" end="${pageModel.endPage}" var="i">
        <a class="btn btn-default" href="${pageContext.request.contextPath}/${pageModel.url}?num=${i}">${i}</a>

    </c:forEach>

    <a class="btn btn-default" href="{pageContext.request.contextPath}/${pageModel.url}?num=${pageModel.nextPageNum}">下一页</a>

    <a class="btn btn-default" href="{pageContext.request.contextPath}/${pageModel.url}?num=${pageModel.totalPageNum}">末页</a>
    <input class="btn btn-default" type="text" name="pageNum" id="pageNum" size="1"/>
    <input class="btn btn-default" type="button" value="前往" onclick="jump()"/>
    <script type="text/javascript">
        function jump() {
            var totalPageNum = ${pageModel.totalPageNum};
            var pageNum = document.getElementById("pageNum").value;
            //判断用户输入的是否是字母
            var reg =/^[1-9][0-9]{0,1}$/;
            if(!reg.test(pageNum)){
                alert("请输入合法数字");
                return false;
            }
            if (parseInt(pageNum)>parseInt(totalPageNum)){
                alert("不能大于总页数");
                return false;
            }

            //合法的话提交到action中
            window.location.href="${pageContext.request.contextPath}/${pageModel.url}?num="+pageNum;

        }
    </script>




</div>
