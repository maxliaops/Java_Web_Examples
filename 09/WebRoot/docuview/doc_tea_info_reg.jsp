<%@ page language="java" contentType="text/html; charset=GBK"
	pageEncoding="GBK"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<c:if test="${sessionScope.loginUser==null}">
	<script language="javascript">
		alert("您未登录或连线超时，请登录系统");
		window.location.href="Content.jsp";		
	</script>  
</c:if>
<script type="text/javascript" src="js/checkform.js"></script>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=GB18030">
		<title>Insert title here</title>
		<link href="css/style.css" rel="stylesheet">
	</head>
	<script src="js/function.js">
	</script>
	<body>
		<c:if
			test="${sessionScope.loginUser!=null&&sessionScope.loginUser.username=='mr' }">
			<form name="form1" method="post" action="teacherController.htm" onsubmit="return checkTea(form1)">
				<table height="400" border="0" align="center" cellpadding="0"
					cellspacing="0">
					<tr align="center" valign="middle">
						<td height="51" colspan="6">
							&nbsp;
						</td>
					</tr>
					<tr>
						<td width="79">
							教师姓名
						</td>
						<td width="193">
							<input name="name" type="text" id="name" maxlength="12">
						</td>
						<td width="75">
							年龄
						</td>
						<td width="208">
							<input name="age" type="text" id="age">
						</td>
					</tr>
					<tr>
						<td>
							性别
						</td>
						<td>
							<table width="110">
								<tr>
									<td>
										<label>
											<input name="sex" type="radio" value="男" checked>
											男
											<input type="radio" name="sex" value="女">
											女
										</label>
									</td>
								</tr>
							</table>
						</td>
						<td>
							婚否
						</td>
						<td>
							<table width="168">
								<tr>
									<td width="160">
										<label>
											<input name="hunfou" type="radio" value="no" checked>
											未婚
											<input type="radio" name="hunfou" value="yes">
											已婚
										</label>
									</td>
								</tr>
							</table>
						</td>
					</tr>
					<tr>
						<td>
							政治面貌
						</td>
						<td>
							<input name="zzmm" type="text" id="zzmm" maxlength="20">
						</td>
						<td>
							民族
						</td>
						<td>
							<input name="minzu" type="text" id="minzu" maxlength="10">
						</td>
					</tr>
					<tr>
						<td>
							学历
						</td>
						<td>
							<input name="xueli" type="text" id="xueli">
						</td>
						<td>
							出生日期
						</td>
						<td>
							<input name="csrq" type="text" id="csrq">
						</td>
					</tr>
					<tr>
						<td>
							身份证号
						</td>
						<td>
							<input name="sfzh" type="text" id="sfzh" maxlength="18">
						</td>
						<td>
							联系电话
						</td>
						<td>
							<input name="lxdh" type="text" id="lxdh" maxlength="15">
						</td>
					</tr>
					<tr>
						<td>
							工作日期
						</td>
						<td>
							<input name="gzrq" type="text" id="gzrq">
						</td>
						<td>
							授课专业
						</td>
						<td>
							<select name="skzy">
								<c:forEach var="spinfo" items="${list }">
									<option value="${spinfo.spCode }">
										${spinfo.name }
									</option>
								</c:forEach>
							</select>
						</td>
					</tr>
					<tr>
						<td>
							工作简介
						</td>
						<td colspan="3">
							<textarea name="gzjj" cols="50" rows="5" id="gzjj"> </textarea>
						</td>
					</tr>
					<tr>
						<td>
							&nbsp;
						</td>
						<td>
							&nbsp;
						</td>
						<td>
							<input type="submit" name="Submit" value="提交">
						</td>
						<td>
							<input name="Reset" type="reset" value="重置">
						</td>
					</tr>
				</table>
			</form>
			<c:if test="${info!=null }">
				<CENTER>
					教师：“${info.name }”&nbsp;添加成功。
					教师编号为：${info.teaId }
				</CENTER>
			</c:if>
			<c:if test="${alert!=null }">
				<h3 align="center">
					警告：${alert }
				</h3>
			</c:if>
		</c:if>
		<c:if
			test="${sessionScope.loginUser==null||sessionScope.loginUser.username!='mr' }">
			<p>
				&nbsp;
			</p>
			<p>
				&nbsp;
			</p>
			<p>
				&nbsp;
			</p>
			<p>
				&nbsp;
			</p>
			<p align="center">
				您未登录或权限不够，请重新登录系统。
			</p>
		</c:if>
	</body>
</html>
