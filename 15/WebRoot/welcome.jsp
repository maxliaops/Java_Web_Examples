<%@ page contentType="text/html;charset=gb2312"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
	<head>
		<title>浏览所有博客</title>
		<base href="<%=basePath%>">
		<link type="text/css" rel="stylesheet" href="css/style.css">
	</head>
	<body>
		<center>
			<table border="0" width="1003" height="299" cellpadding="0" cellspacing="0"><tr><td background="images/top.jpg"></td></tr></table>
			<c:set var="user" value="${requestScope.masterlist}"/>
			
			<c:if test="${empty user}">
			<table border="10" width="1003" height="167" background="images/allBack.jpg" bordercolor="#4E6900" style="margin-top:1;margin-bottom:1"><tr><td align="center">☆★☆ 对不起！该服务器中不存在任何博客！☆★☆</td></tr></table>
			</c:if>	
			
			<c:if test="${!empty user}">
				<table border="1" width="1003" rules="none" cellpadding="0" cellspacing="0" bordercolor="#4E6900" bordercolordark="white" bordercolorlight="#4E6900" background="images/allBack.jpg">
					<tr height="112">
						<td background="images/back.jpg" colspan="3" align="right" style="padding-right:6">
							<a href="my/logon?goWhere=indexTemp"><img src="images/myBlog.jpg"></a>
							<a href="pages/regBlog.jsp" target="_blank"><img src="images/regBlog.jpg"></a>
						</td>
					</tr>					
					<tr height="24"><td colspan="3" style="text-indent:20">其他博客</td></tr>
					<tr><td colspan="3"><hr></td></tr>
					<tr height="40">
						<td width="40%" align="center" style="text-indent:5"><font color="#FF3C83"><b>博客名称</b></font></td>
						<td width="40%" align="center"><font color="#FF3C83"><b>博主</b></font></td>
						<td width="20%" align="center"><font color="#FF3C83"><b>创建时间</b></font></td>
					</tr>
					<c:forEach var="single" items="${user}">
						<tr height="35">
							<td align="center" style="text-indent:5"><a href="my/goBlog?master=${single.id}">${single.userBlogName}</a></td>
							<td align="center">${single.userName}</td>
							<td align="center">${single.userCTTime}</td>
						</tr>
					</c:forEach>
				</table>			
			</c:if>
			<table border="0" width="1003" height="128" cellpadding="0" cellspacing="0"><tr><td background="images/end.jpg"></td></tr></table>					
		</center>
	</body>
</html>