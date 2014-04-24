<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
	<head>
		<title>查看文章所有评论</title>
		<base href="<%=basePath%>">
		<link type="text/css" rel="stylesheet" href="css/style.css">
	</head>
	<body>
    	<center>
			<table border="0" width="1003" height="299" cellpadding="0" cellspacing="0"><tr><td background="images/top.jpg"></td></tr></table>
	   		<c:set var="artReview" value="${requestScope.artrlist}"/>
			
			<c:if test="${empty artReview}">
			<table border="10" width="1003" height="167" background="images/allBack.jpg" bordercolor="#4E6900" style="margin-top:1;margin-bottom:1"><tr><td align="center">☆★☆ 该文章目前没有任何评论！☆★☆</td></tr></table>
			</c:if>
       		
       		<c:if test="${!empty artReview}">       	
			<c:set var="cpage" value="${requestScope.createPage}"/>
		    <table border="1" width="1003" rules="none" cellpadding="0" cellspacing="0" bordercolor="#4E6900" bordercolordark="white" bordercolorlight="#4E6900" background="images/allBack.jpg" style="word-break:break-all">
		    	<tr height="112"><td background="images/back.jpg" style="padding-left:5" colspan="2">文章所有评论【共${cpage.allR}条】</td>	</tr>
	       		<c:forEach varStatus="st" var="single" items="${artReview}">
	       		<tr>
	       			<td style="padding-left:8">☆ <u>${single.artRAuthor}</u></td>
	       			<td align="right" width="10%" style="padding-right:8">${(cpage.currentP-1)*cpage.perR+(st.index+1)} 楼</td>
	       		</tr>
	       		<tr height="25" align="right"><td colspan="2" style="padding-right:8"><font color="gray">${single.artRTime}</font></td></tr>
	       		<tr height="60"><td valign="top" colspan="2" style="padding-left:8">${single.artRContent}</td></tr>
	       		<tr><td colspan="2"><hr></td></tr>
		       	</c:forEach>
		       	<tr><td colspan="2"><jsp:include page="/pages/page.jsp"/></td></tr>
	    	</table>
	       	</c:if>
			<table border="0" width="1003" height="128" cellpadding="0" cellspacing="0"><tr><td background="images/end.jpg"></td></tr></table>
    	</center>
	</body>
</html>