<%@ page language="java" contentType="text/html; charset=gb2312"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
	<head>
		<title>博主登录</title>
		<base href="<%=basePath%>">
		<link type="text/css" rel="stylesheet" href="css/style.css">
	</head>
	<body">
		<form action="my/logon" method="post">
		<input type="hidden" name="goWhere" value="${param['goWhere']}">
		<table width="1007" height="622" border="0" align="center" background="images/logonBack.jpg">
  <tr>
    <td>
    <table border="0" width="400" height="160" cellspacing="0" cellpadding="0" style="margin-top:200;margin-left:300" >
			<tr height="50"><td colspan="2"><c:out value="${requestScope.message}" escapeXml="false"/></td></tr>
			<tr>
				<td width="30%" align="right"><font color="white"><b>用户名：</b></font></td>
				<td align="center"><input type="text" name="userName" size="30"></td>
			</tr>
			<tr>
				<td align="right"><font color="white"><b>密&nbsp;&nbsp;码：</b></font></td>
				<td align="center"><input type="password" name="userPswd" size="30"></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="" style="background:url(images/logonB.jpg);border:0;width:51;height:20">
					<input type="reset" value="" style="background:url(images/resetB.jpg);border:0;width:51;height:20">
				</td>
			</tr>
    	</table>
    	<tr>
    <td height="70"></td>
  </tr>
    </td>
  </tr>
</table>
    	
    	</form>
	</body>
</html>