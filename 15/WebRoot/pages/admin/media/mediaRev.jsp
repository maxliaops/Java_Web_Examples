<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
	<head>
		<title>查看视频所有评论</title>
		<base href="<%=basePath%>">
		<link type="text/css" rel="stylesheet" href="css/style.css">
	</head>
	<body>
    	<center>
			<table border="0" width="1003" height="299" cellpadding="0" cellspacing="0"><tr><td background="images/top.jpg"></td></tr></table>
	   		<c:set var="mediaRev" value="${requestScope.mediaRlist}"/>

			<c:if test="${empty mediaRev}">
			<table border="10" width="1003" height="167" background="images/allBack.jpg" bordercolor="#4E6900" style="margin-top:1;margin-bottom:1"><tr><td align="center">☆★☆ 该视频目前没有任何评论！☆★☆</td></tr></table>
			</c:if>

       		<c:if test="${!empty mediaRev}">       	
		       	<c:set var="cpage" value="${requestScope.createPage}"/>
		       	<table border="0" width="655" style="word-break:break-all">
		       		<tr height="25" bgcolor="#F0F0F0">
		       			<td style="padding-left:5">视频所有评论 【共${cpage.allR}条】</td>
		       			<td align="right"><c:out value="${requestScope.message}" escapeXml="false"/></td>
		       		</tr>
	       			<c:forEach varStatus="st" var="single" items="${mediaRev}">
	       			<tr>
	       				<td>◆ <b>${single.mediaRAuthor}</b></td>
	       				<td align="right" width="20%">${(cpage.currentP-1)*cpage.perR+(st.index+1)} 楼</td>
	       			</tr>
	       			<tr height="25" align="right"><td colspan="2"><font color="gray">${single.mediaRTime}</font></td></tr>
	       			<tr height="60"><td valign="top" colspan="2">${single.mediaRContent}</td></tr>
	       			<tr><td colspan="2" align="right"><a href="my/admin/mediaRev?action=delete&rootId=${param.id}&id=${single.id}">删除评论</a></td></tr>
	       			<tr><td colspan="2"><hr></td></tr>
		       		</c:forEach>
		       		<tr><td colspan="2"><jsp:include page="/pages/page.jsp"/></td></tr>
	    	   	</table>
	       	</c:if>
			<table border="0" width="1003" height="128" cellpadding="0" cellspacing="0"><tr><td background="images/end.jpg"></td></tr></table>
    	</center>
	</body>
</html>