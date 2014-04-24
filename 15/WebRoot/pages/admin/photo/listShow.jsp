<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>

<c:set var="photo" value="${requestScope.photolist}"/>
<c:if test="${empty photo}"><br><center>☆★☆ 博主暂时没有上传任何图片！☆★☆</center></c:if>
<c:if test="${!empty photo}">
	<table border="0" width="650" style="margin-top:8;margin-left:10;table-layout:fixed;word-break:break-all" cellpadding="0" cellspacing="0" bordercolor="#4E6900" bordercolordark="white" bordercolorlight="#4E6900" rules="all">
		<tr height="40">
			<td colspan="2">【我的相册 共 ${requestScope.createPage.allR} 张】</td>
			<td colspan="2" align="right"><c:out value="${requestScope.message}" escapeXml="false"/></td>
		</tr>
       	<c:forEach var="sonlist" items="${photo}">
       	<tr height="155" style="padding-left:1">
			<c:forEach var="single" items="${sonlist}">
			<td width="160" align="center">
				<c:if test="${empty single}">
				<img src="images/photo/null.jpg" width="100%" height="120" style="border:1 solid;border-color:lightgrey">
				<br>没有图片预览
				</c:if>
				<c:if test="${!empty single}">
				<a href="my/admin/photo?action=adminSingle&id=${single.id}"><img src="images/photo/${single.photoSrc}" width="100%" height="120" style="border:1 solid;border-color:lightgrey"></a>
				${single.subPhotoInfo}<br>
				<a href="my/admin/photo?action=delete&id=${single.id}">【删除】</a>
				</c:if>
			</td>	
			</c:forEach>
		</tr>
		<tr><td colspan="4"><hr></td></tr>
		</c:forEach>
   	</table>   	
   	<jsp:include page="/pages/page.jsp"/>
</c:if>