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


<table class="layui-table" lay-size="lg" style="margin-bottom: 70px;text-align: center;">
    <thead>
    <tr>
        <th colspan="3" style="text-align: center">老师问题回复</th>
    </tr>
    </thead>
    <tbody>
    <tr>
        <td colspan="3" style="text-align: left">我的问题：${message.content}</td>
    </tr>

    <tr>
        <td colspan="3" style="text-align: right">${message.replay}:老师的回答</td>
     </tr>

    </tbody>
</table>








</body>
</html>