<%@ page language="java" contentType="text/html; charset=GBK"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
	<head>
		<title>查看好友详细资料</title>
		<base href="<%=basePath%>">
		<link type="text/css" rel="stylesheet" href="css/style.css">
	</head>
	<body>
		<center>
			<table border="0" width="1003" height="299" cellpadding="0" cellspacing="0"><tr><td background="images/top.jpg"></td></tr></table>
    		<c:set var="friend" value="${requestScope.friendSingle}"/>

   			<c:if test="${empty friend}">
   			<table border="10" width="1003" height="167" background="images/allBack.jpg" bordercolor="#4E6900" style="margin-top:1;margin-bottom:1"><tr><td align="center">☆★☆ 对不起，查看好友资料失败！☆★☆</td></tr></table>
   			</c:if>

   			<c:if test="${!empty friend}">
    		    		<table border="1" rules="none" width="1003" height="167" background="images/allBack.jpg" bordercolor="#4E6900" bordercolordark="white" bordercolorlight="#4E6900" cellspacing="0" cellpadding="0" style="margin-top:1">
	      		<tr height="50"><td colspan="2">【博主资料】</td></tr>
	       			
	     		<c:if test="${empty friend}">
	     		<tr align="center"><td colspan="2"><li>查看资料失败！</li></td></tr>
	     		</c:if>
	       			
	     		<c:if test="${!empty friend}">
	       		<tr height="20"><td colspan="2">头像：</td></tr>
	       		<tr><td colspan="2"><img src="images/ico/${friend.userIco}" width="237" height="140" style="border:1 solid"></td></tr>
	       		<tr height="40">
	       			<td width="10%" align="right" style="padding-right:20">姓名：</td>
	       			<td><c:out value="${friend.userName}"/></td>
	       		</tr>
	       		<tr height="30">
	       			<td align="right" style="padding-right:20">性别：</td>
	       			<td><c:out value="${friend.userSex}"/></td>
	       		</tr>
	       		<tr height="30">
	       			<td align="right" style="padding-right:20">OICQ：</td>
	       			<td><c:out value="${friend.userOicq}"/></td>
	       		</tr>
	       		<tr height="30">
	       			<td align="right" style="padding-right:20">E-mail：</td>
	       			<td><c:out value="${friend.userEmail}"/></td>
	       		</tr>
	       		<tr height="30">
	       			<td align="right" style="padding-right:20">来自：</td>
	       			<td><c:out value="${friend.userFrom}"/></td>
	       		</tr>
	       		<tr height="30">
	       			<td align="right" style="padding-right:20">博客：</td>
	       			<td><c:out value="${friend.userBlogName}"/></td>
	       		</tr>
	       		<tr height="30">
	       			<td align="right" style="padding-right:20">签名：</td>
	       			<td><c:out value="${friend.userMotto}"/></td>
	       		</tr>
	       		<tr height="30">
	       			<td align="right" style="padding-right:20">创建时间：</td>
	       			<td><c:out value="${friend.userCTTime}"/></td>
	       		</tr>
	       		<tr height="30">
	       			<td align="right" style="padding-right:20">访问次数：</td>
	       			<td><c:out value="${friend.userHitNum}"/> 次</td>
	       		</tr>
	       		</c:if>
		   	</table>
     		</c:if>
			<table border="0" width="1003" height="128" cellpadding="0" cellspacing="0"><tr><td background="images/end.jpg"></td></tr></table>
    	</center>
	</body>
</html>