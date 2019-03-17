<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@page isELIgnored="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<table  width="100%" border="0" cellpadding="0" cellspacing="0">
  <tr><td height="32" align="center" class="word_orange ">欢迎来到心之语聊天室！</td></tr>
  <tr>
  <td height="23" align="center"><a  href="#" onclick="set('所有人')">所有人</a></td>
  </tr>  
<c:forEach var="entry" items="${userMap}">

  <tr>
    <td height="23" align="center">

    	<a href="#" onclick="set('${entry.key.stuName}')">${entry.key.stuName}</a>
    	<c:if test="${existUser.type == 'admin' and entry.key.type != 'admin'}">
			<a href="${ pageContext.request.contextPath }/kick?id=${entry.key.stuId}">踢下线</a>
		</c:if>
		
	</td>
  </tr>
</c:forEach>

<tr><td height="30" align="center">当前在线[<font color="#FF6600">${fn:length(userMap)}</font>]人</td></tr>
</table>