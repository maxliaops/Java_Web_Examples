<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<script type="text/javascript" src="js/inputCheck.js"></script>

<c:set var="single" value="${requestScope.articlesingle}"/>
<c:if test="${empty single}"><br><li>对不起，阅读文章失败！</li></c:if>
<c:if test="${!empty single}">       	
	<!-- 显示文章详细内容 -->
	<form action="my/admin/article" method="post">
	<input type="hidden" name="id" value="${single.id}">
	<input type="hidden" name="action" value="modify">
	<input type="hidden" name="type" value="update">
	
	<table border="0" width="88%" style="margin-top:8;margin-left:25;word-break:break-all" cellpadding="0" cellspacing="0" bordercolor="#4E6900" bordercolordark="white" bordercolorlight="#4E6900" rules="none">
		<tr height="30"><td colspan="2"><c:out value="${requestScope.message}" escapeXml="false"/></td></tr>
		<tr height="40"><td align="right" colspan="2">阅读：${single.artCount} 次 | 评论：${single.revCount} 条 | 发表于：${single.artPubTime}&nbsp;</td></tr>       				
		<tr><td colspan="2">文章标题：</td></tr>
		<tr><td colspan="2"><input type="text" name="title" size="102" value="${single.artTitle}"></td></tr>
		<tr height="50" valign="bottom">
			<td>文章内容：</td>
			<td align="right">
				<font color="#7F7F7F">
					写入：<input type="text" name="use" value="0" size="4" disabled style="text-align:center;border:0;"> 个&nbsp;&nbsp;
					剩余：<input type="text" name="rem" value="1000" size="4" disabled style="text-align:center;border:0;"> 个&nbsp;
				</font>
			</td>
		</tr>
		<tr><td colspan="2"><textarea name="content" cols="86" rows="20" onfocus="check(content,use,rem,1000)" onkeydown="check(content,use,rem,1000)" onkeyup="check(content,use,rem,1000)">${single.initArtContent}</textarea></td></tr>
		<tr height="30">
			<td colspan="2" align="center">
				<input type="submit" value="提交修改">
				<input type="reset" value="重新填写">
			</td>
		</tr>
	</table>
	</form>	
</c:if>