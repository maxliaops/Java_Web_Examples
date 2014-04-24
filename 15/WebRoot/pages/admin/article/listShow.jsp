<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>

<c:set var="article" value="${requestScope.articlelist}"/>
<c:if test="${empty article}"><br><center>☆★☆ 博主暂时没有发表任何文章！☆★☆</center></c:if>
<c:if test="${!empty article}">
	<table border="0" width="88%" style="margin-top:10;margin-left:20;table-layout:fixed;word-break:break-all" cellpadding="0" cellspacing="0" bordercolor="#4E6900" bordercolordark="white" bordercolorlight="#4E6900" rules="none">
		<tr height="40" valign="top">
			<td>【我的文章 共${requestScope.createPage.allR}篇】</td>
			<td width="35%" align="right"><c:out value="${requestScope.message}" escapeXml="false"/></td>
		</tr>
       	<c:forEach var="single" items="${article}">
		<tr>
			<td colspan="2"><a href="my/admin/article?action=adminSingle&id=${single.id}"><c:out value="${single.artTitle}" escapeXml="false"/></a></td>
		</tr>      				
		<tr height="25" valign="bottom">
			<td><font color="gray">${single.artPubTime}</font></td>
    		<td align="right">
    			<a href="my/admin/article?action=modify&id=${single.id}">【√修改】</a>
    			<a href="my/admin/article?action=delete&id=${single.id}">【×删除】</a>
    		</td>
		</tr>       				
		<tr><td colspan="2"><hr></td></tr>
		</c:forEach>
   	</table>
   	<jsp:include page="/pages/page.jsp"/>
</c:if>