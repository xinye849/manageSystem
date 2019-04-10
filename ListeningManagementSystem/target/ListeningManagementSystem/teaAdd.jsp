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
    <link rel="stylesheet" href="js/layui/css/layui.css" media="all">
    <script type="text/javascript" src="js/jquery-3.3.1.js"></script>
    <script src="js/layui/layui.all.js"></script>
    <script src="js/layer/layer.js"></script>


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
<form class="layui-form" action="${pageContext.request.contextPath}/addTeacher" method="post" id="fm">
    <table class="layui-table" lay-size="lg" style="margin-bottom: 70px;text-align: center;">
        <tr>
            <td>姓名：</td>
            <td><input class="layui-input" type="text" name="teaName" id="teaName"/></td>
            <td><h4 id="namePrompt"></h4></td>
        </tr>
        <tr>
            <td>性别：</td>
            <td><input class="layui-input" type="radio" name="gender" value="男" checked/>男</td>
            <td><input class="layui-input" type="radio" name="gender" value="女"/>女<br></td>
        </tr>
        <tr>
            <td>账号：</td>
            <td><input class="layui-input" type="text" name="teaAccount" id="teaAccount"/></td>
            <td><h4 id="accoPrompt"></h4></td>
        </tr>
        <tr>
            <td>密码：</td>
            <td><input class="layui-input" type="password" name="teaPassword" id="teaPassword"/></td>
            <td><h4 id="pswdPrompt"></h4></td>
        </tr>
        <input  type="text" name="teaStatus" hidden id="teaStatus" value="0" />
        <tr>
            <td><input class="layui-btn layui-btn-normal" type="button" id="btn" value="添加" onclick='check2()'/></td>
            <td><input class="layui-btn layui-btn-warm" type="reset" value="重置"/></td>
            <td><h3>${msg}</h3></td>
        </tr>

    </table>


</form>
</body>


<script>
    layui.use('form', function(){
        var form = layui.form;

        form.render();

        //各种基于事件的操作，下面会有进一步介绍
    });
</script>



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
