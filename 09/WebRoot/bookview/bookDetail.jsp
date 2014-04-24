<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<html>
	<head>
		<title>图书维护</title>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
		<link href="css/style.css" rel="stylesheet">
	</head>
	<body>
		<table width="777" border="0" align="center" cellpadding="0"
			cellspacing="0">
			<tr>
				<td valign="top">
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
					<form action="modifyBookOperation.htm" method="post"
						name="form1">
						<table width="84%" border="0" align="center" cellpadding="-2"
							cellspacing="-2">
						  <!--DWLayoutTable-->
							<tr>
								<td width="14%" height="27">
									&nbsp;书 号：
								</td>
								<td height="41">
									&nbsp;
									<input name="book_id" type="text" id="bookID2"
										value="${result.bookId }" readonly="yes">
								</td>
								<td height="27">
									&nbsp;书 名：
								</td>
								<td height="27">
									&nbsp;
									<input name="book_name" type="text" id="bookname2"
										value="${result.bookName }">
								</td>
							</tr>
							<tr>
								<td height="27">
									&nbsp;作 者：
								</td>
								<td height="41">
									&nbsp;
									<input name="writer" type="text" id="writer"
										value="${result.writer }">
								</td>
								<td width="15%" height="27">
									&nbsp;类别名称：
								</td>
								<td width="38%" height="27">
									&nbsp;
									<input name="book_type" type="text" id="zishu2"
										value="${result.bookType }">
								</td>
							</tr>
							<tr>
								<td height="27">
									&nbsp;出&nbsp;版&nbsp;社：
								</td>
								<td height="41">
									&nbsp;
									<input name="book_concern" type="text" id="book_concern"
										value="${result.bookConcern }">
								</td>
								<td height="27">
									&nbsp;发行日期：
								</td>
								<td height="41">
									&nbsp;
									<input name="publish_date" type="text" id="publish_date"
										value="${result.publishDate }">
								</td>
							</tr>
							<tr>
								<td height="41">
									&nbsp;操 作 员：
								</td>
								<td height="41">
									&nbsp;
									<input name="czy" type="text" id="czy" value="${result.czy }">
								</td>
								<td height="41">
									&nbsp;价 格：
								</td>
								<td height="41">
									&nbsp;
									<input name="price" type="text" id="price"
										value="${result.price }">
									(元)
								</td>
							</tr>
							<tr>
								<td height="41">
									&nbsp;入库数量：
								</td>
								<td height="41">
									&nbsp;
									<input name="book_count" type="text" id="book_count" value="${result.bookCount }">
								</td>
								<td height="41">
									&nbsp;入库时间：
								</td>
								<td height="41">
									&nbsp;
									<input name="reg_date" type="text" id="reg_date"
										value="${result.regDate }"
										readonly="yes">
								</td>
							</tr>
							<tr>
								<td height="103">
									&nbsp;图书简介：
								</td>
								<td colspan="3">
									<span class="style5">&nbsp; </span>
									<textarea name="remark" cols="65" rows="5" id="remark">${result.remark}</textarea>
								</td>
							</tr>
							<tr>
								<td height="38" colspan="4" align="center">
									<input name="Button" type="submit" value="保存">
									&nbsp;
									<input name="Submit2" type="reset" value="重置">
								</td>
							</tr>
						</table>
					</form>
				</td>
			</tr>
		</table>
	</body>
</html>
