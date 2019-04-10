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
            <td>${feedBack.listenClassLectureTeacher}</td>
            <td>${feedBack.position}<%--职称--%>
            <td>${feedBack.department}</td>
        </tr>
        <tr>
            <%--<input type="date" name="listenClassDate"/>--%>
            <td colspan="2">授课时间</td>
            <td colspan="1">${feedBack.listenClassDate}</td>
            <td colspan="2" style="text-align: left">${feedBack.listens}</td>
       </tr>
        <tr>
            <td colspan="2">授课班级</td>
            <td colspan="3">${feedBack.listenClass}</td>
        </tr>
        <tr>
            <td rowspan="2">课堂考勤情况</td>
            <td>应到学生人数</td>
            <td>实到学生人数</td>
            <td>迟到学生人数</td>
            <td>早退学生人数</td>
        </tr>
        <tr>
            <td>${feedBack.shouldStu}</td>
            <td>${feedBack.actuallyStu}</td>
            <td>${feedBack.lateStu}</td>
            <td>${feedBack.earlyStu}</td>
        </tr>
        <tr>
            <td colspan="2">课程名称及教学内容介绍</td>
            <td colspan="3">${feedBack.content}</td>
        </tr>
        <tr>
            <td colspan="2">教学重点、难点及教学流程安排</td>
            <td colspan="3">${feedBack.arrangement}</td>
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
            <td name="score"></td>
        </tr>
        <tr>
            <td>2</td>
            <td >严格考勤，准确记载，认真进行课堂管理，维持教学秩序</td>
            <td>10</td>
            <td name="score"></td>
        </tr>
        <tr>
            <td rowspan="4">教学内容</td>
            <td>3</td>
            <td >讲授内容正确无误，概念准确，条理清晰，重点、难点突出</td>
            <td>15</td>
            <td name="score"></td>
        </tr>
        <tr>
            <td>4</td>
            <td >注意理论联系实际，深入浅出，有利于培养学生能力</td>
            <td>10</td>
            <td name="score"></td>
        </tr>
        <tr>
            <td>5</td>
            <td >讲授内容丰富，能运用多学科知识从事教学内容，信息量大</td>
            <td>10</td>
            <td name="score"></td>
        </tr>
        <tr>
            <td>6</td>
            <td >注重吸收本学科的新成果，反映学科新进展、新动向</td>
            <td>5</td>
            <td name="score"></td>
        </tr>
        <tr>
            <td rowspan="4">教学方法</td>
            <td>7</td>
            <td >课程整体设计合理，重点突出，对难点问题讲解清楚</td>
            <td>10</td>
            <td name="score"></td>
        </tr>
        <tr>
            <td>8</td>
            <td >教学过程结构紧凑，时间分配恰当，利用充分有效</td>
            <td>10</td>
            <td name="score"></td>
        </tr>
        <tr>
            <td>9</td>
            <td >合理利用教具和现代化教育技术手段，课件制作水平高，板书工整</td>
            <td>10</td>
            <td name="score"></td>
        </tr>
        <tr>
            <td>10</td>
            <td >教学方法灵活，注重启发学生思考，积极与学生互动，课堂气氛活跃</td>
            <td>10</td>
            <td name="score"></td>
        </tr>
        <tr>
            <td colspan="2">评定等级</td>
            <td >${feedBack.grade}</td>
            <td >总分</td>
            <td>${feedBack.totalScore}</td>
        </tr>
        <tr>
            <td colspan="2">意见与建议</td>
            <td colspan="3">${feedBack.suggest}</td>
        </tr>
        <tr>
            <td rowspan="2" colspan="2">听课人情况</td>
            <td>姓名</td>
            <td>职称</td>
            <td>系（部门）</td>
        </tr>
        <tr>
            <td>${feedBack.listenClassTeachers}</td>
            <td>${feedBack.listenClassPosition}</td><%--职称--%>
            <td>${feedBack.listenClassDepartment}</td>
        </tr>




        </tbody>
    </table>
</form>

</body>



<script>
    $(function () {


        var scores= '${feedBack.score}';
        var scoreList = scores.split(',');
        $("td[name='score']").each(function (i) {
            $(this).text(scoreList[i])

        })

    })



</script>
























</html>