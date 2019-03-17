<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%--
  Created by IntelliJ IDEA.
  User: knightx
  Date: 2019/1/20
  Time: 17:25
  To change this template use File | Settings | File Templates.
--%>


<html>
<head>
    <title>交流信息</title>
    <!--支持移动设备优先-->
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <link rel="stylesheet" href="css/bootstrap.css">
    <script type="text/javascript" src="js/jquery-3.3.1.js"></script>
    <script type="text/javascript" src="js/bootstrap.js"></script>
</head>
<body>
<form class="form-horizontal" action="${pageContext.request.contextPath}/addMessage" id="fm">
    <div class="form-group">
        <label for="content" class="col-md-4 control-label">我的听课问题</label><input type="text" id="content" name="content" size="80" id="content"/><br>
    <input class="btn btn-default" type="button" id="btn" value="提交" onclick="check()"/>
    <input class="btn btn-default" type="reset" value="重置"/>

    </div>

</form>
</body>
<script type="text/javascript">

    function check() {
      var content = document.getElementById("content").value;
      var  ct = content.trim();
      if (ct == null || ct == "") {
          alert("请录入合法内容");
          return false;
      }
      document.getElementById("fm").submit();

    }


</script>
</html>
