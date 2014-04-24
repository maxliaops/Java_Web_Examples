<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<script type="text/javascript" src="js/inputCheck.js"></script>

<c:set var="single" value="${requestScope.mediasingle}"/>
<c:if test="${empty single}"><br><center>☆★☆ 对不起，播放视频失败！☆★☆</center></c:if>
<c:if test="${!empty single}">       	
	<!-- 显示视频信息，并播放视频 -->
	<table border="1" width="643" height="527" style="margin-top:8;margin-left:25;word-break:break-all" cellpadding="0" cellspacing="0" bordercolor="#4E6900" bordercolordark="white" bordercolorlight="#4E6900" rules="cols">
		<tr height="35"><td colspan="2" style="padding-left:30" background="images/titleL.jpg">正在播放视频：<c:out value="${single.mediaTitle}" escapeXml="false"/></td></tr>
		<tr height="30">
			<!-- 嵌入Flash播放器 -->
			<td rowspan="3" width="473" align="center">
				<object width="470" height="352" classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000">   
					<param name="movie" value="<%=basePath%>/pages/media/videos/player.swf?file=<%=basePath%>/pages/media/videos/${single.mediaSrc}"/> 
					<embed src="<%=basePath%>/pages/media/videos/player.swf?file=<%=basePath%>/pages/media/videos/${single.mediaSrc}" width="550" height="400"></embed>
				</object>
			</td>
			<td style="padding-left:15">【视频信息】</td>
		</tr>
		<tr valign="top">
			<!-- 输出视频基本信息 -->
			<td valign="top" style="padding-left:20;padding-top:10">
				观看：<c:out value="${single.lookCount}"/> 次<br><br>
				评论：<c:out value="${single.reviCount}"/> 条<br><br>
				上传时间：<br><c:out value="${single.mediaUptime}"/><br><br>
				<a href="my/admin/mediaRev?action=adminList&id=${single.id}" target="_blank">【查看评论】</a><br><br>
				<a href="my/admin/media?action=delete&id=${single.id}">【删除视频】</a>
			</td>
		</tr>
		<tr><td align="center"><a href="javascript:window.history.go(-1)">【返回】</a></td></tr>
		<tr height="34"><td colspan="2" style="padding-left:30" background="images/titleL.jpg">视频介绍：</td></tr>
		<tr height="100"><td colspan="2" valign="top" style="padding-top:10"><c:out value="${single.mediaInfo}" escapeXml="false"/></td></tr>
	</table>	
	<!-- 显示视频评论 -->
	<c:set var="mediaRev" value="${requestScope.mediaRlist}"/>
	<table border="0" width="643" style="margin-top:5;margin-left:25;word-break:break-all" cellpadding="0" cellspacing="0" bordercolor="#4E6900" bordercolordark="white" bordercolorlight="#4E6900" rules="none">
		<tr height="34">
			<td style="padding-left:30" background="images/titleL.jpg">最新评论</td>
			<td width="110" align="right" background="images/titleR.jpg"><a href="my/admin/mediaRev?action=adminList&id=${single.id}" target="_blank"><img src="images/moreB.jpg"></a></td>
		</tr>
		<c:if test="${empty mediaRev}"><tr height="100"><td align="center" colspan="2"><li>该视频目前没有任何评论！</li></td></tr></c:if>
		<c:if test="${!empty mediaRev}">
		<c:forEach var="rsingle" items="${mediaRev}">
		<tr height="30"><td colspan="2">☆<u>${rsingle.mediaRAuthor}</u></td></tr>
		<tr><td colspan="2" align="right"><font color="gray">${rsingle.mediaRTime}</font></td></tr>
		<tr><td colspan="2" valign="top" height="60"><font color="#595959">${rsingle.mediaRContent}</font></td></tr>
		<tr height="1"><td  colspan="2" background="images/line.jpg"></td></tr>
		</c:forEach>
		</c:if>
	</table>	
</c:if>