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

    <link rel="stylesheet" href="css/layui.css">
    <script type="text/javascript" src="js/jquery-3.3.1.js"></script>

    <script type="text/javascript" src="js/layui.js" media="all"></script>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>听课管理</title>


</head>

<body>

<div id="msgdv" style="overflow:auto" ></div>

</body>

<script type="text/javascript">

    $(function () {


                $('#msgdv').empty();

                $.get('${pageContext.request.contextPath}/findStudentListensByClassRoom',
                    {classRoom:'${existUser.classRoom}'},function (data) {

                        $('<table id="tb" class="layui-table"></table>').appendTo('#msgdv');
                        $('<thead><tr><th>课程</th><th>节数</th><th>日期</th><th>讲课老师</th><th>听课老师</th><th>听课地点</th><th>状态</th></tr></thead>')
                            .appendTo('#tb');
                        $.each(eval(data),function () {


                            if (compareTime(this.listenClassDate)) {
                                $(' <tbody><tr><td>'+this.listenClassCourse+'</td><td>'+this.listens+'</td><td >'+this.listenClassDate+'</td><td>'+this.listenClassLectureTeacher+'</td><td>'+this.listenClassTeachers+'</td><td>'+this.classRoom+'</td><td style="color: red">过时</td></tr></tbody>').appendTo('#tb');

                            }else {
                                $(' <tbody><tr><td>'+this.listenClassCourse+'</td><td>'+this.listens+'</td><td >'+this.listenClassDate+'</td><td>'+this.listenClassLectureTeacher+'</td><td>'+this.listenClassTeachers+'</td><td>'+this.classRoom+'</td><td style="color: green">未开始</td></tr></tbody>').appendTo('#tb');
                            }
                        })

                    });



    })
    
    
</script>

<script type="text/javascript">
    function compareTime (com) {
        var curTime = new Date();

        var endTime = new Date(Date.parse(com));

        return (curTime>=endTime);

    }
</script>

</html>