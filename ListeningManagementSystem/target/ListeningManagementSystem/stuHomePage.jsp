<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%--
  Created by IntelliJ IDEA.
  User: knightx
  Date: 2019/1/16
  Time: 19:52
  To change this template use File | Settings | File Templates.
--%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta content="width=device-width,initial-scale=1" name="viewport">
    <link rel="stylesheet" href="css/bootstrap.css">
    <link rel="stylesheet" href="css/layui.css">
    <script type="text/javascript" src="js/jquery-3.3.1.js"></script>
    <script type="text/javascript" src="js/bootstrap.js"></script>
    <script type="text/javascript" src="js/layui.js" media="all"></script>
     <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<title>学生主页</title>


</head>
<body class="layui-layout-body">
<ul class="layui-nav layui-bg-green" >
    <li class="layui-nav-item "><a href="" >&nbsp;</a></li>

</ul>
<ul class="layui-nav layui-layout-right ">
    <li class="layui-nav-item "><a href="" >${existUser.stuName}</a></li>
    <li class="layui-nav-item "><a href="${pageContext.request.contextPath}/stuLogOut" >退出登录</a></li>
</ul>

</br>
<div class="layui-container layui-layout layui-layout-admin">
<%--第一行--%>
    <div class="layui-row">
        <div class="layui-col-xs6 layui-col-sm6 layui-col-md3">
          <div class="layui-anim layui-anim-rotate" >
              <a href="${pageContext.request.contextPath}/findMessageWithPage?num=1"><img src="images/proble.jpg" alt="课后问题"></a>
            </div>
        </div>

        <div  class="layui-col-xs6 layui-col-sm6 layui-col-md3">
            <div class="layui-anim layui-anim-rotate">
                <a href="${pageContext.request.contextPath}/addMessageUI"><img src="images/awant.jpg" alt="我要提问"></a>
            </div>
         </div>

        <div  class="layui-col-xs6 layui-col-sm6 layui-col-md3">
            <div class="layui-anim layui-anim-rotate">
                <a href="${pageContext.request.contextPath}/enterForumUI"><img src="images/forum.jpg" alt="课后论坛"></a>
            </div>
         </div>

        <div class="layui-col-xs6 layui-col-sm6 layui-col-md3">
            <div class="layui-anim layui-anim-rotate" >
                <a href="${pageContext.request.contextPath}/chatRoomUI"><img src="images/line.jpg" alt="在线切磋"></a>
            </div>
        </div>
    </div>

    </br>
<%--第二行--%>

    <div class="layui-row">
        <div class="layui-col-xs6 layui-col-sm6 layui-col-md3">
            <div id="查看信息" class="layui-anim layui-anim-rotate">
                <img src="images/infomation.jpg" alt="查看信息">
            </div>
        </div>

        <div  class="layui-col-xs6 layui-col-sm6 layui-col-md3">
            <div id="修改信息" class="layui-anim layui-anim-rotate">
                <img src="images/change.jpg" alt="修改信息">
            </div>
        </div>

        <div  class="layui-col-xs6 layui-col-sm6 layui-col-md3">
            <div id="听课管理" class="layui-anim layui-anim-rotate">
                <a href="${pageContext.request.contextPath}/manage.jsp"><img src="images/manage.jpg" alt="听课管理"></a>
            </div>
        </div>

        <div class="layui-col-xs6 layui-col-sm6 layui-col-md3">
            <div id="敬请期待" class="layui-anim layui-anim-rotate">
                <img src="images/forward.jpg" alt="敬请期待">
            </div>
        </div>
    </div>

    <%--第三行--%>

    <div class="layui-row">
        <div class="layui-col-xs6 layui-col-sm6 layui-col-md12" >

            <div id="msgdv"  ></div>
            <div>
                <h2 id="msgh2">${requestScope.msg}</h2>
            </div>

        </div>

    </div>



    <div class="layui-footer" style="background-color: white">
        <!-- 底部固定区域 -->
        © xin.yuan 2018-2019
    </div>


</div>

</body>


<script type="text/javascript">
    $(function () {
        $('div').click(function () {


            if ($(this).attr('id')==='查看信息'){

                $('#msgdv').empty();

                $.get('${pageContext.request.contextPath}/findStudentByID',{stuId:'${existUser.stuId}'},function (data) {

                    var dataJson = $.parseJSON(data);

                    $('<table id="tb" class="table table-bordered table-striped"></table>').appendTo('#msgdv');
                    $('<tr><td>账号</td><td>'+dataJson.stuAccount+'</td></tr>' +
                        '<tr><td>姓名</td><td>'+dataJson.stuName+'</td></tr>' +
                        '<tr><td>密码</td><td>'+dataJson.stuPassword+'</td></tr>' +
                        '<tr><td>性别</td><td>'+dataJson.gender+'</td></tr>')
                        .appendTo('#tb');


                })
            }

            else if ($(this).attr('id')==='修改信息') {
                $('#msgdv').empty();
                $('<form action="${pageContext.request.contextPath}/updateStudent" method="post" id="fm"><table>\n' +
                    '\n' +
                    '    <tr><td><label for="stutName" class="col-md-1 control-label">姓名:</label></td><td><input type="text" name="stuName" value="${existUser.stuName}" id="stuName"/></td></tr>\n' +
                    '    <tr><td><label for="stuAccount" class="col-md-1 control-label">编号:</label></td><td><input type="text" name="stuAccount" value="${existUser.stuAccount}" id="stuAccount" readonly/></td></tr>\n' +
                    '    <tr><td><label for="stuPassword" class="col-md-1 control-label">新密码:</label></td><td><input type="password" name="stuPassword" value="${existUser.stuPassword}" id="stuPassword"/></td></tr>\n' +
                    '    <tr><td><label class="col-md-1 control-label">性别:</label></td><c:if test="${existUser.gender==\'男\'}">\n' +
                    '    <td><input type="radio" name="gender" value="男" checked/>男\n' +
                    '    <input type="radio" name="gender" value="女"/>女</td></tr>\n' +
                    '        </c:if>\n' +
                    '\n' +
                    '    <c:if test="${existUser.gender==\'女\'}">\n' +
                    '        <td><input type="radio" name="gender" value="男"/>男\n' +
                    '        <input type="radio" name="gender" value="女" checked/>女</td>\n' +
                    '    </c:if>\n' +
                    '    <c:if test="${existUser.gender==null||existUser.gender==\'\'}">\n' +
                    '        <td><input type="radio" name="gender" value="男"/>男\n' +
                    '        <input type="radio" name="gender" value="女" />女</td>\n' +
                    '    </c:if>\n' +
                    '<tr><td><input type="hidden" name="stuId" value="${existUser.stuId}"/></td></tr>\n' +
                    '    <tr><td><input class="btn btn-default" type="submit" value="修改"/></td><td><input class="btn btn-default" type="reset" value="重置"/></td></tr>\n' +
                    '\n' +
                    '\n' +
                    '\n' +
                    '</table></form>').appendTo('#msgdv');

            }



        })

    })
</script>



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
