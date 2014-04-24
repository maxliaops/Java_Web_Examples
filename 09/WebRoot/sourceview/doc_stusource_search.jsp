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
				<td height="40" align="center">
					&nbsp;
				</td>
			</tr>
		</table>
		<table width="95%" border="0" align="center" cellpadding="0"
			cellspacing="0">
			<tr>
				<td width="80%" height="49" align="center">
					<form name="form1" method="post" action="searchCjInfo.htm">
						请输入查询条件：
						<select name="condition" id="condition" tabindex="2">
							<option selected="true" value="考试类别">
								考试类别
							</option>
							<option value="科目名称">
								科目名称
							</option>
							<option>
								学生编号
							</option><option>
								学生姓名
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
				<td width="100%" valign="top">
					<table width="100%" border="1" align="center" cellpadding="0"
						cellspacing="0">
						<!--DWLayoutTable-->
						<tr>
							<td>
								<div align="center">
									考试类别</div>
							</td>
							<td>
								<div align="center">
									科目名称</div>
							</td>
							<td>
								<div align="center">
									学生编号</div>
							</td>
							<td>
								<div align="center">
									学生姓名</div>
							</td>
							<td>
								<div align="center">
									成绩</div>
							</td>
						</tr>
						<c:forEach var="exam" items="${list}">
							<tr>
								<td>
									<div align="center">
										${exam.examType }&nbsp;
									</div>
								</td>
								<td>
									<div align="center">
										${exam.systemCourseCode.subject }&nbsp;
									</div>
								</td>
								<td>
									<div align="center">
										${exam.docuStuInfo.stuId }&nbsp;
									</div>
								</td>
								<td>
									<div align="center">
										${exam.docuStuInfo.name }&nbsp;
									</div>
								</td>
								<td>
									<div align="center">
										${exam.grade }&nbsp;
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
