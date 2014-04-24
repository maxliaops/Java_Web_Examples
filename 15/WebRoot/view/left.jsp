<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>

<!-- 博主信息 -->
<c:set var="master" value="${sessionScope.callBlogMaster}"/>
<table border="1" width="250" rules="none" style="word-break:break-all;margin-top:5" cellpadding="0" cellspacing="0" bordercolor="#4E6900" bordercolordark="white" bordercolorlight="#4E6900">
    <tr height="26"><td background="images/myT.jpg"></td></tr>
    <tr height="150"><td background="images/myBack.jpg" align="center"><img src="images/ico/${master.userIco}" width="237" height="140" style="border:1 solid"></td></tr>
    <tr height="30">
    	<td align="center">
    		<a href="my/admin/friend?action=insert"><img src="images/myIco1.jpg">【加为好友】</a>
    		<a href="my/guest/word?action=linkTo"><img src="images/myIco2.jpg">【给我留言】</a>
    	</td>
    </tr>
</table> 
<!-- 活动地带 -->
<table border="1" width="250" style="margin-top:10"  cellpadding="0" cellspacing="0" bordercolor="#4E6900" bordercolordark="white" bordercolorlight="#4E6900" rules="none">
  	<tr height="26"><td colspan="2" style="text-indent:10">■活动地带</td></tr>
    <tr align="center" height="25">
       	<td><a href="pages/myInfo.jsp" target="_blank">☆个人资料</a></td>
       	<td><a href="my/logon?goWhere=adminTemp">☆管理博客</a></td>
    </tr>
    <tr align="center" height="25">
       	<td><a href="my/guest/article?action=listShow">☆我的文章</a></td>            	
       	<td><a href="my/guest/photo?action=listShow">☆我的相册</a></td>
    </tr>
    <tr align="center" height="25">
      	<td><a href="my/guest/media?action=listShow">☆我的影音</a></td>
       	<td><a href="my/guest/word?action=linkTo">☆给我留言</a></td>
    </tr> 
</table>
<!-- 推荐文章 --> 
<c:set var="elect" value="${sessionScope.electlist}"/>
<table border="1" width="250" style="margin-top:10"  cellpadding="0" cellspacing="0" bordercolor="#4E6900" bordercolordark="white" bordercolorlight="#4E6900" rules="none">
   	<tr height="46"><td background="images/articleT.jpg"></td></tr>    	
	<c:if test="${empty elect}">
	<tr height="100" align="center"><td><li>没有推荐文章！</li></td></tr>
	</c:if>
	
	<c:if test="${!empty elect}">
	<c:forEach var="esingle" items="${elect}">
	<tr height="30"><td style="text-indent:15"><a href="${esingle.electSrc}"><c:out value="${esingle.electTitle}" escapeXml="true"/></a></td></tr>
	</c:forEach>
	</c:if>
</table>
<!-- 好友博客 -->
<c:set var="friend" value="${sessionScope.friendlist}"/>
<table border="1" width="250" style="margin-top:10"  cellpadding="0" cellspacing="0" bordercolor="#4E6900" bordercolordark="white" bordercolorlight="#4E6900" rules="none">
   	<tr height="25">
   		<td width="30%" style="text-indent:10">■好友博客</td>
   		<td align="right"><a href="my/guest/friend?action=listShow" target="_blank">更多</a></td>
   	</tr>
   	<c:if test="${empty friend}">
   	<tr height="100"><td align="center" colspan="2"><li>博主目前没有添加任何好友！</li></td></tr>
   	</c:if>
   	<c:if test="${!empty friend}">
   	<c:forEach var="fsingle" items="${friend}">
   	<tr height="30">
   		<td colspan="2" style="text-indent:15"><a href="my/goBlog?master=${fsingle.id}" title="${fsingle.userName}"><c:out value="${fsingle.cutUserBlogName}" escapeXml="true"/></a></td>
   	</tr>
   	</c:forEach>
   	</c:if>
</table>
<!-- 友情链接 -->
<c:set var="link" value="${sessionScope.linklist}"/>
<table border="1" width="250" style="margin-top:10"  cellpadding="0" cellspacing="0" bordercolor="#4E6900" bordercolordark="white" bordercolorlight="#4E6900" rules="none">
   	<tr height="25" bgcolor="#F0F0F0"><td background="images/linkT.jpg"></td></tr> 
   	
	<c:if test="${empty link}">
	<tr height="100" align="center"><td><li>没有友情链接！</li></td></tr>
	</c:if>
	
	<c:if test="${!empty link}">
	<c:forEach var="lsingle" items="${link}">
	<tr height="25"><td style="text-indent:15"><a href="${lsingle.linkSrc}"><c:out value="${lsingle.cutLinkTitle}" escapeXml="true"/></a></td></tr>
	</c:forEach>
	</c:if>
</table>
<!-- 博客访问排行榜 -->
<c:set var="top" value="${sessionScope.toplist}"/>
<table border="1" width="250" style="margin-top:10"  cellpadding="0" cellspacing="0" bordercolor="#4E6900" bordercolordark="white" bordercolorlight="#4E6900" rules="none">
   	<tr height="25">
   		<td style="text-indent:10">■访问排行榜</td>
   		<td align="right">前10名&nbsp;</td>
   	</tr> 
	<c:if test="${!empty top}">
	<c:forEach var="tsingle" items="${top}">
	<tr height="25">
		<td style="text-indent:15"><a href="my/goBlog?master=${tsingle.id}"><c:out value="${tsingle.userName}" escapeXml="true"/></a></td>
		<td align="right"><c:out value="${tsingle.userHitNum}"/> 次&nbsp;</td>
	</tr>
	</c:forEach>
	</c:if>
</table>
<br>