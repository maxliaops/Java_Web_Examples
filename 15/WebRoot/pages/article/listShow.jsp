<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>

<c:set var="article" value="${requestScope.articlelist}"/>
<c:if test="${empty article}"><br><center>☆★☆ 博主暂时没有发表任何文章！☆★☆</center></c:if>
<c:if test="${!empty article}">
	<table border="1" width="92%" style="margin-top:5;margin-left:8;table-layout:fixed;word-break:break-all" cellpadding="0" cellspacing="0" bordercolor="#4E6900" bordercolordark="white" bordercolorlight="#4E6900" rules="none">
		<tr height="35" style="text-indent:25"><td colspan="2" background="images/mainT.jpg">【我的文章 共${requestScope.createPage.allR}篇】</td></tr>
       	<c:forEach var="single" items="${article}">
		<tr height="30"><td colspan="2" style="text-indent:20"><b><a href="my/guest/article?action=singleShow&id=${single.id}"><font color="#4E6900"><c:out value="${single.artTitle}" escapeXml="false"/></font></a></b></td></tr>
   		<tr><td colspan="2" align="right" style="text-indent:20">${single.artPubTime}&nbsp;</td></tr>       				
		<tr height="120"><td valign="top" colspan="2" style="padding-left:20"><font color="#595959"><c:out value="${single.artCutContent}" escapeXml="false"/></font></td></tr>
		<tr height="1"><td  colspan="2" background="images/line.jpg"></td></tr>
		<tr height="25" valign="bottom">
    		<td width="50%" style="text-indent:20"><a href="my/guest/article?action=singleShow&id=${single.id}">阅读全文</a></td>
    		<td width="50%" align="right" style="padding-right:20">
				<font color="gray">阅读：${single.artCount} 次 | 评论：${single.revCount}</font>
			</td>
		</tr>       				
		<tr><td colspan="2"><hr width="96%" style="color:#D6E3C6"></td></tr>
		</c:forEach>
   	</table>
   	<jsp:include page="/pages/page.jsp"/>
</c:if>