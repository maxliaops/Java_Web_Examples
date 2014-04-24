<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
	<head>
		<title>查看所有留言</title>
		<base href="<%=basePath%>">
		<link type="text/css" rel="stylesheet" href="css/style.css">
	</head>
	<body>
    	<center>
			<table border="0" width="1003" height="299" cellpadding="0" cellspacing="0"><tr><td background="images/top.jpg"></td></tr></table>
	   		<c:set var="word" value="${requestScope.wordList}"/>
			
			<c:if test="${empty word}">
			<table border="10" width="1003" height="167" background="images/allBack.jpg" bordercolor="#4E6900" style="margin-top:1;margin-bottom:1"><tr><td align="center">☆★☆ 目前没有任何留言！☆★☆</td></tr></table>
			</c:if>
       		
       		<c:if test="${!empty word}">  
       			<c:set var="cpage" value="${requestScope.createPage}"/>     	
		       	<table border="1" width="1003" rules="none" cellpadding="0" cellspacing="0" bordercolor="#4E6900" bordercolordark="white" bordercolorlight="#4E6900" background="images/allBack.jpg" style="word-break:break-all">
		       		<tr height="112"><td background="images/back.jpg" style="padding-left:5">查看所有留言【共${cpage.allR}条】</td></tr>
	       			<c:forEach varStatus="st" var="single" items="${word}">
	       			<tr><td style="padding-left:8">☆ <u>${single.wordAuthor}</u></td></tr>
	       			<tr height="25" align="right" style="padding-right:8"><td><font color="gray">${single.wordTime}</font></td></tr>
	       			<tr height="60"><td valign="top" style="padding-left:8" style="padding-right:8"><c:out value="${single.wordContent}" escapeXml="false"/></td></tr>
	       			<tr><td><hr></td></tr>
		       		</c:forEach>
		       		<tr><td><jsp:include page="/pages/page.jsp"/></td></tr>
	    	   	</table>
	       	</c:if>
			<table border="0" width="1003" height="128" cellpadding="0" cellspacing="0"><tr><td background="images/end.jpg"></td></tr></table>
    	</center>
	</body>
</html>