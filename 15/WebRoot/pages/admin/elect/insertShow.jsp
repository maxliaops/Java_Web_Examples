<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>

<!-- 显示添加推荐文章界面 -->
<form action="my/admin/elect" method="post">
	<input type="hidden" name="action" value="insert">
	<input type="hidden" name="type" value="add">
	<table border="0" style="margin-top:8;margin-left:35">
		<tr height="50"><td><c:out value="${requestScope.message}" escapeXml="false"/></td></tr>
		<tr height="20"><td>文章标题：</td></tr>
		<tr><td><input type="text" name="title" size="80" value="${param.title}"></td></tr>
		<tr height="20"><td>文章地址：</td></tr>
		<tr><td><input type="text" name="src" size="80" value="${param.src}"></td></tr>
		<tr height="30">
			<td align="center">
				<input type="submit" value="添加">
				<input type="reset" value="重置">
			</td>
		</tr>
	</table>
</form>