<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<c:set var="single" value="${requestScope.photosingle}"/>
<c:if test="${empty single}"><br><center>☆★☆ 对不起，查看图片详细信息失败！☆★☆</center></c:if>
<c:if test="${!empty single}">       	
	<!-- 显示图片详细信息 -->
	<table border="1" width="643" height="300" rules="none" style="margin-top:8;margin-left:25;table-layout:fixed;word-break:break-all" bordercolor="#4E6900" bordercolordark="white" bordercolorlight="#4E6900" cellpadding="0" cellspacing="0">
		<tr height="270">
			<td rowspan="2" width="70%" valign="top" align="center">
				<a href="pages/photo/bigShow.jsp?src=${single.photoSrc}" title="点击放大图片" target="_blank"><img src="images/photo/${single.photoSrc}" width="100%" height="350" style="border:1 solid;border-color:lightgrey"></a>
			</td>
			<td valign="top" style="padding-left:10;padding-top:20">
				上传时间：<br><c:out value="${single.photoUptime}"/><br><br>
				<a href="my/admin/photo?action=delete&id=${single.id}">【删除图片】</a>
			</td>
		</tr>
		<tr><td align="center"><a href="javascript:window.history.go(-1)">【返回】</a></td></tr>
		<tr><td colspan="2"><hr></td></tr>
		<tr height="34"><td colspan="2" style="padding-left:30" background="images/titleL.jpg">图片介绍：</td></tr>
		<tr height="80" valign="top" style="padding-top:5"><td colspan="2" style="padding-left:8"><c:out value="${single.photoInfo}" escapeXml="false"/></td></tr>
	</table>
</c:if>