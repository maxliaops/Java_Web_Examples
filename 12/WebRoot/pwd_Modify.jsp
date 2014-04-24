<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="com.actionForm.ManagerForm" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<%
ManagerForm managerForm=(ManagerForm)request.getAttribute("pwdQueryif");
%>
<head>
<title>图书馆管理系统</title>
<link href="CSS/style.css" rel="stylesheet">
</head>
<script language="javascript">
function checkForm(form){
	if(form.oldpwd.value==""){
		alert("请输入的原密码!");form.oldpwd.focus();return false;
	}
	if(form.oldpwd.value!=form.holdpwd.value){
		alert("您输入的原密码不正确，请重新输入!");form.oldpwd.value="";
		form.oldpwd.focus();return false;
	}
	if(form.pwd.value==""){
		alert("请输入的新密码!");form.pwd.focus();return false;
	}	
	if(form.pwd1.value==""){
		alert("请确认新密码!");form.pwd1.focus();return false;
	}	
	if(form.pwd.value!=form.pwd1.value){
		alert("您两次输入的新密码不一致，请重新输入!");
		form.pwd.value="";form.pwd1.value="";
		form.pwd.focus();return false;
	}
}
</script>
<body onLoad="clockon(bgclock)">
<%@include file="banner.jsp"%>
<%@include file="navigation.jsp"%>
<table width="778"  border="0" cellspacing="0" cellpadding="0" align="center">
  <tr>
    <td valign="top" bgcolor="#FFFFFF"><table width="99%" height="510"  border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" class="tableBorder_gray">
  <tr>
    <td height="510" valign="top" style="padding:5px;"><table width="98%" height="487"  border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td height="22" valign="top" class="word_orange">当前位置：更改口令 &gt;&gt;&gt;</td>
      </tr>
      <tr>
        <td align="center" valign="top">
 <table width="100%"  border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="84%">&nbsp;      </td>
</tr>
</table>  <form name="form1" method="post" action="manager?action=modifypwd">
  <table width="47%"  border="0" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF" bordercolordark="#D2E3E6" bordercolorlight="#FFFFFF">
  <tr align="center">
    <td width="27%" align="left" style="padding:5px;">管理员名称：</td>
    <td width="73%" align="left">
      <input name="name" type="text" id="name" value="<%=managerForm.getName()%>" readonly="yes" size="30">    </td>
    <tr>
    <td align="left" style="padding:5px;">原密码：</td>
    <td align="left"><input name="oldpwd" type="password" id="oldpwd" size="30">
      <input name="holdpwd" type="hidden" id="holdpwd" value="<%=managerForm.getPwd()%>"></td>
    </tr>
    <tr>
      <td align="left" style="padding:5px;">新密码：</td>
      <td align="left"><input name="pwd" type="password" id="pwd" size="30"></td>
    </tr>
    <tr>
      <td align="left" style="padding:5px;">确认新密码：</td>
      <td align="left"><input name="pwd1" type="password" id="pwd1" size="30"></td>
    </tr>
    <tr>
      <td height="65" align="left" style="padding:5px;">&nbsp;</td>
      <td><input name="Submit" type="submit" class="btn_grey" value="保存" onClick="return checkForm(form1)">
        &nbsp;
        <input name="Submit2" type="reset" class="btn_grey" value="取消"></td>
    </tr>
</table>
</form></td>
      </tr>
    </table>
</td>
  </tr>
</table><%@ include file="copyright.jsp"%></td>
  </tr>
</table>
</body>
</html>
