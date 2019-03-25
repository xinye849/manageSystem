<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="utf-8">
    <title>登录页面</title>
    <link rel="stylesheet" href="js/layui/css/layui.css" media="all">
    <script type="text/javascript" src="js/jquery-3.3.1.js"></script>
    <script src="js/layui/layui.all.js"></script>
    <script src="js/layer/layer.js"></script>
</head>
<body >

<div class="layui-carousel" id="lunbo">
    <div carousel-item>
        <div><img id="test1" src="images/simumian4.jpg" alt="丝木棉1"></div>
        <div><img src="images/simumian2.jpg" alt="丝木棉2"></div>
        <div><img src="images/simumian3.jpg" alt="丝木棉3"></div>
        <div><img src="images/simumian5.jpg" alt="丝木棉5"></div>
    </div>
</div>



<script>
    layui.use('carousel', function(){
        var carousel = layui.carousel;
        //建造实例
        carousel.render({
            elem: '#lunbo'
            ,width: '100%'//设置容器宽度
            ,full:true
            ,arrow: 'always' //始终显示箭头
            //,anim: 'updown' //切换动画方式
        });
    });
</script>

</body>

<script type="text/javascript">


   function myLogin(){

        var fm = '<form action="#" method="post" id="fm" ><table>\n' +
            '    <tr><td style="text-align: center"><select  id="select"  >\n' +
            '    <option value=" ">请选择</option>\n' +
            '    <option value="0">管理员</option>\n' +
            '    <option value="1">教师</option>\n' +
            '    <option value="2">学生</option>\n' +
            '    </select></td>\n' +
            '    <td><input type="text" name="account" id="account"  placeholder="账号" class="layui-input"></td></tr>\n' +
            '    <tr><td></td><td><input type="password" name="password" id="password" placeholder="密码" class="layui-input"></td></tr>\n' +
            '    </table></form>';
         layer.open({
            type: 1,
             anim: 1,

            title: '华软听课管理系统登录页面',
            skin: 'layui-layer-lan',
            btn: ['登录', '重置'],

            btn1:function(){
                var account = document.getElementById("account");
                var password = document.getElementById("password");
                if(account.value==""){
                    alert("请输入账户信息");
                    return false;
                }

                if(password.value==""){
                    alert("请输入密码");
                    return false;
                }
                var myselect=document.getElementById("select");
                var index=myselect.selectedIndex ;
                myselect.options[index].value;
                if(myselect.options[index].value=="0"){
                    document.getElementById("account").name="adminAccount";
                    document.getElementById("password").name="adminPassword";

                    document.getElementById("fm").action="${pageContext.request.contextPath}/adminLogin";
                }
                if(myselect.options[index].value=="1"){
                    document.getElementById("account").name="teaAccount";
                    document.getElementById("password").name="teaPassword";

                    document.getElementById("fm").action="${pageContext.request.contextPath}/teaLogin";
                }

                if(myselect.options[index].value=="2"){
                    document.getElementById("account").name="stuAccount";
                    document.getElementById("password").name="stuPassword";
                    document.getElementById("fm").action="${pageContext.request.contextPath}/stuLogin";
                }
                document.getElementById("fm").submit();
            },
            btn2:function(){
                $('fm').reset();
            },


            content: fm,
        });



        $('#account').blur(function () {

            var reg = /^\d{5}$/;
            while(!reg.test(this.value)){


                layer.msg('请输入5位数的数字', {
                    time: 20000, //20s后自动关闭
                    btn: ['好的我明白了']
                });

                return false;
            }



        });



    };

   layer.msg('${msg}',{
       offset: 't',
   });

</script>

<script type="text/javascript">
    $(function () {
        myLogin();

    })
</script>



</html>