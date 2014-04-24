<%@ page language="java" contentType="text/html; charset=GBK"
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
		<meta http-equiv="Content-Type" content="text/html; charset=GB18030">
		<title>修改教师资料</title>
		<link href="css/style.css" rel="stylesheet">
	</head>
	<body>
		<c:if
			test="${sessionScope.loginUser!=null&&sessionScope.loginUser.username=='mr' }">
			<form name="form1" method="post" action="teacherController.htm">
				<table height="450" border="0" align="center" cellpadding="0"
					cellspacing="0">
					<tr align="center" valign="middle">
						<tr>
		 <td height="44" colspan="6">
			&nbsp;
		 </td>
		</tr>
					
					<tr>
						<td width="79">
							教师姓名
						</td>
						<td width="193">
							<input name="name" type="text" id="name" maxlength="12"
								value="${doc.name }">
						</td>
						<td width="75">
							年龄
						</td>
						<td width="208">
							<input name="age" type="text" id="age" maxlength="2"
								value="${doc.age }">
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

											<input name="sex" type="radio" value="男"
												<c:if test="${doc.sex=='男' }"> checked="yes"</c:if>>
											男
											<input type="radio" name="sex" value="女"
												<c:if test="${doc.sex=='女' }">checked="yes"</c:if>>
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
											<input name="hunfou" type="radio" value="no"
												<c:if test="${doc.hunfou=='no' }"> checked="yes"</c:if>>
											未婚
											<input type="radio" name="hunfou" value="yes"
												<c:if test="${doc.hunfou=='yes' }"> checked="yes"</c:if>>
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
							<input name="zzmm" type="text" id="zzmm" maxlength="20"
								value="${doc.zzmm }">
						</td>
						<td>
							民族
						</td>
						<td>
							<input name="minzu" type="text" id="minzu" maxlength="10"
								value="${doc.minzu }">
						</td>
					</tr>
					<tr>
						<td>
							学历
						</td>
						<td>
							<input name="xueli" type="text" id="xueli" value="${doc.xueli }">
						</td>
						<td>
							出生日期
						</td>
						<td>
							<input name="csrq" type="text" id="csrq" value="${doc.csrq }"
								readonly="yes">
						</td>
					</tr>
					<tr>
						<td>
							身份证号
						</td>
						<td>
							<input name="sfzh" type="text" id="sfzh" maxlength="18"
								value="${doc.sfzh }" readonly="yes">
						</td>
						<td>
							联系电话
						</td>
						<td>
							<input name="lxdh" type="text" id="lxdh" maxlength="15"
								value="${doc.lxdh }">
						</td>
					</tr>
					<tr>
						<td>
							工作日期
						</td>
						<td>
							<input name="gzrq" type="text" id="gzrq" value="${doc.gzrq }">
						</td>
						<td>
							授课专业
						</td>
						<td>
							<select name="skzy">
								<c:forEach var="spinfo" items="${list }">

									<option value="${spinfo.spCode }"
										<c:if test="${spinfo.spCode==doc.systemSpecialtyCode.spCode }"> selected="yes"</c:if>>
										${spinfo.name }
									</option>
								</c:forEach>
							</select>
						</td>
					</tr>
					<tr>
						<td>
							教师编号：
						</td>
						<td>
							<input name="teaId" type="text" id="teaId" maxlength="18"
								value="${doc.teaId }" readonly="yes">
						</td>
						<td>
						</td>
						<td>
						</td>
					</tr>
					<tr>
						<td>
							工作简介
						</td>
						<td colspan="3">
							<textarea name="gzjj" cols="50" rows="5" id="gzjj">${doc.gzjj }</textarea>
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
							<input type="submit" name="Submit" value="修改">
						</td>
						<td>
							<input name="Reset" type="reset" value="重置">
						</td>
					</tr>
				</table>
			</form>
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
