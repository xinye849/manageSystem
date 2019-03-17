<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%--
  Created by IntelliJ IDEA.
  User: knightx
  Date: 2019/1/15
  Time: 16:31
  To change this template use File | Settings | File Templates.
--%>


<html>
<head>
    <title>Title</title>

    <script type="text/javascript">


        window.onload=function () {
            document.getElementById("a1").onclick=function () {
                if(confirm("确定要退出吗？")){
                    location.href="stuLogOut";

                }

            }



        }
    </script>

    <script type="text/javascript">
  </script>
</head>
<body>
欢迎<c:out value="${stu.stuName}"/><a href="#" id="a1">安全退出</a>





</body>
</html>
