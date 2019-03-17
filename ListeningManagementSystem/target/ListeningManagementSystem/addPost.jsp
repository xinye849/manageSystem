<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>发帖子</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link href="css/bootstrap.css" rel="stylesheet">
<script src="js/jquery-3.3.1.js"></script>
<script src="js/bootstrap.js"></script>
<script type="text/javascript">
	// 提交数据
	function add() {
		if ($.trim($('#title').val()) === "" || $.trim($('#title').val()) == null) {
			alert("请输入标题");
			return false;
		}
		if ($.trim($('#commentText').val()) === "" || $.trim($('#commentText').val()) == null) {
			alert("请输入内容");
			return false;
		}
		$.post('${pageContext.request.contextPath}/addPost',{"operator":${existUser.stuId},"title":$('#title').val(),"content":$('#commentText').val(),"type" : $('#sel').val()},
				function (data) {

			var res = JSON.parse(data).result;
			if(res == "success") {
				alert("发表成功!!!");
				window.location.href = "${pageContext.request.contextPath}/theme";
			}else {
				alert("发表失败...");
			}


		})
		// 获取数据(用户的ID, 帖子的内容)
		/*$.ajax({
			url : "AddPostServlet",
			type : "POST",
			data : {
				userID : $("#back").attr("userID"),
				postTitle : $("#title").val(),
				postContent : $("#commentText").val(),
				postType : $("#sel").val()
			},
			dataType : "json",
			success : function(value) {
				var res = value.result;
				if(res == "success") {
					alert("发表成功!!!");
					window.location.href = "ThemeServlet";
				}else {
					alert("发表失败...");
				}
			},
			error : function(data) {
				alert("请求失败");
			},
		});*/
	}
</script>
<style type="text/css">
body {
	background-color: #EBEBEB;
	margin-top: 50px;
}

#back {
	margin: auto auto;
	padding: 40px;
	width: 75%;
	height: 600px;
	background-color: #FFFFFF;
}

#postPanel {
	width: 800px;
	height: 500px;
	float: left;
	margin-left: 70px;
}

#mess {
	margin-top: 24px;
	margin-left: 12px;
	color: #0088D8;
}

#topBar {
	margin: auto auto;
	width:800px;
	height: 25px;
	text-align: center;
	font-size: 20px;
}

#connent {
	margin-top: 50px;
}

#sendBtn {
	float: right;
	margin-top: 5px;
}

#title {
	width: 60%;
	height: 60px;
}

#sel {
	margin-top: -50px;
	margin-right: 40px;
	width: 200px;
	height: 40px;
	float: right;
}
</style>
</head>

<body onload="setMessage()">
	<div id="back" userID=${existUser.stuId}>
		<div class='panel panel-primary' id="topBar">
			<div class='panel-heading'>发表帖子</div>
		</div>
		<div id="connent">
			<div id="postPanel">
				<div class="form-group">
					<b style="color:#0088D8; font-size:24px">标题</b> <input id="title"
						type="text" class="form-control" name="query"
						placeholder="帖子标题:建议少于30字">
				</div>
				<div class="form-group" id="discuss">
					<b style="color:#0088D8; font-size:24px">内容</b><br />
					<textarea class="form-control" rows="11"
						id="commentText"></textarea>
					<div>
						<button class="btn btn-primary" type="button" id="sendBtn"
							onClick="add()">提交</button>
					</div>
				</div>
			</div>
		</div>
