<%@ page contentType="text/html; charset=gb2312" language="java"
	pageEncoding="GBK"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<c:if test="${sessionScope.loginUser==null}">
	<script language="javascript">
		alert("您未登录或连线超时，请登录系统");
		window.location.href="Content.jsp";		
	</script>  
</c:if>
<html>
	<head>
		<title>网上图书超市</title>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
		<link href="css/style.css" rel="stylesheet">
	</head>
	<body>
		<c:if test="${sessionScope.loginUser!=null&&sessionScope.loginUser.username=='mr' }">
			<table width="100%" border="0" cellpadding="0" cellspacing="0"
				class="tableBorder_LTR">
				<tr>
					<td height="40" align="center">
						<div align="center">
							<p>
								
								<span class="word_grey"></span>
							</p>
						</div>
					</td>
				</tr>
			</table>
			<table width="95%" height="72" border="0" align="center"
				cellpadding="0" cellspacing="0">
				<tr>
					<td align="center">
						${message }&nbsp;
					</td>
				</tr>
				<tr>
					<td width="100%" height="72" align="center">
						<form name="form1" method="post" action="searchUserController.htm">
							请输入查询条件：
							<select name="condition" id="condition" tabindex="2">
								<option value="username"
									<c:if test="${condition=='username' }"> selected="yes"</c:if>>
									登录用户名
								</option>
								<option value="name"
									<c:if test="${condition=='name' }"> selected="yes"</c:if>>
									用户昵称
								</option>
							</select>
							<input name="conditionContent" type="text"
								value="${conditionContent }">
							<input type="submit" name="Submit" value="提交">
						</form>
					</td>
				</tr>
			</table>
			<table width="100%" border="0" align="center" cellpadding="0"
				cellspacing="0">
				<tr>
					<td width="100%" height="84" valign="top">
						<table width="80%" border="1" align="center" cellpadding="0"
							cellspacing="0">
							<tr>
								<td>
									<div align="center">
										登录用户名
									</div>
								</td>
								<td>
									<div align="center">
										用户昵称
									</div>
								</td>
								<td>
									<div align="center">
										维护
									</div>
								</td>
							</tr>
							<c:forEach var="user" items="${list}">
								<tr>
									<td>
										<div align="center">
											${user.username }&nbsp;
										</div>
									</td>
									<td>
										<div align="center">
											${user.name }&nbsp;
										</div>
									</td>
									<td class="button_03" align="middle">
										<div align="center">
											<a href="searchUserController.htm?id=${user.id }"
												target="mainFrame">删除</a>
										</div>
									</td>
								</tr>
							</c:forEach>
						</table>
					</td>
				</tr>
			</table>
		</c:if>
		<c:if test="${sessionScope.loginUser==null||sessionScope.loginUser.username!='mr' }">
			<p>&nbsp;</p>
			<p>&nbsp;</p>
			<p>&nbsp;</p>
			<p>&nbsp;</p>
			<p align="center">
				您未登录或权限不够，请登录系统。
			</p>
		</c:if>
	</body>
</html>
