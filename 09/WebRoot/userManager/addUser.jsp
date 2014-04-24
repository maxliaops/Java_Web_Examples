<%@ page language="java" pageEncoding="GB2312"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<c:if test="${sessionScope.loginUser==null}">
	<script language="javascript">
		alert("您未登录或连线超时，请登录系统");
		window.location.href="Content.jsp";		
	</script>  
</c:if>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
		<title>添加用户</title>
		<link href="css/style.css" rel="stylesheet">
	</head>
	<body>

		<table width="746" border="0" cellpadding="0" cellspacing="0">
			<!--DWLayoutDefaultTable-->
			<tr>
				<td width="31" height="97">
					&nbsp;
				</td>
				<td width="698">
					&nbsp;
				</td>
				<td width="17">
					&nbsp;
				</td>
			</tr>
			<tr>
				<td height="190">
					&nbsp;
				</td>
				<td valign="top">
					<div align="center">
						<p>
							
							<span class="word_grey"></span>
						</p>
						<form name="form1" method="post" action="addUserController.htm">
							<p>
								登录名称：
								<input type="text" name="username">
							</p>
							<p>
								登录密码：
								<input type="password" name="password">
							</p>
							<p>
								用户昵称：
								<input type="text" name="name">
							</p>
							<p>
								<input type="submit" name="Submit" value="提交">
								&nbsp;&nbsp;&nbsp;
								<input type="reset" name="Submit2" value="重置">
							</p>
						</form>
						${message }
					</div>
				</td>
			</tr>
		</table>
	</body>
</html>
