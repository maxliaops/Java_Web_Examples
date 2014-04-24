<%@ page language="java" contentType="text/html; charset=gb2312"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>

<table border="0" width="1003" height="299" cellpadding="0" cellspacing="0" style="background:url(images/top.jpg)">
	<tr>
		<td align="right" colspan="9" style="padding-right:20">
			<c:out value="${sessionScope.callBlogMaster.userMotto}"/>
			<br>---
			<b><c:out value="${sessionScope.callBlogMaster.userName}"/></b>【博客】
		</td>
	</tr>
    <!-- 导航菜单 -->
    <tr height="30" align="center" valign="bottom">
    	<td width="17%">
    		<c:set var="visitor" value="${sessionScope.logoner}"/>
    		<c:if test="${empty visitor}">
    		<a href="pages/userLogon.jsp" target="_blank">【访问者登录】</a>
    		</c:if>
    		<c:if test="${!empty visitor}">
    		欢迎您：<c:out value="${visitor.userName}"/>
    		</c:if>
    	</td>
       	<td><a href="goIndex"><img src="images/indexB.jpg"></a></td>
       	<td><a href="my/goBlog?master=${sessionScope.callBlogMaster.id}"><img src="images/defaultB.jpg"></a></td>
       	<td><a href="my/guest/article?action=listShow"><img src="images/articleB.jpg"></a></td>
      	<td><a href="my/guest/photo?action=listShow"><img src="images/photoB.jpg"></a></td>
      	<td><a href="my/guest/media?action=listShow"><img src="images/mediaB.jpg"></a></td>
    	<td><a href="my/guest/word?action=linkTo"><img src="images/wordB.jpg"></a></td>
      	<td><a href="my/logon?goWhere=adminTemp"><img src="images/adminB.jpg"></a></td>
       	<td width="20%"><%@ include file="showTime.jsp" %></td>
    </tr>
    <tr height="1"><td colspan="9" valign="top"><hr style="color:#4E6900;margin-top:-8"></td></tr>
</table>