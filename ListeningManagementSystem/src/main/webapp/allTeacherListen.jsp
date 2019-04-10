<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>feedBack</title>
    <link rel="stylesheet" href="js/layui/css/layui.css" media="all">
    <script type="text/javascript" src="js/jquery-3.3.1.js"></script>
    <script src="js/layui/layui.all.js"></script>
    <script src="js/layer/layer.js"></script>
</head>

<body>

<table class="layui-table">

    <thead>
    <tr>
     <th colspan="3" style="text-align: center">教师听课记录管理</th>
    </tr>
    <tr>
        <td>讲课老师</td>
        <td>讲课时间</td>
        <td>老师评价图示</td>
    </tr>
    </thead>
    <tbody>

    <c:forEach var="listen" items="${listenList}">
        <tr>
            <td><a href="${pageContext.request.contextPath}/findFeedBackById?listenClassId=${listen.listenClassId}">${listen.listenClassLectureTeacher}</a> </td>
            <td>${listen.listenClassDate}</td>
            <td><a href="${pageContext.request.contextPath}/findGradeByListenId?listenClassId=${listen.listenClassId}">点击查看</a> </td>
        </tr>
    </c:forEach>
    </tbody>
</table>


</body>
</html>