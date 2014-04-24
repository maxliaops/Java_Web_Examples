<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>

<!-- 实现上传影音界面 -->
<form action="my/admin/media?action=insert&type=upload" method="post" enctype="multipart/form-data">
<table border="0" width="90%" style="margin-top:50;margin-left:30" cellpadding="0" cellspacing="0" bordercolor="#4E6900" bordercolordark="white" bordercolorlight="#4E6900" rules="none">
	<tr height="30"><td colspan="2"><c:out value="${requestScope.message}" escapeXml="false"/></td></tr>
	<tr height="50">
		<td width="20%" align="center">选择视频：</td>
		<td><input type="file" size="59" name="mymedia"></td>
	</tr>
	<tr height="50">
		<td align="center">视频标题：</td>
		<td><input type="text" name="title" size="70"></td>
	</tr>
	<tr height="50">
		<td align="center">视频描述：</td>
		<td><input type="text" name="info" size="70"></td>
	</tr>
	<tr>
		<td colspan="2" align="center">
			<input type="submit" value="上传视频">
			<input type="reset" value="重新选择">
		</td>
	</tr>
</table>
</form>