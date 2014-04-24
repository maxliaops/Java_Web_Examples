<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<s:set var="context_path"
	value="#request.get('javax.servlet.forward.context_path')"></s:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>管理员登录</title>
<link href="${context_path}/css/style_ht.css" rel="stylesheet"
	type="text/css" />
<script type="text/javascript">
	if (self != top) {
		alert("对不起，您还没有登录！");
		top.location = self.location;
	}
</script>
</head>
<body>
<s:form action="user_logon" namespace="/admin/user" method="post">
	<div id="boxdl">
	<table width="229" height="94" border="0">
		<tr>
			<td colspan="2"><s:fielderror></s:fielderror></td>
		</tr>
		<tr>
			<td width="66" height="33">管理员：</td>
			<td width="153"><s:textfield name="username"></s:textfield></td>
		</tr>
		<tr>
			<td height="33">密 码：</td>
			<td><s:password name="password"></s:password></td>
		</tr>
		<tr>
			<td height="26" colspan="2" align="center"><s:submit
				type="image" src="%{context_path}/css/images/an_06.gif"></s:submit></td>
		</tr>
	</table>
	</div>
</s:form>
</body>
</html>