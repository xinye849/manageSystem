<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page isELIgnored="false"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<link href="css/bootstrap.css" rel="stylesheet">
<script src="js/jquery-3.3.1.js"></script>
<script src="js/bootstrap.js"></script>
    <link href="js/layui/css/layui.css" rel="stylesheet">
<style type="text/css">
body {
	background-color: #EBEBEB;
}

#content {
	background-color: #FFFFFF;
	margin: auto auto;
	width: 90%;
	height: 100%;
}

#themes {
	border: 1px solid white;
	width: 100%;
	height: 100%;
	/*float: left;*/
	/*margin-left: 38px;*/
	text-align: center;
	padding: 5px;
	/*float: left;*/


}

thead {
	color: #0088D8;
	font-size: 20px;
}

#blank {
	background-color: #EBEBEB;
	float: left;
	width: 1150px;
	height: 15px;
	color: #0088D8;
	font-size: 24px;
	margin-left: 35px;
	margin-bottom: 10px;
}

tr {
	line-height: 30px;
	text-align: center;
}

hr {
	width: 2px;
	height: 300px;
	background-color: #0088D8;
	float: left;
	margin-left: 20px;
}

.feature-divider {
	margin: 40px 0;
}

.feature {
	padding: 30px 0;
}

#dataTable {
	margin-top: 25px;
	border: 1px solid gray;
}

#postDiv {
	margin: 60px auto 80px auto;
	width: 1100px;
}

#newDiv {
	float: left;
	width: 350px;
}

#topRight {
	margin-top: 35px;
	float: right;
	margin-left: 5px;
	width: 350px;
	float: right;
}

#info {
	color: #0088D8;
	font-size: 20px;
	text-align: center
}

a:hover {
	background-color: #008800;
}

#messItem {
	white-space:  nowrap;
	text-overflow:  ellipsis;
	overflow:  hidden;
	width:  150px;
	max-height:  20px;
}
</style>

</head>
<body>
	<div id="content">
		<div id="postDiv">
			<div id="newDiv">
				<h3 id="info">
					<img src="images/news.png" width="22" height="22">&nbsp;
					<a href='${pageContext.request.contextPath}/noticesAll'>公告栏</a>
				</h3>
				<div class="list-group">
					<c:forEach items="${noticeList}" var="notices">
						<div id="messItem">
							<a href="${pageContext.request.contextPath}/noticesAll?id=${notices.id}"
								class="list-group-item" id="items"><span
								class="label label-success" style="margin-right:20px">${notices.publishTime}</span>${notices.title}</a>
						</div>
					</c:forEach>
				</div>

			</div>
           <%-- <div style="text-align: center"><button class="layui-btn layui-btn-radius layui-btn-normal" onClick='addPost()'>我要发帖</button></div>--%>
            <div >
                <form role="form" action="${pageContext.request.contextPath}/findPostsByCondition" method="post" class="layui-form">
                    <div class="form-group">
                        <input style="width: 200px;float: left; height: 40px" type="text"
                               class="layui-input" name="querytitle" placeholder="输入关键字"/>
                        <input type="hidden" name="actionType" value="themeQuery" />
                        &nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" value="查询" class="layui-btn layui-btn-primary" />
                    </div>
                </form></br>
                <!-- 发帖的按钮 -->
                <div style="text-align: center"> <button class="layui-btn layui-btn-radius layui-btn-normal"  onClick="addPost()">我要发帖</button></div>
            </div>
			<hr />
			<div id="topRight">
				<h3 id="info">
					<img src="images/new.png" width="22" height="22">&nbsp;最新帖子
				</h3>
				<div class="list-group">
					<c:forEach items="${newList}" var="news">
						<a href="postDetail.jsp?postID=${news.postID}&pageNum=1"
							class="list-group-item" id="items"><span
							class="label label-warning" style="margin-right:20px">${news.publishTime}</span>${news.title}</a>
					</c:forEach>
				</div>
			</div>
			<div id="topRight">
				<h3 id="info">
					<img src="images/hot.png" width="22" height="22">&nbsp;最火帖子
				</h3>
				<div class="list-group">
					<c:forEach items="${hotList}" var="hot">
						<a href="postDetail.jsp?postID=${hot.postID}&pageNum=1"
							class="list-group-item" id="items"><span
							class="label label-danger" style="margin-right:20px">${hot.pageview}</span>${hot.title}</a>
					</c:forEach>
				</div>
			</div>
		</div>
		<div id="blank"></div>

<%--底部填充--%>

         <%--   <div  id="themes">
                <c:forEach items="${allPost}" var="p">
                    <a href="postDetail.jsp?postID=${p.postID}&pageNum=1">
                        ${p.pageview}</span>${p.title} ${p.publishTime}</a>
                </c:forEach>
            </div>--%>

<%----%>
        <div  id="themes">
            <table class="layui-table " lay-skin="nob">
                <colgroup>
                    <col width="150">
                    <col width="200">
                    <col>
                </colgroup>

        <tbody>
<c:forEach items="${allPost}" var="p">

        <tr>
            <td><a href="postDetail.jsp?postID=${p.postID}&pageNum=1">${p.title}</a></td>
            <td>${p.publishTime}&nbsp;&nbsp;<span class="label label-danger" style="margin-right:20px">${p.pageview}</span></td>
        </tr>

</c:forEach>
        </tbody>
    </table><%----%>

	</div>
</body>
<script type="text/javascript">
    //  发布帖子的事件
    function addPost() {

        window.location.href = "${pageContext.request.contextPath}/addPost.jsp";
    }
</script>
</html>
