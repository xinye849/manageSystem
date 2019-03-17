<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%--
  Created by IntelliJ IDEA.
  User: knightx
  Date: 2019/1/30
  Time: 12:51
  To change this template use File | Settings | File Templates.
--%>


<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta content="width=device-width,initial-scale=1" name="viewport">
    <link rel="stylesheet" href="css/bootstrap.css">
    <script type="text/javascript" src="js/jquery-3.3.1.js"></script>

    <title>添加课程安排</title>
</head>
<body>


<form action="${pageContext.request.contextPath}/addListenClass" method="post">

    <table>


        <tr>
            <td>听课名称:</td>
            <td>
                <select name="listenClassCourse">
                    <option value="语文">语文</option>
                    <option value="高数">高数</option>
                    <option value="英语">英语</option>
                    <option value="政治">政治</option>
                    <option value="金融">金融</option>
                    <option value="网络编程">网络编程</option>
                    <option value="java入门">java入门</option>
                    <option value="数据库安全">数据库安全</option>
                    <option value="毛泽东思想">毛泽东思想</option>
                    <option value="网络安全">网络安全</option>
                    <option value="音乐鉴赏">音乐鉴赏</option>
                    <option value="市场营销">市场营销</option>
                    <option value="计算机组成原理">计算机组成原理</option>
                    <option value="现代通信原理">现代通信原理</option>
                    <option value="计算机网络">计算机网络</option>
                    <option value="数理统计">数理统计</option>
                </select>
            </td>
        </tr>
        <tr>
            <td>听课日期:</td>
            <td><input type="date" name="listenClassDate" /></td>
        </tr>
        <tr>
        <td>节数:</td>
            <td>
        <select name="listens">
        <option value="第一节">第一节</option>
        <option value="第二节">第二节</option>
        <option value="第三节">第三节</option>
        <option value="第四节">第四节</option>
            <option value="第五节">第五节</option>
            <option value="第六节">第六节</option>
            <option value="第七节">第七节</option>
            <option value="第八节">第八节</option>
    </select>
            </td>
        </tr>

        <tr>
            <td>听课地点:</td>
            <td>
                <select name="classRoom">
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
                </select>
            </td>
        </tr>


        <tr>
            <td>
<div id="addListenTeacherDiv">

    <a href="#" id="addLT">添加听课老师</a>


</div>
            </td>
            <td><textarea id="teaArea" name="listenClassTeachers" class="form-control" rows="3" cols="5" style="resize:none"></textarea></td>

        </tr>

        <tr>
            <td>讲课老师:</td>
            <td>
                <select name="listenClassLectureTeacher" id="listenClassLectureTeacher" style="width: 100px">



                </select>
            </td>
        </tr>
        <tr>
            <td align="center" colspan="2">
        <input type="submit" />
            </td>
        </tr>



    </table>
</form>
<div id="msgdv">
<h2 id="msgh2">${requestScope.msg}</h2>
</div>
<script type="text/javascript">
    //让添加听课信息成功后3秒消失
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
</body>
<script type="text/javascript">



    //通过ajax异步请求得到老师信息
   $(function () {
//sum控制讲课老师不会重复出现
var sum=0;
       $('#addLT').click(function () {
sum++;
//控制听课老师不会重复出现
           if ($('#dvat').length==0) {


        //动态创建一个层
           var dvatobj =
               $('<div id="dvat" style="background-color: white;width: 150px ;' +
                   'border:1px solid red;' +
                   'position: absolute;"><span style="float: right;cursor: pointer">关闭</span> </div>')
                   .appendTo('body');
           //为'关闭'span添加点击事件
           $('span',dvatobj).click(function () {
               $(this).parent().remove();

           });
           //获取点击链接的坐标
           var x = $(this).offset().left;
           var y = $(this).offset().top+$(this).height();

           dvatobj.css({'left':x+'px','top':y+'px'});

           //动态创建ul和li
          var ulList = $('<ul style="list-style-type:none;margin: 0;padding: 0;clear: both;"></ul>').appendTo('#dvat');


           $.get('${pageContext.request.contextPath}/findAllTeacher', function(data) {



               $.each(eval(data),function(){

//后台传过来的数据渲染到li中
                   $('<li style="text-align: center;cursor: pointer;">'+this.teaName+'</li>')
                       .appendTo(ulList).mouseover(function () {
                       $(this).css('backgroundColor','yellow').siblings().css('backgroundColor','white')

                   }).click(function () {
if ( $('#teaArea').val()==''||$('#teaArea').val()==null){ $('#teaArea').val($(this).text());}
                   else{$('#teaArea').val($('#teaArea').val()+','+$(this).text())};
                   });



//二次利用把老师信息添加到option中



                    if (sum == 1) {
                        $('<option>' + this.teaName + '</option>').val(this.teaName).appendTo('#listenClassLectureTeacher');

                    }





               });




           });
       }

       })

   })
</script>
</html>
