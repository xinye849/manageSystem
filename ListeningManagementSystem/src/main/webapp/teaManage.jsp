<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%--
  Created by IntelliJ IDEA.
  User: knightx
  Date: 2019/1/16
  Time: 19:52
  To change this template use File | Settings | File Templates.
--%>


<html>
<head>
    <title>Title</title>
    <!--支持移动设备优先-->
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <link rel="stylesheet" href="css/bootstrap.css">
    <script type="text/javascript" src="js/jquery-3.3.1.js"></script>
    <script type="text/javascript" src="js/bootstrap.js"></script>
</head>
<body>




<table class="table table-bordered table-hover" >
    <tr>
        <td>ID</td>
        <td>姓名</td>
        <td>账号</td>
        <td>密码</td>
        <td>性别</td>
        <td>状态</td>
        <td>操作</td>

    </tr>

    <c:forEach var="c" items="${requestScope.pageModel.list}">
        <tr>
            <td><c:out value="${c.teaId}"/></td>
            <td><c:out value="${c.teaName}"/></td>
            <td><c:out value="${c.teaAccount}"/></td>
            <td><c:out value="${c.teaPassword}"/></td>
            <td><c:out value="${c.gender}"/></td>
            <td><c:out value="${c.teaStatus}"/></td>
            <td><a href="#" onclick="delTea(${c.teaId})">删除</a> </td>
        </tr>


    </c:forEach>
</table>



<div style="text-align: center;">
    共${pageModel.totalPageNum}页/第${pageModel.currentPageNum}页
    <a class="btn btn-default" href="${pageContext.request.contextPath}/findTeacherWithPage?num=1">首页</a>
    <a class="btn btn-default" href="{pageContext.request.contextPath}/findTeacherWithPage?num=${pageModel.prevPageNum}">上一页</a>
    <c:forEach begin="${pageModel.startPage}" end="${pageModel.endPage}" var="i">
        <a class="btn btn-default" href="${pageContext.request.contextPath}/findTeacherWithPage?num=${i}">${i}</a>

    </c:forEach>

    <a class="btn btn-default" href="{pageContext.request.contextPath}/findTeacherWithPage?num=${pageModel.nextPageNum}">下一页</a>

    <a class="btn btn-default" href="{pageContext.request.contextPath}/findTeacherWithPage?num=${pageModel.totalPageNum}">末页</a>
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
            window.location.href="${pageContext.request.contextPath}/findTeacherWithPage?num="+pageNum;

        }
    </script>




</div>
</body>
<script type="text/javascript">

    function delTea(tId) {
        if (confirm("确认删除吗？")) {
            window.location.href="${pageContext.request.contextPath}/delTeacherById?teaId="+tId;
        }

    }


</script>
</html>
