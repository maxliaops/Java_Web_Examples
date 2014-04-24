<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>

<c:set var="media" value="${requestScope.medialist}"/>
<c:if test="${empty media}"><br><center>☆★☆ 博主暂时没有上传任何视频！☆★☆</center></c:if>
<c:if test="${!empty media}">
	<table border="1" width="92%" style="margin-top:5;margin-left:8;table-layout:fixed;word-break:break-all" cellpadding="0" cellspacing="0" bordercolor="#4E6900" bordercolordark="white" bordercolorlight="#4E6900" rules="none" bgcolor="black">
		<tr height="35"><td colspan="4" style="text-indent:30" background="images/mainT.jpg">【我的影音 共 ${requestScope.createPage.allR} 个】</td></tr>
       	<c:forEach var="sonlist" items="${media}">
       	<tr height="175">
			<c:forEach var="single" items="${sonlist}">
			<td width="23%" style="padding-left:1">
				<c:if test="${empty single}">
				<img src="images/media/null.jpg" width="100%" height="120" style="border:1 solid;border-color:lightgrey">
				<br><center><font color="lightgrey"><b>没有视频预览</b></font></center><br>
				</c:if>
				<c:if test="${!empty single}">
				<a href="my/guest/media?action=singleShow&id=${single.id}" title="点击播放《${single.mediaTitle}》视频"><img src="images/media/${single.mediaPic}" width="100%" height="120" style="border:1 solid;border-color:white"></a>
				<font color="lightgrey">
				观：${single.lookCount}<br>
				评：${single.reviCount}<br>
				题：${single.subMediaTitle}
				</font>
				</c:if>
			</td>	
			</c:forEach>
		</tr>
		</c:forEach>
   	</table>   	
   	<jsp:include page="/pages/page.jsp"/>
</c:if>