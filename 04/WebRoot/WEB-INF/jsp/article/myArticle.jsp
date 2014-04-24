<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>明日知道-国内领先的IT技术搜素引擎</title>
<script type="text/JavaScript">
	function MM_preloadImages() { //v3.0
		var d = document;
		if (d.images) {
			if (!d.MM_p)
				d.MM_p = new Array();
			var i, j = d.MM_p.length, a = MM_preloadImages.arguments;
			for (i = 0; i < a.length; i++)
				if (a[i].indexOf("#") != 0) {
					d.MM_p[j] = new Image;
					d.MM_p[j++].src = a[i];
				}
		}
	}
	//-->
</script>
<link href="css/css.css" rel="stylesheet" type="text/css" />
<style type="text/css">
<!--
#Layer1 {
	position: absolute;
	left: 225px;
	top: 11px;
	width: 154px;
	height: 54px;
	z-index: 1;
}

body {
	margin-left: 00px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
-->
</style>
</head>
<body>
<body style="padding: 5px 30px 0px 30px;">
<s:include value="/WEB-INF/jsp/article/search.jsp"></s:include>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
	<table width="100%" border="0" align="center" cellpadding="0"
		cellspacing="0">
		<tr>
			<td width="4"><img src="images/left011.gif" width="4"
				height="33" /></td>
			<td background="images/left022.GIF">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td>我的文章列表</td>
					<td>&nbsp;</td>
				</tr>
			</table>
			</td>
			<td width="4"><img src="images/left033.gif" width="4"
				height="33" /></td>
		</tr>
	</table>
	<s:iterator value="myArticles" id="article" status="st">
		<table width="100%" height="56" border="0" align="center"
			cellpadding="0" cellspacing="0">
			<tr>
				<td>
				<table width="100%" height="62" border="0" cellpadding="0"
					cellspacing="0">
					<tr>
						<td class="huise1"><s:a
							action="articleAction_querySingleArticle" target="_blank"
							cssClass="daohangh">
							<s:property value="#article.title" />
							<s:param name="article.articleId" value="#article.articleId"></s:param>
						</s:a></td>
					</tr>
					<tr>
						<td class="huise1">
						<div><a href="/known/public_html/question/thread-2"
							target="_blank"></a> <s:property value="#article.subContent" /></div>
						<div></div>
						</td>
					</tr>
					<tr>
						<td class="huise1"><span class="henhong">发表日期</span> <s:date
							name="article.emitTime" format="yyyy-MM-dd hh:mm:ss" />
						&nbsp;&nbsp;<s:a action="articleAction_querySingleArticle"
							cssClass="huise">查看详细>>
						<s:param name="article.articleId" value="#article.articleId"></s:param>
						</s:a></td>
					</tr>
				</table>
				</td>
			</tr>
		</table>
	</s:iterator>
	<table width="100%" height="26" border="0" align="center"
		cellpadding="0" cellspacing="0">
		<!-- <tr>
		<td width="17%" class="huise1">每页 20 条/共查找到 2 条</td>
		<td width="83%" class="huise1">
		<table width="19" height="18" border="0" cellpadding="0"
			cellspacing="0" bgcolor="#006699">
			<tr>
				<td align="center" class="danhuang">1</td>
			</tr>
		</table>
		</td>
	</tr> -->
	</table>
	<br />
	<!-- 为分页定制的url，支持传参数 -->
	<s:url id="pageAction" includeContext="false"
		action="articleAction_queryAllMyArticles" namespace="/">
	</s:url>
	<!-- 分页 -->
	<s:include value="/WEB-INF/jsp/pageUtil.jsp"></s:include>
	<table width="100%" height="26" border="0" align="center"
		cellpadding="0" cellspacing="0">
		<tr>
			<td height="51" background="images/end.gif" class="huise1">
			<table width="100%" border="0" align="center" cellpadding="0"
				cellspacing="0">
				<tr>
					<td class="henhong">关于我们 | 广告招商 | 举报中心 | 联系方式 | 客户服务 | 会员注册 <br />
					Powered by mingrisoft.com</td>
					<td align="right" class="henhong">E-mail：mingrisoft@mingrisoft.com
					&nbsp;&nbsp;电话：400-676-1066 &nbsp;&nbsp;吉ICP备07500273号<br />
					Copyright &nbsp;&copy;吉林省明日科技有限公司 1999-2009, All Rights Reserved</td>
				</tr>
			</table>
			</td>
		</tr>
	</table>
</body>
<script language="JavaScript" type="text/javascript" src="js/search.js"></script>
<script language="JavaScript" type="text/javascript">
     var data = new Array();// 存放路径对象
     data.push(forum);
     data.push(myArticles);
     new PathUtil(data)
  </script>
</html>
