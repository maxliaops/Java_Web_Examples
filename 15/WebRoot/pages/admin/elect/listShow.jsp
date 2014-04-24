<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>

<c:set var="elect" value="${requestScope.electlist}"/>
<c:if test="${empty elect}"><center><br>☆★☆ 博主暂时没有推荐任何文章！☆★☆</center></c:if>
<c:if test="${!empty elect}">
	<table border="0" width="88%" style="margin-top:10;margin-left:20;table-layout:fixed;word-break:break-all" cellpadding="0" cellspacing="0" bordercolor="#4E6900" bordercolordark="white" bordercolorlight="#4E6900" rules="none">
		<tr height="40" valign="top">
			<td>【推荐文章】</td>
			<td width="35%" align="right"><c:out value="${requestScope.message}" escapeXml="false"/></td>
		</tr>
       	<c:forEach var="single" items="${elect}">
		<tr height="25">
			<td><b><c:out value="${single.electTitle}" escapeXml="false"/></b></td>
			<td align="right">
				${single.electTime}
				<a href="my/admin/elect?action=delete&id=${single.id}">【×删除】</a>
			</td>
		</tr>      				
		<tr><td colspan="2">地址：<a href="${single.electSrc}" target="_blank">${single.electSrc}</a></td></tr>       				
		<tr><td colspan="2"><hr></td></tr>
		</c:forEach>
   	</table>
</c:if>