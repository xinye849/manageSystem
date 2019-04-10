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
    <link rel="stylesheet" href="js/layui/css/layui.css" media="all">
    <script type="text/javascript" src="js/jquery-3.3.1.js"></script>
    <script src="js/layui/layui.all.js"></script>
    <script src="js/layer/layer.js"></script>
</head>
<body>
<form class="layui-form" action="${pageContext.request.contextPath}/updateTeacher" method="post" id="fm">

    <table class="layui-table" lay-size="lg" style="margin-bottom: 70px;text-align: center;">
        <tr>
            <td>姓名：</td>
            <td><input class="layui-input" type="text" name="teaName" value="${existUser.teaName}" id="teaName"/></td>

        </tr>


        <tr>
            <td>编号:</td>
            <td><input class="layui-input" type="text" name="teaAccount" value="${existUser.teaAccount}" id="teaAccount" readonly/></td>
        </tr>

        <tr>
            <td>新密码:</td>
            <td><input class="layui-input" type="password" name="teaPassword" value="${existUser.teaPassword}" id="teaPassword"/></td>

        </tr>

        <tr>
            <td>性别:</td>
            <td><c:if test="${existUser.gender=='男'}">
                <input class="layui-input" type="radio" name="gender" value="男" checked/>男
                <input class="layui-input" type="radio" name="gender" value="女"/>女<br>
            </c:if>

                <c:if test="${existUser.gender=='女'}">
                    <input class="layui-input" type="radio" name="gender" value="男"/>男
                    <input class="layui-input" type="radio" name="gender" value="女" checked/>女<br>
                </c:if>
                <c:if test="${existUser.gender==null||existUser.gender==''}">
                    <input class="layui-input" type="radio" name="gender" value="男"/>男
                    <input class="layui-input" type="radio" name="gender" value="女" />女<br>
                </c:if>
            </td>

        </tr>
        <input type="hidden" name="teaId" value="${existUser.teaId}"/><br>


        <tr>
            <td><input class="layui-btn layui-btn-normal" type="submit" id="btn" value="修改" /></td>
            <td><input class="layui-btn layui-btn-warm" type="reset" value="重置"/></td>

        </tr>



<div >
    <h2 id="msgh2">${msg}</h2>
</div>

    </table>
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

<script>
    layui.use('form', function(){
        var form = layui.form;

        form.render();

        //各种基于事件的操作，下面会有进一步介绍
    });
</script>
</html>
