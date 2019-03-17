<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%--
  Created by IntelliJ IDEA.
  User: knightx
  Date: 2019/1/23
  Time: 21:11
  To change this template use File | Settings | File Templates.
--%>


<html>
<head>
    <title>老师回复信息</title>
    <!--支持移动设备优先-->
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <link rel="stylesheet" href="css/bootstrap.css">
    <script type="text/javascript" src="js/jquery-3.3.1.js"></script>
    <script type="text/javascript" src="js/bootstrap.js"></script>
</head>
<body>
<form action="${pageContext.request.contextPath}/replayMessage" method="post" id="fm">
    <label for="replay" class="control-label">回复内容</label><input type="text" name="replay" size="80" id="replay"/>
    <input type="hidden" name="messageId" value="${msgId}"/>
    <input class="btn btn-default" type="button" id="btn" value="提交" onclick="check3()"/>
    <input class="btn btn-default" type="reset" value="重置"/>


</form>
</body>

<script type="text/javascript">
    function check3() {

        var content = document.getElementById("replay").value;
        if (content.trim() == null || content.trim() == "") {
            alert("请输入回复内容");
            return false;
        }
        document.getElementById("fm").submit();


    }
</script>
</html>
