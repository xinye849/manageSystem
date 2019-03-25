<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%--
  Created by IntelliJ IDEA.
  User: knightx
  Date: 2019/1/21
  Time: 10:24
  To change this template use File | Settings | File Templates.
--%>


<html>
<head>
    <title>添加老师</title>

    <script type="text/javascript">
        window.onload = function () {
            document.getElementById("teaName").onblur=function () {
                var reg =/^[a-zA-Z0-9\u0391-\uFFE5]{2,6}$/;
                while(!reg.test(this.value)){
                    document.getElementById("namePrompt").innerText="请输入2-6位数的数字，字符或中文";
                    return false;
                }
                document.getElementById("namePrompt").innerText="  ";

            }

            document.getElementById("teaAccount").onblur=function () {
                var reg =/^\d{5}$/;
                while(!reg.test(this.value)){
                    document.getElementById("accoPrompt").innerText="请输入正确的账号格式";
                    return false;
                }
                document.getElementById("accoPrompt").innerText="  ";

            }



            document.getElementById("teaPassword").onblur=function () {
                var reg =/^[a-zA-Z0-9_]+$/;
                while(!reg.test(this.value)){
                    document.getElementById("pswdPrompt").innerText="检查密码格式，密码格式为数字，字母，下划线的组合";
                    return false;
                }
                document.getElementById("pswdPrompt").innerText="  ";

            }





        }

    </script>






</head>
<body>
<form action="${pageContext.request.contextPath}/addTeacher" method="post" id="fm">
    姓名：<input type="text" name="teaName" id="teaName"/><br><h4 id="namePrompt"></h4>
    性别：<input type="radio" name="gender" value="男" checked/>男
         <input type="radio" name="gender" value="女"/>女<br>
    账号：<input type="text" name="teaAccount" id="teaAccount"/> <br><h4 id="accoPrompt"></h4>
    密码：<input type="password" name="teaPassword" id="teaPassword"/><br><h4 id="pswdPrompt"></h4>
    <input type="text" name="teaStatus" id="teaStatus" value="0" hidden/>

    <input type="button" id="btn" value="添加" onclick='check2()'/><input type="reset" value="重置"/>

<h3>${msg}</h3>


</form>
</body>
<script type="text/javascript">

    function check2() {
        var name = document.getElementById("teaName").value;
        if (name.trim() == "" || name.trim() == null) {
            document.getElementById("namePrompt").innerText="请输入姓名";
            return false;
        }
        var account = document.getElementById("teaAccount").value;
        if (account.trim() == "" || account.trim() == null) {
            document.getElementById("accoPrompt").innerText="请输入账号";
            return false;
        }

        var password = document.getElementById("teaPassword").value;
        if (password.trim() == "" || password.trim() == null) {
            document.getElementById("pswdPrompt").innerText="请输入密码";
            return false;
        }

        document.getElementById("fm").submit();


    }


</script>
</html>
