<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<script type="text/javascript" src="js/inputCheck.js"></script>

<c:set var="single" value="${requestScope.articlesingle}"/>
<c:if test="${empty single}"><br><center>☆★☆ 对不起，阅读文章失败！☆★☆</center></c:if>
<c:if test="${!empty single}">       	
	<!-- 显示文章详细内容 -->
	<table border="0" width="88%" style="margin-top:5;margin-left:25;word-break:break-all" cellpadding="0" cellspacing="0" bordercolor="#4E6900" bordercolordark="white" bordercolorlight="#4E6900" rules="none">
		<tr height="40"><td align="right"><font color="gray">阅读：${single.artCount} 次 | 评论：${single.revCount} 条 | 发表于：${single.artPubTime}</font></td></tr>       				
		<tr height="50"><td><b><font color="#4E6900" size="4"><c:out value="${single.artTitle}" escapeXml="false"/></font></b></td></tr>
		<tr height="100"><td valign="top"><font color="#595959"><c:out value="${single.artContent}" escapeXml="false"/></font></td></tr>
		<tr height="30"><td align="right" valign="bottom">【<b>文章结束</b>】</td></tr>
	</table>	       	
	<!-- 显示文章评论 -->
	<c:set var="artReview" value="${requestScope.artrlist}"/>
	<table border="0" width="88%" style="margin-top:5;margin-left:25;word-break:break-all" cellpadding="0" cellspacing="0" bordercolor="#4E6900" bordercolordark="white" bordercolorlight="#4E6900" rules="all">
		<tr height="34">
			<td width="660" style="padding-left:30" background="images/titleL.jpg">最新评论</td>
			<td width="110" align="right" background="images/titleR.jpg"><a href="my/guest/artReview?action=listShow&id=${single.id}" target="_blank"><img src="images/moreB.jpg"></a></td>
		</tr>
		<c:if test="${empty artReview}"><tr height="100"><td align="center" colspan="2"><li>该文章目前没有任何评论！</li></td></tr></c:if>
		<c:if test="${!empty artReview}">
		<c:forEach var="rsingle" items="${artReview}">
		<tr height="30"><td colspan="2">☆ <u>${rsingle.artRAuthor}</u></td></tr>
		<tr><td colspan="2" align="right"><font color="gray">${rsingle.artRTime}</font></td></tr>
		<tr><td colspan="2" valign="top" height="60"><font color="#595959">${rsingle.artRContent}</font></td></tr>
		<tr height="1"><td  colspan="2" background="images/line.jpg"></td></tr>
		</c:forEach>
		</c:if>
	</table>
	<!-- 实现发表评论界面 -->
	<form action="my/admin/artReview" method="post">
	<input type="hidden" name="action" value="review">
	<input type="hidden" name="rootId" value="${single.id}">
	<table border="1" width="88%" style="margin-top:5;margin-left:25;word-break:break-all" cellpadding="0" cellspacing="0" bordercolor="#4E6900" bordercolordark="white" bordercolorlight="#4E6900" rules="rows">
		<tr height="34">
			<td background="images/titleL.jpg" style="text-indent:30">发表评论</td>
			<td background="images/titleR.jpg" width="18%" align="center">匿名发表：<input type="checkbox" name="noname" value="true"></td>
		</tr>
		<tr height="40" valign="bottom">
			<td colspan="2">
				<font color="#7F7F7F">
					写入：<input type="text" name="use" value="0" size="4" disabled style="text-align:center;border:0;"> 个&nbsp;&nbsp;
					剩余：<input type="text" name="rem" value="1000" size="4" disabled style="text-align:center;border:0;"> 个 
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					评论请先<a href="pages/userLogon.jsp" target="_blank">【登录】，</a>您也可以选中 <b>匿名发表</b> 无需登录进行发表！
				</font>
			</td>
		</tr>
		<tr><td colspan="2" align="center"><textarea name="artRContent" rows="10" cols="85" onkeydown="check(artRContent,use,rem,1000)" onkeyup="check(artRContent,use,rem,1000)"></textarea></tr>
		<tr height="30">
			<td colspan="2" align="center">
				<input type="submit" value="发表评论">
				<input type="reset" value="重新填写">
			</td>
		</tr>	       		
	</table>
	</form>
</c:if>