<%@ page language="java" import="java.util.*" pageEncoding="GB2312"%>
<jsp:directive.page import="java.sql.Date" />
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
		<title>任命班主任</title>
		<link href="css/style.css" rel="stylesheet">
	<script src="js/checkform.js"></script>
	</head>
	<body>
	<tr>
			 <td height="44" colspan="6">
				&nbsp;
			 </td>
		   </tr>
		<form name="form1" method="post" action="chargeEmployeeLoader.htm" onsubmit="return checkCharge(form1)">
			<table width="80%" height="98" border="0" align="center">
				
				<tr>
					<td height="48">
						&nbsp;
					</td>
					<td colspan="2">
						<div align="right">
							请输入教师编号：
						</div>
					</td>
					<td>
						<div align="left">
							<input type="text" name="teaId" value="${teaInfo.teaId }"
								onchange="window.location.href='chargeEmployeeLoader.htm?changeTeaId='+teaId.value+'&changeClassId='+classid.value">
						</div>
					</td>
					<td>
						&nbsp;
					</td>
				</tr>
			</table>
			<br>
			<table width="80%" height="69" border="1" align="center"
				cellpadding="0" cellspacing="0">
				<tr>
					<td>
						<div align="center">
							教师姓名
						</div>
					</td>
					<td>
						<div align="center">
							性别
						</div>
					</td>
					<td>
						<div align="center">
							年龄
						</div>
					</td>
					<td>
						<div align="center">
							学历
						</div>
					</td>
					<td>
						<div align="center">
							授课专业
						</div>
					</td>
					<td>
						<div align="center">
							婚否
						</div>
					</td>
				</tr>
				<tr>
					<td>
						<div align="center">
							${teaInfo.name }&nbsp;
						</div>
					</td>
					<td>
						<div align="center">
							${teaInfo.sex }&nbsp;
						</div>
					</td>
					<td>
						<div align="center">
							${teaInfo.age }&nbsp;
						</div>
					</td>
					<td>
						<div align="center">
							${teaInfo.xueli }&nbsp;
						</div>
					</td>
					<td>
						<div align="center">
							${teaInfo.systemSpecialtyCode.name }&nbsp;
						</div>
					</td>
					<td>
						<div align="center">
							${teaInfo.hunfou }&nbsp;
						</div>
					</td>
				</tr>
			</table>
			
			<table width="68%" height="125" border="0" align="center">
				<tr>
					<td width="15%">
						&nbsp;
					</td>
				</tr>
				<tr>
					<td>
						<div align="left">
							班级名称
						</div>
					</td>
					<td width="36%">
						<select name="classid"
							onchange="window.location.href='chargeEmployeeLoader.htm?changeTeaId='+teaId.value+'&changeClassId='+classid.value">
							<c:forEach var="list" items="${classInfo}">
								<option value="${list.classid }"
									<c:if test="${list.classid==rowInfo.classid}"> selected="yes"</c:if>>
									${list.classmc }
								</option>
							</c:forEach>
						</select>
					</td>
					<td width="11%">
						<div align="left">
							专业
						</div>
					</td>
					<td width="38%">
						<input type="text" name="name" readonly="yes"
							value="${rowInfo.systemSpecialtyCode.name }">
					</td>
				</tr>
				<tr>
					<td>
						<div align="left">
							年级
						</div>
					</td>
					<td>
						<input type="text" name="grade" readonly="yes"
							value="${rowInfo.systemGradeCode.grName }">
					</td>
					<td>
						<div align="left">
							任职日期
						</div>
					</td>
					<td>
						<input type="text" name="rzrq">
					</td>
				</tr>
				<tr>
					<td colspan="4">
						<div align="center">
							<input type="submit" name="Submit" value="提交">
							&nbsp;&nbsp;&nbsp;
							<input type="reset" name="Submit2" value="重置">
						</div>
					</td>
				</tr>
			</table>
			<center>
				<br>
				<c:if test="${message==null }">
					单击“提交”按钮，将教师任职为班主任。
				</c:if>
				<c:if test="${message!=null }">
					${message }
				</c:if>
			</center>
		</form>
	</body>
</html>
