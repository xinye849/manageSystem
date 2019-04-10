<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>myFeedBack</title>
    <link rel="stylesheet" href="js/layui/css/layui.css" media="all">
    <script type="text/javascript" src="js/jquery-3.3.1.js"></script>
    <script src="js/layui/layui.all.js"></script>
    <script src="js/layer/layer.js"></script>
</head>

<body>

<table class="layui-table">

    <thead>
    <tr>
        <th colspan="2" style="text-align: center">总共有【${feedBackList.size()}】位老师提交了听课反馈表</th>
    </tr>
    <tr>
        <td>听课老师名字</td>
        <td>提交反馈时间</td>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="feedBack" items="${feedBackList}">
        <tr>
            <td><a href="${pageContext.request.contextPath}/findFeedBackByOne?id=${feedBack.id}">${feedBack.listenClassTeachers}</a> </td>
            <td>${feedBack.listenClassDate}</td>
        </tr>
    </c:forEach>
    </tbody>
</table>


</body>
</html>