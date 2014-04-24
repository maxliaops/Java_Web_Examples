<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户注册</title>
</head>
<body>
<%@ include file="/WEB-INF/pages/common/head.jsp"%>
<div id="box">
<div id="mid">
    <div id="zhuce">
	<s:form action="customer_save" name="/user" method="post">
	<table width="80%" border="0" cellpadding="0" cellspacing="0">
		<tr>
			<td colspan="2">
			<s:fielderror></s:fielderror>
			</td>
		</tr>
		<tr>
			<td width="70" height="35" align="right">用 户 名：</td>
			<td>
				<s:textfield name="username" cssClass="bian"></s:textfield>*
			</td>
		</tr>
		<tr>
			<td width="70" height="35" align="right">密　码：</td>
			<td>
				<s:password name="password" cssClass="bian"></s:password>*
			</td>
		</tr>
		<tr>
			<td width="70" height="35" align="right">确认密码：</td>
			<td>
				<s:password name="repassword" cssClass="bian"></s:password>*
			</td>
		</tr>
		<tr>
			<td width="70" height="35" align="right">邮箱地址：</td>
			<td>
				<s:textfield name="email" cssClass="bian"></s:textfield>*
			</td>
		</tr>
		<tr>
			<td width="70" height="35" align="right">住　址：</td>
			<td>
				<s:textfield name="address" cssClass="bian"></s:textfield>
			</td>
		</tr>
		<tr>
			<td width="70" height="35" align="right">手　机：</td>
			<td>
				<s:textfield name="mobile" cssClass="bian"></s:textfield>
			</td>
		</tr>
		<tr>
			<td colspan="2" height="80" valign="middle" align="center">
			<s:submit value="登　录" type="image" src="%{context_path}/css/images/dl_08.gif"></s:submit>
			</td>
		</tr>
	</table>
	</s:form>
</div>
  </div>
  <div id="foot"></div>
</div>
</body>
</html>