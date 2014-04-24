<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>

<c:set var="friend" value="${requestScope.friendList}"/>
<c:if test="${empty friend}"><br><center>☆★☆ 博主目前没有添加任何好友！☆★☆</center></c:if>

<c:if test="${!empty friend}">       	
<table border="0" width="88%" style="margin-top:10;margin-left:20;table-layout:fixed;word-break:break-all" cellpadding="0" cellspacing="0" bordercolor="#4E6900" bordercolordark="white" bordercolorlight="#4E6900" rules="all">
	<tr height="35">
		<td style="padding-left:5" colspan="2">☆<u>我的所有好友</u> </td>
		<td colspan="2" align="right"><c:out value="${requestScope.message}" escapeXml="false"/></td>
	</tr>
	<tr height="50">
	     <td align="center" width="30%"><font color="#FF3C83"><b>好友姓名</b></font></td>
	     <td align="center" width="40%"><font color="#FF3C83"><b>好友博客</b></font></td>
	     <td align="right" width="15%"><font color="#FF3C83"><b>访问次数</b></font></td>
	     <td align="center" width="15%"><font color="#FF3C83"><b>操作</b></font></td>
	</tr>
	<c:forEach var="single" items="${friend}">
	<tr align="center" height="30">
	     <td><a href="my/admin/friend?action=adminSingle&id=${single.id}" target="_blank"><c:out value="${single.userName}"/></a></td>
	     <td><a href="my/goBlog?master=${single.id}" target="_blank"><c:out value="${single.userBlogName}"/></a></td>
	     <td align="right"><c:out value="${single.userHitNum}"/>　次</td>
	     <td align="center"><a href="my/admin/friend?action=delete&id=${single.id}">【删除】</a></td>
	</tr>
	<tr height="1"><td colspan="4" background="images/line.jpg"></td></tr>
	</c:forEach>
</table>
</c:if>