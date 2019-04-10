<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>feedBack</title>
    <link rel="stylesheet" href="js/layui/css/layui.css" media="all">
    <script type="text/javascript" src="js/jquery-3.3.1.js"></script>
    <script src="js/layui/layui.all.js"></script>
    <script src="js/layer/layer.js"></script>
</head>

<body>
<form id="fm" class="layui-form" action="${pageContext.request.contextPath}/saveFeedBackById" method="post">
    <table class="layui-table" lay-size="lg" style="margin-bottom: 70px;text-align: center;">
        <thead>
        <tr>
            <th colspan="5" style="text-align: center">广州大学华软软件学院教师听课记录表</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td rowspan="2" colspan="2">授课人情况</td>
            <td>姓名</td>
            <td >职称</td>
            <td>系（部门）</td>
        </tr>
        <tr>
            <td><input type="text" class="layui-input" name="listenClassLectureTeacher"/></td>
            <td><input type="text" class="layui-input" name="position"/></td><%--职称--%>
            <td><input type="text" class="layui-input" name="department"/></td>
        </tr>
        <tr>
            <%--<input type="date" name="listenClassDate"/>--%>
            <td colspan="2">授课时间</td>
            <td colspan="1"><input type="text" name="listenClassDate" class="layui-input" id="listenTime" placeholder="请选择授课时间"/></td>
            <td colspan="2" style="text-align: left">
                <select name="listens">
            <option value="#">节数</option>
            <option value="第一节">第一节</option>
            <option value="第二节">第二节</option>
            <option value="第三节">第三节</option>
            <option value="第四节">第四节</option>
            <option value="第五节">第五节</option>
            <option value="第六节">第六节</option>
            <option value="第七节">第七节</option>
            <option value="第八节">第八节</option>
        </select></td>


        </tr>
        <tr>
            <td colspan="2">授课班级</td>
            <td colspan="3"><input type="text" class="layui-input" name="listenClass" /></td>
        </tr>
        <tr>
            <td rowspan="2">课堂考勤情况</td>
            <td>应到学生人数</td>
            <td>实到学生人数</td>
            <td>迟到学生人数</td>
            <td>早退学生人数</td>
        </tr>
        <tr>
            <td><input type="text" class="layui-input" name="shouldStu" /></td>
            <td><input type="text" class="layui-input" name="actuallyStu" /></td>
            <td><input type="text" class="layui-input" name="lateStu" /></td>
            <td><input type="text" class="layui-input" name="earlyStu" /></td>
        </tr>
        <tr>
            <td colspan="2">课程名称及教学内容介绍</td>
            <td colspan="3"><textarea cols="150" rows="7" name="content"></textarea></td>
        </tr>
        <tr>
            <td colspan="2">教学重点、难点及教学流程安排</td>
            <td colspan="3"><textarea cols="150" rows="7" name="arrangement"></textarea></td>
        </tr>
        <tr>
            <td >项目</td>
            <td >序号</td>
            <td >评议内容</td>
            <td >分值</td>
            <td >评分</td>
        </tr>
        <tr>
            <td rowspan="2">教学态度</td>
            <td>1</td>
            <td >着装整齐，仪容端庄，准备充分，按时上下课</td>
            <td>10</td>
            <td><input type="text" class="layui-input" name="score"/></td>
        </tr>
        <tr>
            <td>2</td>
            <td >严格考勤，准确记载，认真进行课堂管理，维持教学秩序</td>
            <td>10</td>
            <td><input type="text" class="layui-input" name="score"/></td>
        </tr>
        <tr>
            <td rowspan="4">教学内容</td>
            <td>3</td>
            <td >讲授内容正确无误，概念准确，条理清晰，重点、难点突出</td>
            <td>15</td>
            <td><input type="text" class="layui-input" name="score"/></td>
        </tr>
        <tr>
            <td>4</td>
            <td >注意理论联系实际，深入浅出，有利于培养学生能力</td>
            <td>10</td>
            <td><input type="text" class="layui-input" name="score"/></td>
        </tr>
        <tr>
            <td>5</td>
            <td >讲授内容丰富，能运用多学科知识从事教学内容，信息量大</td>
            <td>10</td>
            <td><input type="text" class="layui-input" name="score"/></td>
        </tr>
        <tr>
            <td>6</td>
            <td >注重吸收本学科的新成果，反映学科新进展、新动向</td>
            <td>5</td>
            <td><input type="text" class="layui-input" name="score"/></td>
        </tr>
        <tr>
            <td rowspan="4">教学方法</td>
            <td>7</td>
            <td >课程整体设计合理，重点突出，对难点问题讲解清楚</td>
            <td>10</td>
            <td><input type="text" class="layui-input" name="score"/></td>
        </tr>
        <tr>
            <td>8</td>
            <td >教学过程结构紧凑，时间分配恰当，利用充分有效</td>
            <td>10</td>
            <td><input type="text" class="layui-input" name="score"/></td>
        </tr>
        <tr>
            <td>9</td>
            <td >合理利用教具和现代化教育技术手段，课件制作水平高，板书工整</td>
            <td>10</td>
            <td><input type="text" class="layui-input" name="score"/></td>
        </tr>
        <tr>
            <td>10</td>
            <td >教学方法灵活，注重启发学生思考，积极与学生互动，课堂气氛活跃</td>
            <td>10</td>
            <td><input type="text" class="layui-input" name="score"/></td>
        </tr>
        <tr>
            <td colspan="2">评定等级</td>
            <td id="grade"></td>
            <td >总分</td>
            <td id="totalScore"></td>
        </tr>
        <tr>
            <td colspan="2">意见与建议</td>
            <td colspan="3"><textarea cols="150" rows="7" name="suggest"></textarea></td>
        </tr>
        <tr>
            <td rowspan="2" colspan="2">听课人情况</td>
            <td>姓名</td>
            <td>职称</td>
            <td>系（部门）</td>
        </tr>
        <tr>
            <td><input type="text" class="layui-input" name="listenClassTeachers"/></td>
            <td><input type="text" class="layui-input" name="listenClassPosition"/></td><%--职称--%>
            <td><input type="text" class="layui-input" name="listenClassDepartment"/></td>
        </tr>

            <input type="text" name="listenClassId" hidden value="${listenClassId}"/>
            <input type="text" id="grade1" hidden name="grade"/>
             <input type="text" id="totalScore1" hidden name="totalScore"/>
        <tr>
            <td colspan="5"><input onclick="mycheckBtn()" id="btncheck" type="button" class="layui-btn layui-btn-normal" value="提交">
                <input type="reset" class="layui-btn layui-btn-warm" value="重置">
            </td>

        </tr>

        </tbody>
    </table>
</form>

</body>

<script>
    layui.use(['form','laydate'], function(){
        var form = layui.form;
        var laydate = layui.laydate;
        form.render();
        laydate.render({
            elem: '#listenTime'
        });
        //各种基于事件的操作，下面会有进一步介绍
    });
</script>

<script>

 function mycheckBtn(){

     var flag = true;//是否全部输入  默认true

     $("input").each(function (){

         if($(this).val()==""){//有空输入，将flag置为false

             flag = false;//

         }

     });

     if(flag){

         layer.msg('确认提交？', {
             time: 20000, //20s后自动关闭
             btn: ['确认']
         });

     }else{

         layer.msg('有空输入，请输入再提交', {
             time: 20000, //20s后自动关闭
             btn: ['好的我明白了']
         });
         return false;
     }
     $('#fm').submit();

 }
</script>








<script>
    $("input[name='score']").keyup(function() {
        var sum = 0;
        $("input[name='score']").each(function() {
            var r = /^-?\d+$/;　 //正整数
            if($(this).val() != '' && !r.test($(this).val())) {
                $(this).val(""); //正则表达式不匹配置空
            } else if($(this).val() != '') {
                sum += parseInt($(this).val());
            }
            $("#totalScore").text(sum);
            $("#totalScore1").val(sum);
            if(sum>=90&sum<=100){
                $('#grade').text("优");
                $('#grade1').val("优");
            }
            if(sum>=80&sum<=89){
                $('#grade').text("良");
                $('#grade1').val("良");
            }
            if(sum>=70&sum<=79){
                $('#grade').text("中");
                $('#grade1').val("中");
            }
            if(sum>=60&sum<=69){
                $('#grade').text("及格");
                $('#grade1').val("及格");
            }
            if(60>sum){
                $('#grade').text("不及格");
                $('#grade1').val("不及格");
            }


        });
    });
</script>
























</html>