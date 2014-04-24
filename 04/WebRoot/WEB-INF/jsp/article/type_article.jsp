<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>明日知道-国内领先的IT技术搜素引擎</title>
<link href="css/css.css" rel="stylesheet" type="text/css" />
<SCRIPT src="js/jquery.js" type=text/javascript></SCRIPT>
<SCRIPT src="js/article_type.js" type=text/javascript></SCRIPT>
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

a:link {
	text-decoration: none;
}

a:visited {
	text-decoration: none;
}

a:hover {
	text-decoration: none;
}

a:active {
	text-decoration: none;
}
-->
</style>
</head>

<body>
<table width="95%" height="56" border="0" align="center">
	<tr>
		<td>
		<table width="100%" height="92" align="center" class="table">
			<tbody>
				<tr>
					<td class="left" valign="top">
					<style type="text/css">
.bbs_index_nav {
	CLEAR: both;
	WIDTH: 96%;
	LINE-HEIGHT: 25px;
	HEIGHT: 35px
}

.bbs_index_titleAlert {
	CLEAR: both;
	WIDTH: 96%;
	HEIGHT: 29px
}

.bbs_index_titleAlert .left {
	FLOAT: left;
	WIDTH: 600px;
	HEIGHT: 29px
}

.bbs_index_titleAlert .right {
	FLOAT: right;
	WIDTH: 300px;
	HEIGHT: 29px
}

.bbs_index_main {
	CLEAR: both;
	WIDTH: 100%
}

.bbs_index_main .table {
	CLEAR: both;
	WIDTH: 100%;
	BORDER-COLLAPSE: collapse
}

.bbs_index_main .table .left {
	WIDTH: 100%
}

.bbs_index_main .table .left .type {
	CLEAR: both;
	BORDER-RIGHT: #a6ce6c 1px solid;
	BORDER-TOP: #a6ce6c 1px solid;
	MARGIN: 0px;
	BORDER-LEFT: #a6ce6c 1px solid;
	BACKGROUND-COLOR: #fbfff4
}

.bbs_index_main .table .left .type .table {
	CLEAR: both;
	DISPLAY: block;
	WIDTH: 100%;
	BORDER-COLLAPSE: collapse
}

.bbs_index_main .table .left .type .title {
	CLEAR: both;
	BORDER-RIGHT: #ffffff 1px solid;
	BORDER-TOP: #ffffff 1px solid;
	BACKGROUND: url(/known/public_html/img/bbs_title_bg1.gif);
	MARGIN: 0px;
	BORDER-LEFT: #ffffff 1px solid;
	BORDER-BOTTOM: #ffffff 1px solid;
	HEIGHT: 30px
}

.bbs_index_main .table .left .type .title .left {
	FLOAT: left;
	WIDTH: 95%;
	COLOR: #ffffff;
	LINE-HEIGHT: 30px;
	HEIGHT: 30px;
	TEXT-ALIGN: left
}

.bbs_index_main .table .left .type .title .right {
	FONT-WEIGHT: bold;
	FONT-SIZE: 16px;
	FLOAT: right;
	WIDTH: 3%;
	CURSOR: pointer;
	COLOR: #ffffff;
	LINE-HEIGHT: 30px;
	HEIGHT: 30px;
	TEXT-ALIGN: left
}

.bbs_index_main .table .left .type .table .titlePart1 {
	WIDTH: 10%;
	BORDER-BOTTOM: #9db3c5 1px solid;
	HEIGHT: 16px
}

.bbs_index_main .table .left .type .table .titlePart2 {
	WIDTH: 50%;
	COLOR: #006699;
	BORDER-BOTTOM: #9db3c5 1px solid;
	HEIGHT: 16px
}

.bbs_index_main .table .left .type .table .titlePart3 {
	WIDTH: 13%;
	COLOR: #006699;
	BORDER-BOTTOM: #9db3c5 1px solid;
	HEIGHT: 16px;
	TEXT-ALIGN: center
}

.bbs_index_main .table .left .type .table .titlePart4 {
	WIDTH: 27%;
	COLOR: #006699;
	BORDER-BOTTOM: #9db3c5 1px solid;
	HEIGHT: 16px;
	TEXT-ALIGN: center
}

.bbs_index_main .table .left .type .table .contentPart1 {
	WIDTH: 10%;
	BORDER-BOTTOM: #9db3c5 1px solid;
	HEIGHT: 60px;
	TEXT-ALIGN: center
}

.bbs_index_main .table .left .type .table .contentPart2 {
	WIDTH: 50%;
	LINE-HEIGHT: 16px;
	BORDER-BOTTOM: #9db3c5 1px solid;
	HEIGHT: 60px
}

.bbs_index_main .table .left .type .table .contentPart3 {
	WIDTH: 13%;
	BORDER-BOTTOM: #9db3c5 1px solid;
	HEIGHT: 60px;
	TEXT-ALIGN: center
}

.bbs_index_main .table .left .type .table .contentPart4 {
	WIDTH: 27%;
	LINE-HEIGHT: 20px;
	BORDER-BOTTOM: #9db3c5 1px solid;
	HEIGHT: 60px
}

.bbs_index_nav .li1 {
	FONT-WEIGHT: bold;
	FLOAT: left;
	WIDTH: 500px;
	LINE-HEIGHT: 35px;
	HEIGHT: 35px;
	TEXT-ALIGN: left
}

.bbs_index_nav .li2 {
	FLOAT: right;
	WIDTH: 200px;
	HEIGHT: 35px
}

.bbs_index_titleAlert .left .li1 {
	FONT-WEIGHT: bold;
	BACKGROUND: url(/known/public_html/img/bbs_btn_bg1.gif);
	FLOAT: left;
	WIDTH: 73px;
	CURSOR: pointer;
	LINE-HEIGHT: 29px;
	HEIGHT: 29px
}

.bbs_index_titleAlert .left .li2 {
	FONT-SIZE: 13px;
	FLOAT: right;
	WIDTH: 500px;
	LINE-HEIGHT: 29px;
	HEIGHT: 29px;
	TEXT-ALIGN: left
}

.bbs_index_titleAlert .right .li1 {
	FLOAT: left;
	WIDTH: 210px;
	LINE-HEIGHT: 29px;
	HEIGHT: 29px
}

.bbs_index_titleAlert .right .li2 {
	FONT-SIZE: 13px;
	FLOAT: left;
	WIDTH: 72px;
	LINE-HEIGHT: 29px;
	HEIGHT: 29px;
	TEXT-ALIGN: left
}

.bbs_index_titleAlert .right .li3 {
	FLOAT: right;
	WIDTH: 18px;
	LINE-HEIGHT: 29px;
	POSITION: relative;
	HEIGHT: 29px
}
</style>
					<s:include value="/WEB-INF/jsp/article/search.jsp"></s:include>
					<table width="100%" border="0" align="center" cellpadding="0"
						cellspacing="0">
						<tr>
							<td width="4"><img src="images/left011.gif" width="4"
								height="33" /></td>
							<td background="images/left022.GIF">
							<table width="100%" border="0" cellspacing="0" cellpadding="0">
								<tr>
									<td class="danhuang">&nbsp;&nbsp;<s:property
										value="articleType" /></td>
									<td>&nbsp;</td>
								</tr>
							</table>
							</td>
							<td width="4"><img src="images/left033.gif" width="4"
								height="33" /></td>
						</tr>
					</table>
					<div class="bbs_index_main">
					<table width="100%" class="table">
						<tbody>
							<tr>
								<td class="left" valign="top">
								<div class="type">
								<table width="100%" class="table">
									<tbody>
										<tr class="titlePart">
											<td width="2%" class="titlePart1"></td>
											<td width="32%" align="left" class="titlePart2">标题</td>
											<td width="16%" align="left" class="titlePart3">作者</td>
											<td width="11%" align="left" class="titlePart3">回答/查看</td>
											<td width="39%" align="left" class="titlePart4">最后回复</td>
										</tr>
										<s:iterator value="searchArticles" id="article" status="st">
											<tr id="title_row_3"
												onmouseover="changeRowColor('title_row_3', 0)"
												onmouseout="changeRowColor('title_row_3', 1)">
												<td class="contentPart1"><img
													src="images/mark_title_simple.gif" width="24" height="24" /></td>
												<td class="contentPart2"><s:a
													action="articleAction_querySingleArticle" cssClass="hong">
													<s:property value="#article.title" />
													<s:param name="article.articleId"
														value="#article.articleId"></s:param>
												</s:a></td>
												<td class="contentPart3"><span class="contentPart4">
												<s:a action="articleAction_queryArticlesByUserOfArticle"
													cssClass="huise">
													<s:property value="#article.user.userName" />
													<s:param name="article.articleId"
														value="#article.articleId"></s:param>
													<s:param name="user.userName"
														value="#article.user.userName"></s:param>
												</s:a><br />
												</font></span><font style="COLOR: #0099cc"><s:date
													name="#article.emitTime" format="yyyy-MM-dd hh:mm:ss" /></font></td>
												<td class="contentPart3"><font class="banhui"><s:property
													value="#article.replyCount" /></font>/<span class="huise1"><s:property
													value="#article.scanCount" /></span></td>
												<s:if test="{#article.lastReply!=null}">
													<td class="contentPart4"><span class="contentPart3">
													<s:a action="articleAction_queryArticlesByUserOfReply"
														csscCass="huise">
														<s:property value="#article.lastReply.user.userName" />
														<s:param name="reply.replyId"
															value="#article.lastReply.replyId"></s:param>
														<s:param name="user.userName"
															value="#article.lastReply.user.userName"></s:param>
													</s:a><br />
													<font style="COLOR: #0099cc"><s:date
														name="#article.lastReply.replyTime"
														format="yyyy-MM-dd hh:mm:ss" /></font></span></td>
												</s:if>
												<s:else>
													<td class="contentPart4"><span class="contentPart3">暂无回复</span></td>
												</s:else>
											</tr>
										</s:iterator>
									</tbody>
								</table>
								</div>
								</td>
							</tr>
						</tbody>
					</table>
					</div>
					</td>
				</tr>
			</tbody>
		</table>
		</td>
	</tr>
</table>
<br />
<table width="95%" height="26" border="0" align="center" cellpadding="0"
	cellspacing="0">
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
    $(function(){
		    var data = new Array();// 存放路径对象
		     data.push(articleType);
		     data.push(articlesOfType.init('<s:property value="articleType" escape="false"/>'));
		     new PathUtil(data)
        });
  </script>
</html>
