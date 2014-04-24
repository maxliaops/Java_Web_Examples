<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<script type="text/javascript" src="js/inputCheck.js"></script>

	<!-- 显示发表文章界面 -->
	<form action="my/admin/article" method="post">
	<input type="hidden" name="action" value="insert">
	<input type="hidden" name="type" value="add">
	
	<table border="0" width="88%" style="margin-top:8;margin-left:25;word-break:break-all" cellpadding="0" cellspacing="0" bordercolor="#4E6900" bordercolordark="white" bordercolorlight="#4E6900" rules="none">
		<tr height="40"><td colspan="2"><c:out value="${requestScope.message}" escapeXml="false"/></td></tr>
		<tr><td colspan="2">文章标题：</td></tr>
		<tr><td colspan="2"><input type="text" name="title" size="102" value="${param.title}"></td></tr>
		<tr height="50" valign="bottom">
			<td>文章内容：</td>
			<td align="right">
				<font color="#7F7F7F">
					写入：<input type="text" name="use" value="0" size="4" disabled style="text-align:center;border:0;"> 个&nbsp;&nbsp;
					剩余：<input type="text" name="rem" value="1000" size="4" disabled style="text-align:center;border:0;"> 个&nbsp;
				</font>
			</td>
		</tr>
		<tr><td colspan="2"><textarea name="content" cols="86" rows="20" onfocus="check(content,use,rem,1000)" onkeydown="check(content,use,rem,1000)" onkeyup="check(content,use,rem,1000)">${param.content}</textarea></td></tr>
		<tr height="30">
			<td colspan="2" align="center">
				<input type="submit" value="发表文章">
				<input type="reset" value="重新填写">
			</td>
		</tr>
	</table>
	</form>	