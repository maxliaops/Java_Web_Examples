<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
	<head>
		<title>查看我的所有好友</title>
		<base href="<%=basePath%>">
		<link type="text/css" rel="stylesheet" href="css/style.css">
	</head>
	<body>
    	<center>
			<table border="0" width="1003" height="299" cellpadding="0" cellspacing="0"><tr><td background="images/top.jpg"></td></tr></table>
	   		<c:set var="friend" value="${requestScope.friendList}"/>
			
			<c:if test="${empty friend}">
			<table border="10" width="1003" height="167" background="images/allBack.jpg" bordercolor="#4E6900" style="margin-top:1;margin-bottom:1"><tr><td align="center">☆★☆ 博主目前没有添加任何好友！☆★☆</td></tr></table>
			</c:if>
       		
       		<c:if test="${!empty friend}">       	
		    <table border="10" width="1003" height="167" background="images/allBack.jpg" bordercolor="#4E6900" style="margin-top:1;margin-bottom:1">
		    	<tr height="25"><td colspan="3" style="padding-left:5">我的所有好友</td></tr>
	       		<tr height="25" bgcolor="#F0F0F0">
	       			<td align="center" width="30%">姓名</td>
	       			<td align="center" width="50%">博客</td>
	       			<td align="center" width="20%">访问</td>
	       		</tr>
	       		<c:forEach varStatus="st" var="single" items="${friend}">
	       		<tr align="center" height="30">
	       			<td><c:out value="${single.userName}"/></td>
	       			<td><a href="my/goBlog?master=${single.id}" target="_blank"><c:out value="${single.userBlogName}"/></a></td>
	       			<td style="padding-left:5"><c:out value="${single.userHitNum}"/> 次</td>
	       		</tr>
		       	</c:forEach>
	    	</table>
	       	</c:if>
			<table border="0" width="1003" height="128" cellpadding="0" cellspacing="0"><tr><td background="images/end.jpg"></td></tr></table>
    	</center>
	</body>
</html>