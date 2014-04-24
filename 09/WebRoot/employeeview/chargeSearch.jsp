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
		<table width="90%" border="0" cellpadding="0" cellspacing="0">
			<tr>
				<td height="40" align="center">
					<div align="center">
						<p>
							
						</p>
					</div>
				</td>
			</tr>
		</table>
		<table width="90%" border="0" align="center" cellpadding="0"
			cellspacing="0">
			<tr>
				<td width="100%" height="49" align="center">
					<form name="form1" method="post"
						action="searchChargeEmployeeLoader.htm">
						请输入查询条件：
						<select name="condition" id="condition" tabindex="2">
							<option value="systemClassInfo.systemSpecialtyCode.name"
								<c:if test="${condition=='systemClassInfo.systemSpecialtyCode.name' }"> selected="yes"</c:if>>
								专业
							</option>
							<option value="systemClassInfo.systemGradeCode.grName"
								<c:if test="${condition=='systemClassInfo.systemGradeCode.grName' }"> selected="yes"</c:if>>
								年级
							</option>
						</select>
						<input name="conditionContent" type="text" id="conditionContent"
							value="${conditionContent }">
						<input type="submit" name="Submit" value="提交">
						<input type="checkbox" name="history" value="yes"
							<c:if test="${history!=null }"> checked="yes"</c:if>>
						查询历史记录
					</form>
				</td>
			</tr>
		</table>
		
		<table width="90%" border="0" align="center" cellpadding="0"
			cellspacing="0">
			<!--DWLayoutTable-->
			<tr>
				<td width="100%" valign="top">
					<table width="100%" border="1" align="center" cellpadding="0"
						cellspacing="0">
						<!--DWLayoutTable-->
						<tr>
							<td>
								<div align="center">
									教师编号
								</div>
							</td>
							<td>
								<div align="center">
									教师姓名
								</div>
							</td>
							<td>
								<div align="center">
									教师性别
								</div>
							</td>
							<td>
								<div align="center">
									班级名称
								</div>
							</td>
							<td>
								<div align="center">
									年级
								</div>
							</td>
							<td>
								<div align="center">
									班级专业
								</div>
							</td>
							<td>
								<div align="center">
									任职日期
								</div>
							</td>
							<c:if test="${history==null }">
								<td>
									<div align="center">
										维护
									</div>
								</td>
							</c:if>
							<c:if test="${history!=null }">
								<td>
									<div align="center">
										离职日期
									</div>
								</td>
							</c:if>
						</tr>
						<c:forEach var="list" items="${list}">
							<tr>
								<td>
									<div align="center">
										${list.docuTeaInfo.teaId }
									</div>
								</td>
								<td>
									<div align="center">
										${list.docuTeaInfo.name }
									</div>
								</td>
								<td>
									<div align="center">
										${list.docuTeaInfo.sex }
									</div>
								</td>
								<td>
									<div align="center">
										${list.systemClassInfo.classmc }
									</div>
								</td>
								<td>
									<div align="center">
										${list.systemClassInfo.systemGradeCode.grName }
									</div>
								</td>
								<td>
									<div align="center">
										${list.systemClassInfo.systemSpecialtyCode.name }
									</div>
								</td>
								<td>
									<div align="center">
										${list.rzrq }
									</div>
								</td>
								<c:if test="${history==null }">
									<td class="button_03" align="middle">
										<div align="center">
											<a href="searchChargeEmployeeLoader.htm?lsh=${list.lsh }">离职</a>
										</div>
									</td>
								</c:if>
								<c:if test="${history!=null }">
									<td>
										<div align="center">
											${list.lizhiDate }
										</div>
									</td>
								</c:if>
							</tr>
						</c:forEach>
					</table>
				</td>
			</tr>
		</table>
	</body>
</html>
