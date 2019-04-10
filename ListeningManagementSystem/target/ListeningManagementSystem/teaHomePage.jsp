<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%--
  Created by IntelliJ IDEA.
  User: knightx
  Date: 2019/1/20
  Time: 23:36
  To change this template use File | Settings | File Templates.
--%>


<html>
<head>
    <title>老师的家</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta content="width=device-width,initial-scale=1" name="viewport">
    <link rel="stylesheet" href="css/bootstrap.css">
    <link rel="stylesheet" href="js/layui/css/layui.css" media="all">
    <script type="text/javascript" src="js/jquery-3.3.1.js"></script>
    <script src="js/layui/layui.all.js"></script>
    <script src="js/layer/layer.js"></script>
    <script type="text/javascript" src="js/bootstrap.js"></script>



</head>



<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <div class="layui-header">
        <div class="layui-logo">老师的家</div>
        <!-- 头部区域（可配合layui已有的水平导航） -->
        <ul class="layui-nav layui-layout-left ">
        </ul>
        <ul class="layui-nav layui-layout-right">
            <li class="layui-nav-item">
                <a href="javascript:;">
                    <img src="images/proble.jpg" class="layui-nav-img">
                    ${existUser.teaName}
                </a>
                <dl class="layui-nav-child">
                    <dd id="基本资料"><a href="#">基本资料</a></dd>
                    <dd><a href="${pageContext.request.contextPath}/findInfoUI">安全设置</a></dd>
                </dl>
            </li>
            <li class="layui-nav-item"><a href="${pageContext.request.contextPath}/teaLogOut">退了</a></li>
        </ul>
    </div>

    <div class="layui-side layui-bg-black">
        <div class="layui-side-scroll">
            <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
            <ul class="layui-nav layui-nav-tree"  lay-filter="test">

                <li class="layui-nav-item"><a href="${pageContext.request.contextPath}/findMessageWithPageByTeacher?num=1">师生交流</a></li>
                <li class="layui-nav-item"><a href="${pageContext.request.contextPath}/findInfoUI">修改信息</a></li>
                <li class="layui-nav-item"><a id="tlmsg" href="#">我的讲课信息</a></li>
                <li class="layui-nav-item"><a id="tlmsg2" href="#">我的听课信息</a></li>
                <li class="layui-nav-item"><a id="tlmsg3" href="#">历史反馈记录</a></li>
            </ul>
        </div>
    </div>

    <div class="layui-body" style="background-image:url(images/bodymain.jpg) ">
        <!-- 内容主体区域 -->
        <div id="msgdv"></div>
    </div>

    <div  class="layui-footer">
        <!-- 底部固定区域 -->
        © xin.yuan 2018--2019
    </div>
</div>

<script>
  $(function () {
    $('dl dd').click(function () {

        if ($(this).attr('id')==='基本资料'){
            $('#msgdv').empty();
        $.get('${pageContext.request.contextPath}/findTeacherWithOne',{teaAccount:'${existUser.teaAccount}'},function (data) {

            var dataJson = $.parseJSON(data);

            $('<table id="tb" class="table table-bordered table-striped"></table>').appendTo('#msgdv');
            $('<tr><td>编号</td><td>'+dataJson.teaId+'</td></tr>' +
                '<tr><td>姓名</td><td>'+dataJson.teaName+'</td></tr>' +
                '<tr><td>账户</td><td>'+dataJson.teaAccount+'</td></tr>' +
                '<tr><td>密码</td><td>'+dataJson.teaPassword+'</td></tr>'+
                '<tr><td>性别</td><td>'+dataJson.gender+'</td></tr>')
                .appendTo('#tb');


        })
        }

    })

  })

</script>

<script>
    //JavaScript代码区域
    layui.use('element', function(){
        var element = layui.element;

    });
</script>
</body>

<script type="text/javascript">
    $(function () {


/*讲课信息*/
        $('#tlmsg').click(function () {
            $('#msgdv').empty();
            $.get('${pageContext.request.contextPath}/findTeacherListens',
                {teaName:'${existUser.teaName}'},function (data) {

                $('<table id="tb" class="table table-bordered table-striped"></table>').appendTo('#msgdv');
                $('<tr><td>课程</td><td>节数</td><td>日期</td><td>讲课老师</td><td>听课地点</td><td>听课老师</td><td>状态</td></tr>')
                    .appendTo('#tb');
                $.each(eval(data),function () {

                    if (compareTime(this.listenClassDate)) {
                        $('<tr><td>'+this.listenClassCourse+'</td><td>'+this.listens+'</td><td>'+this.listenClassDate+'</td><td>'+this.listenClassLectureTeacher+'</td><td>'+this.classRoom+'</td><td>'+this.listenClassTeachers+'</td><td style="color: red;">过时</td> </tr>').appendTo('#tb');

                    }else {
                        $('<tr><td>'+this.listenClassCourse+'</td><td>'+this.listens+'</td><td>'+this.listenClassDate+'</td><td>'+this.listenClassLectureTeacher+'</td><td>'+this.classRoom+'</td><td>'+this.listenClassTeachers+'</td><td style="color: green;">未开始</td> </tr>').appendTo('#tb');
                    }
                })
            })

        });

    /*听课信息*/
        $('#tlmsg2').click(function () {
            $('#msgdv').empty();
            $.get('${pageContext.request.contextPath}/findTeacherListens2',
                {teaName:'${existUser.teaName}'},function (data) {

                    $('<table id="tb" class="table table-bordered table-striped"></table>').appendTo('#msgdv');
                    $('<tr><td>课程</td><td>节数</td><td>日期</td><td>讲课老师</td><td>听课地点</td><td>听课老师</td><td>操作</td><td>状态</td></tr>')
                        .appendTo('#tb');
                    $.each(eval(data),function () {


                        if (compareTime(this.listenClassDate)) {
                            //本来想用来做屏蔽，但是status字段没考虑完全，所以此功能先不用
                           /* if(this.status!=1){
                            $('<tr><td>'+this.listenClassCourse+'</td><td>'+this.listens+'</td><td>'+this.listenClassDate+'</td><td>'+this.listenClassLectureTeacher+'</td><td>'+this.classRoom+'</td><td>'+this.listenClassTeachers+'</td><td><a style="pointer-events: none" href="${pageContext.request.contextPath}/findFeedBackUI?listenClassId='+this.listenClassId+'">听课反馈</a></td> <td style="color: red;">过时</td> </tr>').appendTo('#tb');
                            }else {
                                $('<tr><td>'+this.listenClassCourse+'</td><td>'+this.listens+'</td><td>'+this.listenClassDate+'</td><td>'+this.listenClassLectureTeacher+'</td><td>'+this.classRoom+'</td><td>'+this.listenClassTeachers+'</td><td><a  href="${pageContext.request.contextPath}/findFeedBackUI?listenClassId='+this.listenClassId+'">听课反馈</a></td> <td style="color: red;">过时</td> </tr>').appendTo('#tb');
                            }*/
                            $('<tr><td>'+this.listenClassCourse+'</td><td>'+this.listens+'</td><td>'+this.listenClassDate+'</td><td>'+this.listenClassLectureTeacher+'</td><td>'+this.classRoom+'</td><td>'+this.listenClassTeachers+'</td><td><a  href="${pageContext.request.contextPath}/findFeedBackUI?listenClassId='+this.listenClassId+'">听课反馈</a></td> <td style="color: red;">过时</td> </tr>').appendTo('#tb');
                        }else {
                            /*if (this.status!=1){
                                $('<tr><td>'+this.listenClassCourse+'</td><td>'+this.listens+'</td><td>'+this.listenClassDate+'</td><td>'+this.listenClassLectureTeacher+'</td><td>'+this.classRoom+'</td><td>'+this.listenClassTeachers+'</td><td><a style="pointer-events: none"  href="${pageContext.request.contextPath}/findFeedBackUI?listenClassId='+this.listenClassId+'">听课反馈</a></td><td style="color: green;">未开始</td> </tr>').appendTo('#tb');
                            }else {
                                $('<tr><td>'+this.listenClassCourse+'</td><td>'+this.listens+'</td><td>'+this.listenClassDate+'</td><td>'+this.listenClassLectureTeacher+'</td><td>'+this.classRoom+'</td><td>'+this.listenClassTeachers+'</td><td><a href="${pageContext.request.contextPath}/findFeedBackUI?listenClassId='+this.listenClassId+'">听课反馈</a></td><td style="color: green;">未开始</td> </tr>').appendTo('#tb');
                            }*/
                            $('<tr><td>'+this.listenClassCourse+'</td><td>'+this.listens+'</td><td>'+this.listenClassDate+'</td><td>'+this.listenClassLectureTeacher+'</td><td>'+this.classRoom+'</td><td>'+this.listenClassTeachers+'</td><td><a href="${pageContext.request.contextPath}/findFeedBackUI?listenClassId='+this.listenClassId+'">听课反馈</a></td><td style="color: green;">未开始</td> </tr>').appendTo('#tb');

                        }

                       /* if(this.status!=0){

                            $('a').each(function () {
                              $(this).attr("disabled",true).removeAttr("href").removeAttr("onclick");//只能反馈一次，禁止再次触发点击事件
                            })
                        }*/



                    })
                })

        });




        /*历史反馈记录*/
        $('#tlmsg3').click(function () {
            $('#msgdv').empty();
            $.get('${pageContext.request.contextPath}/findFeedBackByTea',{listenClassTeachers:'${existUser.teaName}'},function (data) {

                $('<table id="tb" class="table table-bordered table-striped"></table>').appendTo('#msgdv');
                $('<tr><td>讲课老师</td><td>反馈时间</td><td>操作</td></tr>')
                    .appendTo('#tb');
                $.each($.parseJSON(data),function () {
                    $('<tr><td>'+this.listenClassLectureTeacher+'</td><td>'+this.listenClassDate+'</td><td><a href="${pageContext.request.contextPath}/findFeedBackByOne?id='+this.id+'">查看</a> </td></tr>').appendTo('#tb');

                })


            })

        })

    })
</script>

<script type="text/javascript">
    function compareTime (com) {
        var curTime = new Date();

        var endTime = new Date(Date.parse(com));

        return (curTime>=endTime);

    }
</script>

<script>
    layer.msg('${msg}',{
        offset: 't',
    });
</script>




</html>
