<%@ page language="java" pageEncoding="GBK"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%> 
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
 
<html> 
	<head>
	    <link href="images/css.css" rel="stylesheet" type="text/css">
	</head>
	<body>
	  	<table width="955px" align="center" cellspacing="0">
		<tr>
			<td colspan="4" height="20">&nbsp;</td>
		</tr>
		<tr>
			<td width="34" height="30" valign="middle">&nbsp;
				<span class="STYLE1"><img src="images/jiantou.jpg" width="15" height="17" /></span></td>
		    <td colspan="3" valign="middle"><span class="STYLE1">当前位置：</span>修改密码</td>
		</tr>
		<tr>
			<td colspan="4" height="20">&nbsp;</td>
		</tr>
		<tr>
			<td>&nbsp;</td>
		    <td width="80">&nbsp;</td>
		    <td width="500">
				<html:form action="/updatePwd.do?type=m">
			<table cellspacing="1" bgcolor="#c2d3b0">
				<tr>
					<td height="24" colspan="3" align="center" bgcolor="#FFFFFF" class="STYLE1">${error}</td>
				</tr>
				<tr>
					<td width="65" height="30" bgcolor="#f8fcf3" class="td0">登录帐号：</td>
				  <td width="185" bgcolor="#FFFFFF">&nbsp;<html:text property="loginName" value="${loginName}" readonly="true"/></td>
					<td width="200" bgcolor="#FFFFFF" class="STYLE2">&nbsp;当前帐号，不可以修改</td>
				</tr>
				<tr>
					<td height="30" bgcolor="#f8fcf3" class="td0">旧密码：</td>
					<td bgcolor="#FFFFFF">&nbsp;<html:password property="pwd"/></td>
					<td bgcolor="#FFFFFF" class="STYLE2">&nbsp;输入原始密码</td>
				</tr>
				<tr>
					<td height="30" bgcolor="#f8fcf3" class="td0">新密码：</td>
					<td bgcolor="#FFFFFF">&nbsp;<html:password property="pwd1"/></td>
					<td bgcolor="#FFFFFF" class="STYLE2">&nbsp;输入新密码</td>
				</tr>
				<tr>
					<td height="30" bgcolor="#f8fcf3" class="td0">确认密码：</td>
					<td bgcolor="#FFFFFF">&nbsp;<input type="password" name="pwd2"/></td>
					<td bgcolor="#FFFFFF" class="STYLE2">&nbsp;确认新密码</td>
				</tr> 
				<tr>
					<td height="30" bgcolor="#f8fcf3" class="td0">验证邮箱：</td>
					<td bgcolor="#FFFFFF">&nbsp;<html:text property="mail"/></td>
					<td bgcolor="#FFFFFF" class="STYLE2">&nbsp;注册时所添邮箱</td>
				</tr>
				<tr>
					<td height="30" colspan="3" align="center" bgcolor="#FFFFFF">
						<html:submit value="修改"/>&nbsp;&nbsp;&nbsp;&nbsp;<html:reset value="重置"/>
				  </td>
				</tr>
			</table>
	</html:form>
		  </td>
		    <td width="331">&nbsp;</td>
		</tr>
	</table>
	</body>
</html>

