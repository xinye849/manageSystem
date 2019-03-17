<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%--
  Created by IntelliJ IDEA.
  User: knightx
  Date: 2019/1/25
  Time: 11:20
  To change this template use File | Settings | File Templates.
--%>


<html>
<head>
    <title>教师信息</title>
    <!--支持移动设备优先-->
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <link rel="stylesheet" href="css/bootstrap.css">
    <script type="text/javascript" src="js/jquery-3.3.1.js"></script>
    <script type="text/javascript" src="js/bootstrap.js"></script>
</head>
<body>
<form action="${pageContext.request.contextPath}/updateTeacher" method="post" id="fm">

    <label for="teaName" class="col-md-1 control-label">姓名:</label><input type="text" name="teaName" value="${existUser.teaName}" id="teaName"/><br>
    <label for="teaAccount" class="col-md-1 control-label">编号:</label><input type="text" name="teaAccount" value="${existUser.teaAccount}" id="teaAccount" readonly/><br>
    <label for="teaPassword" class="col-md-1 control-label">新密码:</label><input type="password" name="teaPassword" value="${existUser.teaPassword}" id="teaPassword"/><br>
    <label class="col-md-1 control-label">性别:</label><c:if test="${existUser.gender=='男'}">
    <input type="radio" name="gender" value="男" checked/>男
    <input type="radio" name="gender" value="女"/>女<br>
        </c:if>

    <c:if test="${existUser.gender=='女'}">
        <input type="radio" name="gender" value="男"/>男
        <input type="radio" name="gender" value="女" checked/>女<br>
    </c:if>
    <c:if test="${existUser.gender==null||existUser.gender==''}">
        <input type="radio" name="gender" value="男"/>男
        <input type="radio" name="gender" value="女" />女<br>
    </c:if>
<input type="hidden" name="teaId" value="${existUser.teaId}"/><br>
    <input class="btn btn-default" type="submit" value="修改"/>&nbsp<input class="btn btn-default" type="reset" value="重置"/><br>

<div >
    <h2 id="msgh2">${msg}</h2>
</div>


</form>
</body>
<script type="text/javascript">
    //让msg信息成功后3秒消失
    $(function () {
        var i =1;
        var msgInterval = setInterval(function () {
            i++;

            if ($('#msgh2').text().length>0)
                $('#msgh2').parent().remove();

            if (i==3)clearInterval(msgInterval);

        },1000);

    })
</script>
</html>
