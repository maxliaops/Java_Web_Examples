<%@ page language="java" pageEncoding="GBK"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<html> 
	<head>
		<title>JSP for DynaActionForm form</title>
		<script type="text/javascript">
			function checkInput(){
				if(document.userLoginForm.loginName.value==null||document.userLoginForm.loginName.value==""){
					alert("用户名不能为空"); 
					document.userLoginForm.loginName.focus();
					return false;
				}
				if(document.userLoginForm.pwd.value==null||document.userLoginForm.pwd.value==""){
					alert("用户密码不能为空！");
					document.userLoginForm.pwd.focus();
					return false;
				} 
				if(document.userLoginForm.pwd1.value==null||document.userLoginForm.pwd1.value==""){
					alert("确认密码不能为空！");
					document.userLoginForm.pwd1.focus();
					return false;
				}
				if(document.userLoginForm.pwd.value!=document.userLoginForm.pwd1.value){
					alert("两次输入的密码不一致！");
					document.userLoginForm.pwd.focus();
					return false;
				} 
				if(document.userLoginForm.mail.value==null||document.userLoginForm.mail.value==""){
					alert("电子邮箱不能为空！");
					document.userLoginForm.mail.focus();
					return false;
				}
				return true;
			}
		</script>
	    <link href="images/css.css" rel="stylesheet" type="text/css">
	</head>

	<body>
		<table border="0" align="center" cellpadding="0" cellspacing="0" width="955">
			<tr>
				<td colspan="2" background="images/topNo.jpg" height="243">&nbsp;</td>
			</tr>
			<tr>
				<td height="24" colspan="2">&nbsp;</td>
			</tr>
			<tr>
			<td width="27" valign="middle">&nbsp;<img src="images/jiantou.jpg" width="15" height="17" /></td>
		    <td width="928" valign="middle"><span class="STYLE1">当前位置：</span>新用户注册</td>
			</tr>
			<tr>
				<td height="24" colspan="2">&nbsp;</td>
			</tr>
			<tr>
				<td  colspan="2" height="200">
		<html:form action="/reg.do" onsubmit="return checkInput()" >
			<table width="600" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#c2d3b0">
				<tr>
					<td height="24" colspan="3" align="center" bgcolor="#FFFFFF" class="STYLE1">${error}</td>
				</tr>
				<tr> 
					<td width="110" bgcolor="#FFFFFF" class="td0">用户名：</td>
					<td width="266" bgcolor="#FFFFFF">&nbsp;&nbsp;<html:text property="loginName"/></td>
					<td width="220" bgcolor="#FFFFFF" class="STYLE2">&nbsp;系统登录帐号6-10位英文字符或数字</td>
				</tr>
				<tr>
					<td bgcolor="#FFFFFF" class="td0">密码：</td>
					<td bgcolor="#FFFFFF">&nbsp;&nbsp;<html:password property="pwd"/></td>
					<td bgcolor="#FFFFFF" class="STYLE2">&nbsp;登录密码6-10位英文字符或数字</td>
				</tr>
				<tr>
					<td bgcolor="#FFFFFF" class="td0">确认密码：</td>
					<td bgcolor="#FFFFFF">&nbsp;&nbsp;<html:password property="pwd1"/></td>
					<td bgcolor="#FFFFFF" class="STYLE2">&nbsp;验证登录密码</td>
				</tr>
				<tr>
					<td bgcolor="#FFFFFF" class="td0">电子邮箱：</td>
					<td bgcolor="#FFFFFF">&nbsp;&nbsp;<html:text property="mail"/></td>
					<td bgcolor="#FFFFFF" class="STYLE2">&nbsp;请输入电子邮箱地址</td>
				</tr>
				<tr>
					<td height="24" colspan="3" align="center" bgcolor="#FFFFFF">
						<html:submit value="注册"/>&nbsp;&nbsp;&nbsp;&nbsp;<html:reset value="重置"/>
					</td>
				</tr>
		  </table>  
		</html:form>
				</td> 
			</tr>
			<tr>
				<td colspan="2" background="images/bottomM.gif" height="87">&nbsp;</td>
			</tr>
		</table>
	</body>
</html>