<%@ page language="java" pageEncoding="gbk"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>

<html>
	<head>
		<title>图书维护</title>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
		<link href="css/style.css" rel="stylesheet">
		<script language="javascript" src="js/checkform.js"></script>
	</head>
	<body>
		<table width="90%" border="0" align="center" cellpadding="0"
			cellspacing="0">
		  <!--DWLayoutTable-->
			<tr>
				<td width="777" valign="top">
					<table width="100%" border="0" cellspacing="0" cellpadding="0"
						class="tableBorder_LTR">
						<tr>
							<td height="30" align="center">
								<div align="center">
									<span class="word_grey"></span>
								</div>
							</td>
						</tr>
					</table>
					<form action="borrowBookOperation.htm" method="post"
						name="form1"">
						<table width="84%" border="0" align="center" cellpadding="-2"
							cellspacing="-2">
						  <!--DWLayoutTable-->
							<tr>
								<td width="14%" height="36">
									&nbsp;学 号：
								</td>
								<td height="36">
									&nbsp;
									<input name="stu_id" type="text" id="stu_id" value="${info.stu.stuId }"
									onblur="if(stu_id.value==''||isNaN(stu_id.value))alert('请以数字格式输入学号!');else window.location.href='borrowBookOperation.htm?stu_id='+stu_id.value+'&book_id='+book_id.value"></td>
								<td height="36">
									&nbsp;学生姓名：
								</td>
								<td height="36">
									&nbsp;
									<input name="stu_name" type="text" id="stu_name" readonly="yes"
										value="${info.stu.name }">							  </td>
							</tr><tr>
								<td width="14%" height="36">
									&nbsp;书 号：
								</td>
								<td height="27">
									&nbsp;
									<input name="book_id" type="text" id="book_id" value="${info.book.bookId }"
									onblur="if(book_id.value=='')alert('请输入书号!');else window.location.href='borrowBookOperation.htm?stu_id='+stu_id.value+'&book_id='+book_id.value"></td>
								<td height="36">
									&nbsp;书 名：
								</td>
								<td height="27">
									&nbsp;
									<input name="book_name" type="text" id="book_name" readonly="yes"
										value="${info.book.bookName }">
								</td>
							</tr>
							<tr>
								<td height="36">
								&nbsp;作 者：</td>
								<td height="27">
									&nbsp;
									<input name="writer" type="text" id="writer" readonly="yes"
										value="${info.book.writer }"></td>
								<td width="15%" height="36">
									&nbsp;类别名称：
								</td>
								<td width="38%" height="27">
									&nbsp;
									<input name="book_type" type="text" id="zishu2" readonly="yes"
										value="${info.book.bookType }">
								</td>
							</tr>
							<tr>
								<td height="36">
									&nbsp;操 作 员：
								</td>
								<td height="27">
									&nbsp;
									<input name="czy" type="text" id="czy" value="${info.book.czy }" readonly="yes"></td>
								<td height="36"> &nbsp;单 价： 
								</td>
								<td height="27">
								   &nbsp;
								   <input name="price" type="text" id="price" readonly="yes"
										value="${info.book.price }">
								   (元)						      </td>
							</tr>
							<tr>
								<td height="103">
									&nbsp;图书简介：
								</td>
								<td colspan="3">
									<span class="style5">&nbsp; </span>
									<textarea name="remark" cols="65" rows="5" id="remark" readonly="yes">${info.book.remark }</textarea>
								</td>
							</tr>
							<tr>
								<td height="38" colspan="4" align="center">
									<input name="save" type="submit" value="保存" onclick="return checkBorrow(form1)">
									&nbsp;
									<input name="reset" type="reset" value="重置">
								</td>
							</tr>
						</table>
					</form>
				</td>
			</tr>
            <table width="90%" border="1" align="center" cellpadding="0" cellspacing="0">
              <tr>
                <td><div align="center">学号</div></td>
                <td><div align="center">姓名</div></td>
                <td><div align="center">书号</div></td>
                <td><div align="center">书名</div></td>
                <td><div align="center">借阅日期</div></td>
              </tr>
             <c:forEach var="list" items="${info['list']}">
              <tr>
                <td><div align="center">${list.docuStuInfo.stuId }</div></td>
                <td><div align="center">${info.stu.name }</div></td>
                <td><div align="center">${list.bookReginster.bookId }</div></td>
                <td><div align="center">${list.bookName }</div></td>
                <td><div align="center">${list.borrowDate }</div></td>
              </tr>
             </c:forEach>
            </table>
		</body>
</html>
