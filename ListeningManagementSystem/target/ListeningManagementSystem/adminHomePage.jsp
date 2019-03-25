<%@ page import="xin.yuan.entity.Admin" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<%--
  Created by IntelliJ IDEA.
  User: knightx
  Date: 2019/1/16
  Time: 19:53
  To change this template use File | Settings | File Templates.
--%>


<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta content="width=device-width,initial-scale=1" name="viewport">
    <link rel="stylesheet" href="css/bootstrap.css">
    <link rel="stylesheet" href="css/layui.css">
    <script type="text/javascript" src="js/jquery-3.3.1.js"></script>
    <script type="text/javascript" src="js/bootstrap.js"></script>
    <script type="text/javascript" src="js/layui.js"></script>
    <title>Title</title>
    <script type="text/javascript" >
        layui.use('element', function(){
            var element = layui.element;

            //一些事件监听
            element.on('tab(demo)', function(data){
                console.log(data);
            });
        });
    </script>


</head>
<script type="text/javascript">
    $(function () {

        $('dl dd').click(function () {



                if ($(this).text()==='查看信息'){
                    $('#msgdv').empty();

                    $.get('${pageContext.request.contextPath}/findAdminByID',{adminId:'${existUser.adminId}'},function (data) {

                        var dataJson = $.parseJSON(data);

                        $('<table id="tb" class="table table-bordered table-striped"></table>').appendTo('#msgdv');
                        $('<tr><td>账号</td><td>'+dataJson.adminAccount+'</td></tr>' +
                            '<tr><td>姓名</td><td>'+dataJson.adminName+'</td></tr>' +
                            '<tr><td>密码</td><td>'+dataJson.adminPassword+'</td></tr>' +
                            '<tr><td>性别</td><td>'+dataJson.gender+'</td></tr>')
                            .appendTo('#tb');
                        /* $('<tr><td>'+dataJson.adminAccount+'</td><td>'+dataJson.adminName+'</td><td>'+dataJson.adminPassword+'</td><td>'+dataJson.gender+'</td></tr>').appendTo('#tb');*/

                    })
                }
                else if ($(this).text()==='修改信息') {
                    $('#msgdv').empty();
                    $('<form action="${pageContext.request.contextPath}/updateAdmin" method="post" id="fm"><table>\n' +
                        '\n' +
                        '    <tr><td><label for="adminName" class="col-md-1 control-label">姓名:</label></td><td><input type="text" name="adminName" value="${existUser.adminName}" id="adminName"/></td></tr>\n' +
                        '    <tr><td><label for="adminAccount" class="col-md-1 control-label">编号:</label></td><td><input type="text" name="adminAccount" value="${existUser.adminAccount}" id="adminAccount" readonly/></td></tr>\n' +
                        '    <tr><td><label for="adminPassword" class="col-md-1 control-label">新密码:</label></td><td><input type="password" name="adminPassword" value="${existUser.adminPassword}" id="adminPassword"/></td></tr>\n' +
                        '    <tr><td><label class="col-md-1 control-label">性别:</label></td><c:if test="${existUser.gender==\'男\'}">\n' +
                        '    <td><input type="radio" name="gender" value="男" checked/>男\n' +
                        '    <input type="radio" name="gender" value="女"/>女</td>\n' +
                        '        </c:if>\n' +
                        '\n' +
                        '    <c:if test="${existUser.gender==\'女\'}">\n' +
                        '       <td> <input type="radio" name="gender" value="男"/>男\n' +
                        '        <input type="radio" name="gender" value="女" checked/>女</td>\n' +
                        '    </c:if>\n' +
                        '    <c:if test="${existUser.gender==null||existUser.gender==\'\'}">\n' +
                        '       <td> <input type="radio" name="gender" value="男"/>男\n' +
                        '        <input type="radio" name="gender" value="女" />女</td></tr>\n' +
                        '    </c:if>\n' +
                        '<tr><td><input type="hidden" name="adminId" value="${existUser.adminId}"/></td></tr>\n' +
                        '    <tr><td><input class="btn btn-default" type="submit" value="修改"/></td><td><input class="btn btn-default" type="reset" value="重置"/></td></tr>\n' +
                        '\n' +
                        '\n' +
                        '\n' +
                        '</table></form>').appendTo('#msgdv');

                }
                else if($(this).text()==='退出登录'){

                    if(confirm("确定要退出吗？")){
                        window.location.href='${pageContext.request.contextPath}/admLogOut';
                    }
                }

            

          
        })

    })
</script>
<body class="layui-layout-body ">

<div class="layui-layout layui-layout-admin ">
    <div class="layui-header">
        <div class="layui-logo">管理员后台</div>
        <!-- 头部区域（可配合layui已有的水平导航） -->
        <ul class="layui-nav layui-layout-left ">
            <li class="layui-nav-item">
                <a href="">控制台<span class="layui-badge-dot"></span></a>
                <dl class="layui-nav-child">
                    <dd> <a href="${pageContext.request.contextPath}/findTeacherWithPage?num=1">老师管理</a></dd>
                    <dd> <a href="${pageContext.request.contextPath}/addListenClassUI">添加听课安排</a></dd>
                </dl>
            </li>
            <li class="layui-nav-item">
                <a href="">查看日志<span class="layui-badge">9</span></a>
            </li>
            <li class="layui-nav-item">
                <a href="javascript:;">其它系统</a>
                <dl class="layui-nav-child">
                    <dd><a href="">邮件管理</a></dd>
                    <dd><a href="">消息管理</a></dd>
                    <dd><a href="">授权管理</a></dd>
                </dl>
            </li>
        </ul>

<ul class="layui-nav layui-layout-right ">

    <li class="layui-nav-item">
        <a href=""><img src="images/simumian4.jpg" class="layui-nav-img"/>${existUser.adminName}</a>
        <dl class="layui-nav-child">
            <dd><a href="javascript:;">修改信息</a></dd>
            <dd><a href="javascript:;">查看信息</a></dd>
            <dd><a href="javascript:;">退出登录</a></dd>
        </dl>
    </li>
</ul>

    </div>

    <div class="layui-side layui-bg-black">
        <div class="layui-side-scroll">
            <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
            <ul class="layui-nav layui-nav-tree"  lay-filter="test">
                <li class="layui-nav-item layui-nav-itemed">
                    <a href="javascript:;">基本信息</a>
                    <dl class="layui-nav-child">
                        <dd><a id="a1" href="javascript:;">姓名</a></dd>
                        <dd><a id="a2" href="javascript:;">账户信息</a></dd>

                    </dl>
                </li>

                <li class="layui-nav-item"><a href="${pageContext.request.contextPath}/findTeacherWithPage?num=1">老师管理</a></li>
                <li class="layui-nav-item"><a href="${pageContext.request.contextPath}/addTeacherUI">添加老师</a></li>
                <li class="layui-nav-item"><a href="${pageContext.request.contextPath}/addStudentUI">添加学生</a></li>
                <li class="layui-nav-item"><a href="${pageContext.request.contextPath}/addListenClassUI">添加听课安排</a></li>
            </ul>
        </div>
    </div>

    <div class="layui-body layui-bg-molv" style="background-color: #bce8f1">
        <!-- 内容主体区域 -->
        <div id="msgdv">
        </div>

        <div>
            <h2 id="msgh2">${requestScope.msg}</h2>
        </div>
    </div>

    <div class="layui-footer">
        <!-- 底部固定区域 -->
        © yuanxin.com 2018--2019 不能作为商业用途，不然，你懂得
    </div>
</div>



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

<script type="text/javascript">
    $('#a1').click(function () {
        $('#msgdv').empty();

        $.get('${pageContext.request.contextPath}/findAdminByID',{adminId:'${existUser.adminId}'},function (data) {

            var dataJson = $.parseJSON(data);

            $('<table id="tb" class="table table-bordered table-striped"></table>').appendTo('#msgdv');
            $('<tr><td>姓名</td><td>'+dataJson.adminName+'</td></tr>').appendTo('#tb');


        })


    })

    $('#a2').click(function () {
        $('#msgdv').empty();

        $.get('${pageContext.request.contextPath}/findAdminByID',{adminId:'${existUser.adminId}'},function (data) {

            var dataJson = $.parseJSON(data);

            $('<table id="tb" class="table table-bordered table-striped"></table>').appendTo('#msgdv');
            $('<tr><td>姓名</td><td>'+dataJson.adminName+'</td></tr>' +
                '<tr><td>账号</td><td>'+dataJson.adminAccount+'</td></tr>' +
                '<tr><td>密码</td><td>'+dataJson.adminPassword+'</td></tr>').appendTo('#tb');


        })


    })
</script>
</body>

</html>
