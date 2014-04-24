<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>

<!-- 显示“我的最新影音” -->
<table border="1" width="92%" style="margin-top:5;margin-left:8;table-layout:fixed;word-break:break-all" cellpadding="0" cellspacing="0" bordercolor="#4E6900" bordercolordark="white" bordercolorlight="#4E6900" rules="rows" bgcolor="black">
   	<c:set var="media" value="${requestScope.medialist}"/>
   	
   	<c:if test="${empty media}">
   	<tr height="25"><td background="images/mainT.jpg"></td></tr>
   	<tr height="50"><td align="center"><li>暂时没有上传任何视频！</li></td></tr>
   	</c:if>
  	
  	<c:if test="${!empty media}">
	<tr height="35">
	   	<td background="images/mainT.jpg" style="text-indent:25">【我的最新影音】</td>
      	<td background="images/mainT1.jpg" colspan="3" align="right" valign="bottom"><a href="my/guest/media?action=listShow"><img src="images/moreB.jpg"></a></td>
    </tr>
	<tr height="144">
		<c:forEach var="mediaBean" items="${media}">
		<td style="padding-left:1">
			<c:if test="${empty mediaBean}">
			<img src="images/media/null.jpg" width="100%" height="120" style="border:1 solid;border-color:white">
			<center><font color="lightgrey"><b>没有视频预览</b></font></center>
			</c:if>
			
			<c:if test="${!empty mediaBean}">
			<a href="my/guest/media?action=singleShow&id=${mediaBean.id}" title="点击播放《${mediaBean.mediaTitle}》视频"><img src="images/media/${mediaBean.mediaPic}" width="100%" height="120" style="border:1 solid;border-color:gray"></a>
			<center><font color="lightgrey"><b>${mediaBean.subMediaTitle}</b></font></center>
			</c:if>
		</td>	
		</c:forEach>
    </tr>
   	</c:if>   	
</table> 
<!-- 显示“我的最新文章” -->
<table border="1" width="92%" style="margin-top:5;margin-left:8;word-break:break-all" cellpadding="0" cellspacing="0" bordercolor="#4E6900" bordercolordark="white" bordercolorlight="#4E6900" rules="none">
	<c:set var="article" value="${requestScope.articlelist}"/>
	
	<c:if test="${empty article}">
	<tr height="35" bgcolor="#F0F0F0"><td background="images/mainT.jpg" style="text-indent:20">【我的最新文章】</td></tr>
	<tr height="150"><td align="center"><li>暂时没有发表任何文章！</li></td></tr>
	</c:if>
    
	<c:if test="${!empty article}">
		<tr height="35" bgcolor="#F0F0F0">
			<td width="25%" background="images/mainT.jpg" style="text-indent:25">【我的最新文章】</td>
			<td background="images/mainT1.jpg" align="right" valign="bottom"><a href="my/guest/article?action=listShow"><img src="images/moreB.jpg"></a></td>
		</tr>
		<c:forEach var="articleBean" items="${article}">
		<tr height="50"><td colspan="2" style="text-indent:20"><b><a href="my/guest/article?action=singleShow&id=${articleBean.id}"><font color="#4E6900"><c:out value="${articleBean.artTitle}" escapeXml="false"/></font></a></b></td></tr>
		<tr height="120"><td colspan="2" style="padding-left:20" valign="top"><font color="#595959"><c:out value="${articleBean.artCutContent}" escapeXml="false"/></font></td></tr>
		<tr height="1"><td  colspan="2" background="images/line.jpg"></td></tr>
		<tr height="30" valign="bottom">
			<td style="text-indent:20"><a href="my/guest/article?action=singleShow&id=${articleBean.id}">阅读全文</a></td>
			<td align="right" style="padding-right:20"><font color="gray">阅读：${articleBean.artCount} 次 | 评论：${articleBean.revCount} | 发表于：${articleBean.artPubTime}</font></td>
		</tr>
 		<tr><td colspan="2"><hr width="96%" style="color:#D6E3C6"></td></tr>
		</c:forEach>
	</c:if>
</table>
<!-- 显示“最新上传的图片” -->
<table border="1" width="92%" style="margin-top:5;margin-left:8;table-layout:fixed;word-break:break-all" cellpadding="0" cellspacing="0" bordercolor="#4E6900" bordercolordark="white" bordercolorlight="#4E6900" rules="none" bgcolor="black">
	<c:set var="photo" value="${requestScope.photolist}"/>
	
	<c:if test="${empty photo}">
	<tr height="30"><td>【我的相册】</td></tr>
	<tr height="50"><td align="center"><li>暂时没有上传图片！</li></td></tr>
	</c:if>
	
	<c:if test="${!empty photo}">
	<tr height="35">
		<td background="images/mainT.jpg" style="text-indent:25">【我的相册】</td>
		<td colspan="3" align="right" valign="bottom" background="images/mainT1.jpg"><a href="my/guest/photo?action=listShow"><img src="images/moreB.jpg"></a></td>
	</tr>
	<tr height="144">
		<c:forEach var="photoBean" items="${photo}">
		<c:if test="${empty photoBean}">
		<td style="padding-left:1" align="center">
			<img src="images/photo/null.jpg" width="100%" height="120" style="border:1 solid;border-color:white">
			<font color="lightgrey"><b>没有图片预览</b></font>
		</td>
		</c:if>
		
		<c:if test="${!empty photoBean}">
		<td style="padding-left:1" align="center">
			<a href="my/guest/photo?action=singleShow&id=${photoBean.id}"><img src="images/photo/${photoBean.photoSrc}" width="100%" height="120" style="border:1 solid;border-color:gray"></a>
			<b><font color="lightgrey">${photoBean.subPhotoInfo}</font></b>
		</td>
		</c:if>
		</c:forEach>
	</tr>
	</c:if>
</table>