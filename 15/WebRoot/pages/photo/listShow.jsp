<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>

<c:set var="photo" value="${requestScope.photolist}"/>
<c:if test="${empty photo}"><br><center>☆★☆ 博主暂时没有上传任何图片！☆★☆</center></c:if>
<c:if test="${!empty photo}">
	<table border="1" width="92%" style="margin-top:5;margin-left:8;table-layout:fixed;word-break:break-all" cellpadding="0" cellspacing="0" bordercolor="#4E6900" bordercolordark="white" bordercolorlight="#4E6900" rules="none" bgcolor="black">
		<tr height="35"><td colspan="4" style="text-indent:23" background="images/mainT.jpg">【我的相册 共 ${requestScope.createPage.allR} 张】</td></tr>
       	<c:forEach var="sonlist" items="${photo}">
       	<tr height="145">
			<c:forEach var="single" items="${sonlist}">
			<td width="24%" align="center">
				<c:if test="${empty single}">
				<img src="images/photo/null.jpg" width="99%" height="120" style="border:1 solid;border-color:lightgrey">
				<b><font color="lightgrey">没有图片预览</font></b>
				</c:if>
				<c:if test="${!empty single}">
				<a href="my/guest/photo?action=singleShow&id=${single.id}"><img src="images/photo/${single.photoSrc}" width="99%" height="120" style="border:1 solid;border-color:lightgrey"></a>
				<b><font color="lightgrey">${single.subPhotoInfo}</font></b>
				</c:if>
			</td>	
			</c:forEach>
		</tr>
		</c:forEach>
   	</table>   	
   	<jsp:include page="/pages/page.jsp"/>
</c:if>