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
    <title>添加学生</title>
    <link rel="stylesheet" href="js/layui/css/layui.css" media="all">
    <script type="text/javascript" src="js/jquery-3.3.1.js"></script>
    <script src="js/layui/layui.all.js"></script>
    <script src="js/layer/layer.js"></script>
    <script type="text/javascript">
        window.onload = function () {
            document.getElementById("stuName").onblur=function () {
                var reg =/^[a-zA-Z0-9\u0391-\uFFE5]{2,6}$/;
                while(!reg.test(this.value)){
                    document.getElementById("namePrompt").innerText="请输入2-6位数的数字，字符或中文";
                    return false;
                }
                document.getElementById("namePrompt").innerText="  ";

            }

            document.getElementById("stuAccount").onblur=function () {
                var reg =/^\d{5}$/;
                while(!reg.test(this.value)){
                    document.getElementById("accoPrompt").innerText="请输入正确的账号格式";
                    return false;
                }
                document.getElementById("accoPrompt").innerText="  ";

            }



            document.getElementById("stuPassword").onblur=function () {
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
<form class="layui-form" action="${pageContext.request.contextPath}/addStudent" method="post" id="fm">
    <table class="layui-table" lay-size="lg" style="margin-bottom: 70px;text-align: center;">
        <tr>
            <td>姓名：</td>
            <td><input class="layui-input" type="text" name="stuName" id="stuName"/></td>
            <td><h4 id="namePrompt"></h4></td>
        </tr>
        <tr>
            <td>性别：</td>
            <td><input class="layui-input" type="radio" name="gender" value="男" checked/>男</td>
            <td><input class="layui-input" type="radio" name="gender" value="女"/>女</td>
        </tr>
        <tr>
            <td>账号：</td>
            <td><input class="layui-input" type="text" name="stuAccount" id="stuAccount"/></td>
            <td><h4 id="accoPrompt"></h4></td>
        </tr>
        <tr>
            <td>密码：</td>
            <td><input class="layui-input" type="password" name="stuPassword" id="stuPassword"/></td>
            <td><h4 id="pswdPrompt"></h4></td>
        </tr>
        <tr>
            <td>班级：</td>
            <td><select name="classRoom">
                <option value="#">请选择</option>
                <option value="a01">a01</option>
                <option value="a02">a02</option>
                <option value="a03">a03</option>
                <option value="b01">b01</option>
                <option value="b02">b02</option>
                <option value="b03">b03</option>
                <option value="c01">c01</option>
                <option value="c02">c02</option>
                <option value="c03">c03</option>
                <option value="c04">c04</option>
                <option value="e01">e01</option>
                <option value="e02">e02</option>
                <option value="e03">e03</option>
                <option value="f01">f01</option>
                <option value="f02">f02</option>
                <option value="f03">f03</option>
            </select></td>
        </tr>
    <input type="text" name="stuStatus" id="stuStatus" value="0" hidden/>
    <input type="text" name="type" id="type" value="student" hidden/>
        <tr>
            <td colspan="2"><input class="layui-btn layui-btn-normal" type="button" id="btn" value="添加" onclick='check2()'/>
                <input class="layui-btn layui-btn-warm" type="reset" value="重置"/></td>

            <td> <h3>${msg}</h3></td>
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
        var name = document.getElementById("stuName").value;
        if (name.trim() == "" || name.trim() == null) {
            document.getElementById("namePrompt").innerText="请输入姓名";
            return false;
        }
        var account = document.getElementById("stuAccount").value;
        if (account.trim() == "" || account.trim() == null) {
            document.getElementById("accoPrompt").innerText="请输入账号";
            return false;
        }

        var password = document.getElementById("stuPassword").value;
        if (password.trim() == "" || password.trim() == null) {
            document.getElementById("pswdPrompt").innerText="请输入密码";
            return false;
        }

        document.getElementById("fm").submit();


    }


</script>
</html>
