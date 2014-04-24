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
	<table border="1" width="625" height="504" cellpadding="0" cellspacing="0" style="word-break:break-all;margin-top:5;margin-left:25" bordercolor="#4E6900" bordercolordark="white" bordercolorlight="#4E6900" rules="cols">
		<tr height="35"><td colspan="2" style="padding-left:30" background="images/titleL.jpg">正在播放视频：<c:out value="${single.mediaTitle}" escapeXml="false"/></td></tr>
		<tr>
			<!-- 嵌入Flash播放器 -->
			<td rowspan="2" width="455" align="center">
				<object width="452" height="339" classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000">   
					<param name="movie" value="<%=basePath%>/pages/media/videos/player.swf?file=<%=basePath%>/pages/media/videos/${single.mediaSrc}"/> 
					<embed src="<%=basePath%>/pages/media/videos/player.swf?file=<%=basePath%>/pages/media/videos/${single.mediaSrc}" width="40%" height="30%"></embed>
				</object>
			</td>
			<td style="padding-left:15">【视频信息】</td>
		</tr>
		<tr valign="top">
			<!-- 输出视频基本信息 -->
			<td valign="top" style="padding-left:20;padding-top:10">
				观看：<c:out value="${single.lookCount}"/> 次<br><br>
				评论：<c:out value="${single.reviCount}"/> 条<br><br>
				上传时间：<br><c:out value="${single.mediaUptime}"/>
			</td>
		</tr>
		<tr height="34"><td colspan="2" style="padding-left:30" background="images/titleL.jpg">视频介绍：</td></tr>
		<tr height="90"><td colspan="2" valign="top" style="padding-top:10"><c:out value="${single.mediaInfo}" escapeXml="false"/></td></tr>
	</table>	
	<!-- 显示视频评论 -->
	<c:set var="mediaRev" value="${requestScope.mediaRlist}"/>
	<table border="0" width="625" style="margin-top:5;margin-left:25;word-break:break-all" cellpadding="0" cellspacing="0" bordercolor="#4E6900" bordercolordark="white" bordercolorlight="#4E6900" rules="none">
		<tr height="34">
			<td style="padding-left:30" background="images/titleL.jpg">最新评论</td>
			<td width="110" align="right" background="images/titleR.jpg"><a href="my/guest/mediaRev?action=listShow&id=${single.id}" target="_blank"><img src="images/moreB.jpg"></a></td>
		</tr>
		<c:if test="${empty mediaRev}"><tr height="80"><td align="center" colspan="2"><li>该视频目前没有任何评论！</li></td></tr></c:if>
		<c:if test="${!empty mediaRev}">
		<c:forEach var="rsingle" items="${mediaRev}">
		<tr height="30"><td colspan="2">☆ <u>${rsingle.mediaRAuthor}</u></td></tr>
		<tr><td colspan="2" align="right"><font color="gray">${rsingle.mediaRTime}</font></td></tr>
		<tr><td colspan="2" valign="top" height="40">${rsingle.mediaRContent}</td></tr>
		<tr><td colspan="2"><hr></td></tr>
		</c:forEach>
		</c:if>
	</table>
	<!-- 实现发表评论界面 -->
	<form action="my/admin/mediaRev" method="post">
	<input type="hidden" name="action" value="review">
	<input type="hidden" name="rootId" value="${single.id}">
	<table border="1" width="625" style="margin-top:5;margin-left:25;word-break:break-all" cellpadding="0" cellspacing="0" bordercolor="#4E6900" bordercolordark="white" bordercolorlight="#4E6900" rules="rows">
		<tr height="30"><td colspan="2">留言请先<a href="pages/userLogon.jsp" target="_blank">【登录】，</a>您也可以选中 <b>匿名留言</b> 无需登录发表评论！</td></tr>
		<tr height="34" bgcolor="#F0F0F0">
			<td background="images/titleL.jpg" style="text-indent:30">发表评论</td>
			<td background="images/titleR.jpg" width="18%" align="center">匿名发表：<input type="checkbox" name="noname" value="true"></td>
		</tr>
		<tr height="40" valign="bottom">
			<td style="text-indent:5" colspan="2">
				评论内容：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<font color="#7F7F7F">
					写入：<input type="text" name="use" value="0" size="4" disabled style="text-align:center;border:0;"> 个&nbsp;&nbsp;
					剩余：<input type="text" name="rem" value="1000" size="4" disabled style="text-align:center;border:0;"> 个 
				</font>
			</td>
		</tr>
		<tr><td colspan="2" align="center"><textarea name="mediaRContent" rows="10" cols="85" onkeydown="check(mediaRContent,use,rem,1000)" onkeyup="check(mediaRContent,use,rem,1000)"></textarea></tr>
		<tr height="30">
			<td colspan="2" align="center">
				<input type="submit" value="发表评论">
				<input type="reset" value="重新填写">
			</td>
		</tr>	       		
	</table>
	</form>
</c:if>