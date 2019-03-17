<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%--
  Created by IntelliJ IDEA.
  User: knightx
  Date: 2019/1/23
  Time: 14:31
  To change this template use File | Settings | File Templates.
--%>


<html>
<head>
    <title>查看留言</title>

    <!--支持移动设备优先-->
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <link rel="stylesheet" href="css/bootstrap.css">
    <script type="text/javascript" src="js/jquery-3.3.1.js"></script>
    <script type="text/javascript" src="js/bootstrap.js"></script>
</head>
<body>
<table class="table table-bordered table-hover">
    <tr>
    <td>序号</td>
    <td>信息内容</td>
    <td>发布时间</td>
    <td>回复信息</td>
    <td>回复时间</td>
    <td>操作</td>
    </tr>
<c:forEach var="list" items="${pageModel.list}" varStatus="status">
<tr>
    <td>${status.index+1}</td>
    <td>${list.content}</td>
    <td>${list.levelWordTime}</td>
    <td>${list.replay}</td>
    <td>${list.replayTime}</td>
    <td><a href="${pageContext.request.contextPath}/replayUI?id=${list.messageId}">回复</a> </td>





</tr>




</c:forEach>
</table>
<%@include file="pageFile.jsp"%>
</body>
</html>
