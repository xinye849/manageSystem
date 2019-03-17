<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%--
  Created by IntelliJ IDEA.
  User: knightx
  Date: 2019/3/1
  Time: 17:28
  To change this template use File | Settings | File Templates.
--%>


<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta content="width=device-width,initial-scale=1" name="viewport">
    <link rel="stylesheet" href="css/bootstrap.css">
    <script type="text/javascript" src="js/jquery-3.3.1.js"></script>
    <script type="text/javascript" src="js/bootstrap.js"></script>
    <title>听课论坛</title>
</head>
<body>



<form action="${pageContext.request.contextPath}/addForumMessage" method="post" id="fm">

    <label for="replyMessage" class="control-label">回复内容</label><input type="text" name="replyMessage" size="80" id="replyMessage"/>

    <input type="hidden" name="messageID" value="${requestScope.id}"/>
    <input type="hidden" name="wuID" value="${stu.stuName}"/>
    <input class="btn btn-default" type="button" id="btn" value="提交" onclick="check3()"/>
    <input class="btn btn-default" type="reset" value="重置"/>


</form>
<c:out value="${msg}"></c:out>
</body>
<script type="text/javascript">
    function check3() {


        if ($.trim($('#replyMessage').val()) == null || $.trim($('#replyMessage').val()) == "") {
            alert("请输入回复内容");
            return false;
        }
        document.getElementById("fm").submit();


    }
</script>
</html>
