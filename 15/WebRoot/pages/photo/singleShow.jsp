<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<c:set var="single" value="${requestScope.photosingle}"/>
<c:if test="${empty single}"><br><center>☆★☆ 对不起，查看图片详细信息失败！☆★☆</center></c:if>
<c:if test="${!empty single}">       	
	<!-- 显示图片详细信息 -->
	<table border="1" width="645" style="margin-top:5;margin-left:25;table-layout:fixed;word-break:break-all" cellpadding="0" cellspacing="0" bordercolor="#4E6900" bordercolordark="white" bordercolorlight="#4E6900" rules="none">
		<tr height="300">
			<td rowspan="2" width="450" valign="top" align="center">
				<a href="pages/photo/bigShow.jsp?src=${single.photoSrc}" title="点击放大图片" target="_blank"><img src="images/photo/${single.photoSrc}" width="100%" height="100%" style="border:1 solid;border-color:lightgrey"></a>
			</td>
			<td width="195" valign="top" style="padding-left:10;padding-top:20">上传时间：<br><c:out value="${single.photoUptime}"/></td>
		</tr>
		<tr><td align="center"><a href="javascript:window.history.go(-1)">【返回】</a></td></tr>
		<tr><td colspan="2"><hr></td></tr>
		<tr height="34"><td colspan="2" style="padding-left:30" background="images/titleL.jpg"><b>图片介绍：</b></td></tr>
		<tr height="80"><td colspan="2" valign="top" style="padding-top:10"><c:out value="${single.photoInfo}" escapeXml="false"/></td></tr>
	</table>
</c:if>