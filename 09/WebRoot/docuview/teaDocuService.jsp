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
		<table width="80%" border="0" cellpadding="0" cellspacing="0"
			class="tableBorder_LTR">
			<tr>								
				 <td height="44" colspan="6">
					&nbsp;
				 </td>		
			</tr>
		</table>
		<table width="80%" border="0" align="center" cellpadding="0"
			cellspacing="0">
			<tr>
				<td width="80%" height="49" align="center">
					<form name="form1" method="post" action="searchTeacherInfo.htm">
						请输入查询条件：
						<select name="condition" id="condition" tabindex="2">
							<option selected="true">
								姓名
							</option>
							<option>
								身份证
							</option>
							<option>
								教师编号
							</option>
						</select>
						<input name="conditionContent" type="text" id="conditionContent">
						<input type="submit" name="Submit" value="提交">
					</form>
				</td>
			</tr>
		</table>
		<table width="90%" border="0" align="center" cellpadding="0"
			cellspacing="0">
			<!--DWLayoutTable-->
			<tr>
				<td width="100%" height="362" valign="top">
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
									姓名
								</div>
							</td>
							<td>
								<div align="center">
									性别
								</div>
							</td>
							<td>
								<div align="center">
									身份证
								</div>
							</td>
							<td>
								<div align="center">
									授课专业
								</div>
							</td>
							<td>
								<div align="center">
									维护
								</div>
							</td>
						</tr>
						<c:forEach var="tea" items="${list}">
							<tr>
								<td>
									<div align="center">
										${tea.teaId }&nbsp;
									</div>
								</td>
								<td>
									<div align="center">
										${tea.name }&nbsp;
									</div>
								</td>
								<td>
									<div align="center">
										${tea.sex }&nbsp;
									</div>
								</td>
								<td>
									<div align="center">
										${tea.sfzh }&nbsp;
									</div>
								</td>
								<td>
									<div align="center">
										${tea.systemSpecialtyCode.name }&nbsp;
									</div>
								</td>
								<td class="button_03">
									<div align="center">
										<a href="serviceTeacherInfo.htm?teaId='${tea.teaId }'"
											target="mainFrame">更改</a>
									</div>
								</td>
							</tr>
						</c:forEach>
					</table>
				</td>
			</tr>
		</table>
	</body>
</html>
