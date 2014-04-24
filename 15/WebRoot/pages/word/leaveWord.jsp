<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<script type="text/javascript" src="js/inputCheck.js"></script>
	<table border="0" width="96%" height="30" cellpadding="0" cellspacing="0" style="margin-top:3;margin-left:25" rules="none">
		<tr valign="bottom">
			<td>留言请先<a href="pages/userLogon.jsp" target="_blank">【登录】，</a>您也可以选中 <b>匿名留言</b> 无需登录进行留言！</td>
			<td align="center"><c:out value="${requestScope.message}" escapeXml="false"/></td>			
		</tr>
	</table>
	<!-- 实现留言界面 -->
	<form action="my/admin/word" method="post">
	<input type="hidden" name="action" value="review">
	<table border="1" width="88%" style="margin-left:25;word-break:break-all" cellpadding="0" cellspacing="0" bordercolor="#4E6900" bordercolordark="white" bordercolorlight="#4E6900" rules="rows">
		<tr height="35" bgcolor="#F0F0F0">
			<td background="images/titleL.jpg" style="text-indent:25">【我要留言】</td>
			<td background="images/titleR.jpg" width="18%" align="center">匿名留言：<input type="checkbox" name="noname" value="true"></td>
		</tr>
		<tr height="35" valign="bottom">
			<td colspan="2">
				<font color="#7F7F7F">
					写入：<input type="text" name="use" value="0" size="4" disabled style="text-align:center;border:0;"> 个&nbsp;&nbsp;
					剩余：<input type="text" name="rem" value="1000" size="4" disabled style="text-align:center;border:0;"> 个 
				</font>
			</td>
		</tr>
		<tr><td colspan="2" align="center"><textarea name="wordContent" rows="10" cols="85" onkeydown="check(wordContent,use,rem,1000)" onkeyup="check(wordContent,use,rem,1000)"></textarea></tr>
		<tr height="30">
			<td colspan="2" align="center">
				<input type="submit" value="提交留言">
				<input type="reset" value="重新填写">
			</td>
		</tr>	       		
	</table>
	</form>
	<!-- 显示最新留言 -->
	<c:set var="word" value="${requestScope.wordList}"/>
	<table border="0" width="88%" style="margin-top:5;margin-left:25;word-break:break-all" cellpadding="0" cellspacing="0" bordercolor="#4E6900" bordercolordark="white" bordercolorlight="#4E6900" rules="none">
		<tr height="34" bgcolor="#F0F0F0">
			<td style="padding-left:25" background="images/titleL.jpg">最新留言</td>
			<td width="18%" align="right" background="images/titleR.jpg"><a href="my/guest/word?action=listShow" target="_blank"><img src="images/moreB.jpg"></a></td>
		</tr>
		<c:if test="${empty word}"><tr height="100"><td align="center" colspan="2"><li>目前没有任何留言！</li></td></tr></c:if>
		<c:if test="${!empty word}">
		<c:forEach var="single" items="${word}">
		<tr height="30"><td colspan="2">☆<u>${single.wordAuthor}</u></td></tr>
		<tr><td colspan="2" align="right"><font color="gray">${single.wordTime}</font></td></tr>
		<tr><td colspan="2" valign="top" height="40"><c:out value="${single.wordContent}" escapeXml="true"/></td></tr>
		<tr height="1"><td  colspan="2" background="images/line.jpg"></td></tr>
		</c:forEach>
		</c:if>
	</table>