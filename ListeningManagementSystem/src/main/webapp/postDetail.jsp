<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page isELIgnored="false"%>
<%--<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>--%>
<%
	response.setContentType("text/html;charset=UTF-8");

	/** 这里获取postID和pageNum的目的是因为在这个页面的时候这两个页面是通过上一个jsp传过来的 
	 * 我们分页的时候是在一个servlet里面请求数据 
	 * 中间没有超链接传参数  所以在servlet中获取这两个的值是获取不到的   
	 * 所以我们先在这个页面保存下来 然后通过设置给此页面的一个标签 
	 * 然后通过在js中获取这个标签的值传到servlet达到效果
	 */

	String postID = request.getParameter("postID");
	String pageNum = request.getParameter("pageNum");

	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<%--<base href="<%=basePath%>">--%>

<title>My JSP 'postDetail.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link href="css/bootstrap.css" rel="stylesheet">
<script src="js/jquery-3.3.1.js"></script>
<script src="js/bootstrap.js"></script>

<script type="text/javascript">
	/** 填充页面的信息  */
	function setContent() {

		$.ajax({

			url : "${pageContext.request.contextPath}/postDetail",
			type : "POST",
			data : {
				postID : $("#head").attr("postID"),
				pageNum : $("#comment").attr("pageNum")
			},
			dataType : "json",
			success : function(value) {
				getData(value);
				console.log(value);
			},
			error : function(data) {
				alert("请求失败");
			},
		});
	};

	//	设置数据
	function getData(value) {

		var post = eval(value.post);
		var html = "<div><font size='3px' color='#0088D8'><b>当前位置 &nbsp;&nbsp;》》》&nbsp;&nbsp;</b></font>帖子详情<br/><br/></div>"
				+ "<div class='panel panel-primary'>"
				+ "<div class='panel-heading'>"
				+ "<div id='title'>"
				+ post[0][1]
				+ "</div>"
				+ "<div id='addPostBtn'>"
				+ "<button class='btn btn-success' type='button' onClick='addPost()'>我也要发帖</button>"
				+ "</div>"
				+ "</div>"
				+ "<div class='panel-body'>"
				+ "<div id='message'>"
				+ post[0][2]
				+ "</div>"
				+ "</div>"
				+ "<div class='panel-footer'>"
				+ "<div id='foot1' style='margin-right:250px'>作者："
				+ post[0][6]
				+ "</div>"
				+ "<div id='foot1'>发帖时间："
				+ post[0][3]
				+ "</div>"
				+ "<div style='float:right; display:inline'>访问量："
				+ post[0][4] + "</div>" + "</div>" + "</div>";
		$("#head").html($(html));
		setComments(value);
	};

	/** 用于填充帖子的评论信息  */
	function setComments(value) {
		var state = value.state;
		var post  = value.post;
		var postID = post[0][0];
		var str = "";
		if (state == "success") {
			var obj = value.comments;
			for ( var i = 0; i < obj.length; i++) {
				str += "<div class='panel panel-info'>"
						+ "<div class='panel-heading'>"
						+ "<div id='foot2' style='margin-right:150px'>"
						+ "评论者："
						+ obj[i][5]
						+ "</div>"
						+ "<div id='foot2'>"
						+ "评论时间:"
						+ obj[i][2]
						+ "</div>"
						+ "<div style='float:right; display: inline'>"
						+ "<button class='btn btn-warning btn-sm' type='button' onClick='reply("
						+ obj[i][0]
						+ ")'>回复</button>"
						+ "</div>"
						+ "</div>"
						+ "<div class='panel-body'>"
						+ "<div id='message'>"
						+ obj[i][1]
						+ "</div>"
						+ "</div>"
						+ "</div>"
						+ "<div id='" +  obj[i][0] +"' style='display:none; margin-bottom: 50px;'>"
						+ "<form action='${pageContext.request.contextPath}/addCommentByPostID' method='post'>"
						+ "<div class='form-group' style='width:80%; margin: auto auto'>"
						+ "<input type='hidden' name='postID' value='" + postID +"'/>"
						+ "<input type='hidden' name='commentContent' value='" + obj[i][1] + "'/>"
						+ "<input type='hidden' name='commentName' value='" + obj[i][5] + "'/>"
						+ "<b style='color:#0088D8; font-size:15px'>回复 "
						+ obj[i][5]
						+ " ：</b><br />"
						+ "<textarea class='form-control' rows='3' id='replyText' name='replyText'></textarea>"
						+ "<div>"
						+ "<button class='btn btn-success' type='submit' id='replyBtn'>提交回复</button>"
						+ "</div>" + "</div>" + "</form>" + "</div>";
			}
			setPage(value); //	调用创建分页的方法
		} else {
			str = "<div style='text-align:center; font-size:20px;'>暂无评论</div>";
		}
		$("#comment").html($(str));
	};

	// 显示回复的div
	function reply(id) {
	   if (document.getElementById(id).style.display == "block") {
					document.getElementById(id).style.display = "none";
					} else {
					document.getElementById(id).style.display = "block";
					}
				}


	//	创建分页的方法
	function setPage(value) {
		var pageSize = value.pages;
		var page = value.page;
		var postID = value.postID;
		var str = "";
		var strGo = "";
		//  按照获取的评论的总页数创建分页的按钮
		// 如果总页数大于1页  则创建一个跳转指定页码的文本框
		if (pageSize > 1) {
			var totalPageNum = pageSize%5==0?(pageSize/5):(pageSize/5+1);
			for ( var i = 1; i <=totalPageNum; i++) {
				if (i == page) {
					str += "<li class='active disabled'><a href='postDetail.jsp?postID="
							+ postID + "&pageNum=" + i + "'>" + i + "</a></li>";
				} else {
					str += "<li class='active'><a href='postDetail.jsp?postID="
							+ postID + "&pageNum=" + i + "'>" + i + "</a></li>";
				}
			}
			strGo = "<input type='text' id='goText' name='pageNum' placeholder='页码'>"
					+ "<input type='hidden' id='postID' name='postID' value=" + postID + ">"
					+ "<button class='btn btn-info' type='button' onClick='go()'>&raquo;</button>";
		}
		$("#pageGo").html($(strGo));
		$("#pageButton").html($(str));
	};

	//	跳转到指定页数的方法
	function go() {
		$.ajax({
			url : "${pageContext.request.contextPath}/postDetail",
			type : "POST",
			data : {
				postID : $("#postID").val(),
				pageNum : $("#goText").val()
			},
			dataType : "json",
			success : function(value) {
				getData(value);
			},
			error : function(data) {
				alert("请求失败");
			},
		});
	};

	//  发布帖子的事件
	function addPost() {

					window.location.href = "${pageContext.request.contextPath}/addPost.jsp";
				}





	//  评论的点击事件
	function discuss() {

		var userId = ${existUser.stuId};
		submitComment(userId);
	}

	// 提交评论的方法
	function submitComment(userId) {
		// 所评论的帖子的ID
		var postId = $("#head").attr("postID");
		var text = $("#commentText").val();
		//	做评论的数据操作
		$.ajax({
			url : "${pageContext.request.contextPath}/addComment",
			type : "post",
			data : {
				userID : userId,
				postID : postId,
				content : text
			},
			dataType : "json",
			success : function(value) {
				if (value.addCommentResult == "success") {
					alert("评论成功");
				} else {
					alert("评论失败...");
				}
				window.location.reload();// 刷新页面 
			},
			error : function(value) {
				alert("fail");
			},
		});
	};
</script>

<style type="text/css">
body {
	background-color: #EBEBEB;
	margin-top: 50px;
}

#back {
	margin: -10px auto 20px auto;
	width: 70%;
	background-color: #FFFFFF;
}

#head {
	padding: 38px;
}

#comment {
	padding: 60px;
}

hr {
	width: 88%;
	height: 2px;
	margin-top: -10px;
	margin-bottom: -45px;
	background-color: #0088D8;
}

#title {
	text-align: center;
	font-size: 18px;
}

#img {
	width: 80px;
	heigh: 200px;
	background-color: blue;
}

#right {
	float: right;
}

#pageDiv {
	float: right;
	width: 700px;
	margin-right: 70px;
	margin-top: -50px;
}

#pageNum {
	width: 80px;
}

#pageGo {
	margin-top: 20px;
	float: right;
}

#goText {
	width: 80px;
	margin-right: 10px;
}

#pages {
	width: 80px;
	float: right;
}

#foot1 {
	width: 130px;
	margin-right: 150px;
	display: inline;
}

#foot2 {
	width: 150px;
	display: inline;
}

#submitDiv {
	width: 70%;
	margin: 50px auto;
}

#sendBtn {
	float: right;
	margin-top: 5px;
}

#replyBtn {
	display: inline;
	margin-top: 5px;
	margin-right: 10px;
	float: right;
}

#addPostBtn {
	float: right;
	margin-right: 0px;
	margin-top: -30px;
}

#div1 {
	margin-top: 100px;
	width: 730px;
	height: 35px;
	margin-left: 60px;
	margin-bottom: 10px;
}

ul{
	display: inline;

}
ul li {
	display: inline;

	}
</style>
</head>

<body onload="setContent();">
	<div id="back">
		<div postID=<%=postID%> id="head"></div>
		<hr />
		<div style="margin-left:850px; margin-top:3px">
			<a href='${pageContext.request.contextPath}/theme'><button class='btn btn-info' type='button'>返回</button>
			</a>
		</div>
		<div pageNum=<%=pageNum%> id="comment"></div>
		<div id="pageDiv">
			<div id="pageGo"></div>
			<div id="pages">
				<ul id="pageButton" class='pagination'>
				</ul>
			</div>
		</div>
		<form role="form" id="submitDiv">
			<div class="form-group" id="discuss">
				<b style="color:#0088D8; font-size:24px">发表评论：</b><br />
				<textarea class="form-control" placehodler="输入内容" rows="5"
					id="commentText"></textarea>
				<div>
					<button class="btn btn-success" type="button" id="sendBtn"
						onClick="discuss()">提交评论</button>
				</div>
			</div>
		</form>
	</div>
</body>
</html>
