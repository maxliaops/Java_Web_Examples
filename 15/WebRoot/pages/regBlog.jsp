<%@ page language="java" contentType="text/html; charset=GBK"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
	<head>
		<title>注册博客</title>
		<base href="<%=basePath%>">
		<link type="text/css" rel="stylesheet" href="css/style.css">
	</head>
	<body>
		<center>
			<table border="0" width="1003" height="299" cellpadding="0" cellspacing="0"><tr><td background="images/top.jpg"></td></tr></table>
    		<table border="1" width="1003" height="167" background="images/allBack.jpg" bordercolor="#4E6900" bordercolordark="white" bordercolorlight="#4E6900" cellspacing="0" cellpadding="0" style="margin-top:1" rules="none">
       			<tr height="25" style="text-indent:20"><td colspan="2">【填写资料】</td></tr>
       			<tr>
       				<td width="30%" valign="top" style="padding-top:10;padding-left:20"><c:out value="${requestScope.message}" escapeXml="false"/></td>
       				<td>
       					<form action="userReg?action=upIco" method="post" enctype="multipart/form-data">
							<table border="0" width="650">
								<tr>	
	       							<td align="right" style="padding-right:20">头像：</td>
       								<td><input type="file" name="userIco" size="50" value="${param.userIco}">【建议尺寸：237*140】</td>
       							</tr>
       							<tr height="30">
       								<td></td>
       								<td><input type="submit" value="上传头像"></td>
       							</tr>
       							<tr><td colspan="2"><hr size="3"></td></tr>
       						</table>
       					</form>
    					<form action="pages/getRegForm.jsp" method="post">
       						<input type="hidden" name="action" value="userReg">
       						<table border="0" width="650">
       							<tr>
       								<td width="20%" align="right" style="padding-right:20">姓名：</td>
       								<td><input type="text" name="userName" size="40" value="${param.userName}"></td>
       							</tr>
	       						<tr height="40">
    	   							<td align="right" style="padding-right:20">密码：</td>
       								<td><input type="password" name="userPswd" size="30"></td>
       							</tr>
       							<tr height="40">
       								<td align="right" style="padding-right:20">确认密码：</td>
       								<td><input type="password" name="aginPswd" size="30"></td>
       							</tr>
	       						<tr height="40">
    	   							<td align="right" style="padding-right:20">性别：</td>
       								<td>
       									<input type="radio" name="userSex" value="男" checked>男
       									<input type="radio" name="userSex" value="女">女
       								</td>
       							</tr>
       							<tr height="40">
	       							<td align="right" style="padding-right:20">OICQ：</td>
    	   							<td><input type="text" name="userOicq" size="20" value="${param.userOicq}"></td>
       							</tr>
       							<tr height="40">
       								<td align="right" style="padding-right:20">E-mail：</td>
       								<td><input type="text" name="userEmail" size="35" value="${param.userEmail}"></td>
       							</tr>
       							<tr height="40">
	       							<td align="right" style="padding-right:20">博客名称：</td>
    	   							<td><input type="text" name="userBlogName" size="35" value="${param.userBlogName}"></td>
       							</tr>
       							<tr height="40">
       								<td align="right" style="padding-right:20">个性签名：</td>
       								<td><input type="text" name="userMotto" size="35" value="${param.userMotto}"></td>
       							</tr>
      							<tr height="40">
	       							<td align="right" style="padding-right:20">来自：</td>
    	   							<td><input type="text" name="userFrom" size="50" value="${param.userFrom}"></td>
       							</tr>
       							<tr height="50" align="center">
       								<td colspan="2">
       									<input type="submit" value="注册博客">
       									<input type="reset" value="重新填写">
       								</td>
	       						</tr>
    	   					</table>
					    </form>
       				</td>
       			</tr>
			</table>
			<table border="0" width="1003" height="128" cellpadding="0" cellspacing="0"><tr><td background="images/end.jpg"></td></tr></table>
    	</center>
	</body>
</html>