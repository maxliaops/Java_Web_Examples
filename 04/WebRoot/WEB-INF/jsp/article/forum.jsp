<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>明日知道-国内领先的IT技术搜素引擎</title>
<link href="css/css.css" rel="stylesheet" type="text/css" />
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
</style>
</head>
<SCRIPT src="js/jquery.js" type=text/javascript></SCRIPT>
<script type="text/JavaScript">
<!--
function MM_preloadImages() { //v3.0
  var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
    var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
    if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
}
//-->
</script>
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
					<td>&nbsp;</td>
					<td>&nbsp;</td>
				</tr>
			</table>
			</td>
			<td width="4"><img src="images/left033.gif" width="4"
				height="33" /></td>
		</tr>
	</table>
	<div class="bbs_index_main">
	<table width="90%" class="table">
		<tbody>
			<tr>
				<td class="left" valign="top">
				<div class="type">
				<table width="100%" class="table">
					<tbody>
						<tr class="titlePart">
							<td class="titlePart1"></td>
							<td align="left" class="titlePart2">分类</td>
							<td align="left" class="titlePart3">问题/回复</td>
							<td align="left" class="titlePart4">最后更新</td>
						</tr>
						<s:iterator value="articleTypes" id="articleType" status="st">
							<tr id="title_row_3"
								onmouseover="changeRowColor('title_row_3', 0)"
								onmouseout="changeRowColor('title_row_3', 1);">
								<td class="contentPart1"><img src="images/topic_permit.gif"
									width="31" height="37" /></td>
								<td class="contentPart2"><strong> <s:a
									cssClass="hong" action="articleAction_findArticlesByType"
									target="_blank">
									<s:property value="#articleType.articleTypeName" />
									<s:param name="articleType"
										value="#articleType.articleTypeName"></s:param>
								</s:a> </strong> (今日：<font style="COLOR: #ff0000"><s:property
									value="#articleType.articleCountOfToday" /></font>)<br />
								<span class="huise1"><s:property
									value="#articleType.articleTypeDesc" /> </span></td>
								<td class="contentPart3"><font class="banhui"><s:property
									value="#articleType.totalArticleCount" /></font>/<span class="huise1"><s:property
									value="#articleType.totalReplyCount" /></span></td>
								<s:if test="{#articleType.lastUpdateArticle.title!=null}">
									<td class="contentPart4"><span class="huise"> <s:a
										action="articleAction_querySingleArticle" cssClass="hong">
										<s:property value="#articleType.lastUpdateArticle.title" />
										<s:param name="article.articleId"
											value="#articleType.lastUpdateArticle.articleId"></s:param>
									</s:a><br />
									</span> <s:a action="articleAction_queryArticlesByUserOfArticle"
										cssClass="huise">
										<s:property
											value="#articleType.lastUpdateArticle.user.userName" />
										<s:param name="article.articleId"
											value="#articleType.lastUpdateArticle.articleId"></s:param>
										<s:param name="user.userName"
											value="#articleType.lastUpdateArticle.user.userName"></s:param>
										<s:param name="user.userId"
											value="#articleType.lastUpdateArticle.user.userId"></s:param>
									</s:a> <span class="huise">&nbsp;</span> -&nbsp;<font class="banhui"
										style="COLOR: #0099cc"><s:date
										name="#articleType.lastUpdateArticle.emitTime" /></font></td>
								</s:if>
								<s:else>
									<td class="contentPart4">暂无文章</td>
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
	<script language="JavaScript" type="text/javascript">
	//打开关闭右侧导航
	function openCloseRightNav() {
		if ($("#rightNav").css("display") == "none") {
			$("#openCloseRightNavBtn").attr("src",
					"/known/public_html/img/wait_close.gif");
			$("#openCloseRightNavAlert").html("关闭右导航");
			$("#rightNav").slideDown(
					"normal",
					function() {
						$("#openCloseRightNavBtn").attr("src",
								"/known/public_html/img/bbs_btn_close1.gif");
					});
		} else {
			$("#openCloseRightNavBtn").attr("src",
					"/known/public_html/img/wait_open.gif");
			$("#openCloseRightNavAlert").html("展开右导航");
			$("#rightNav").slideUp(
					"normal",
					function() {
						$("#openCloseRightNavBtn").attr("src",
								"/known/public_html/img/bbs_btn_open1.gif");
					});
		}
	}
	//更改行背景色
	function changeRowColor(x, y) {
		if (y == 0) {
			$("#" + x).css("background-color", "#FFFFFF");
		} else {
			$("#" + x).css("background-color", "#fbfff4");
		}
	}
	//更改验证码的值
	function changeValidateCode() {
		$("#vcodeImg").attr(
				"src",
				"/known/public_html/common/vcode/w/60/h/22/f/1/rand/"
						+ Math.random() + "");
	}
	//更改主题选项卡
	function changeTitleTab(x, y, z) {
		$("#" + x).css("border-bottom", "1px solid #FFFFFF");
		$("#" + x).css("background-color", "#FFFFFF");
		$("#" + x + "_content").css("display", "block");

		$("#" + y).css("border-bottom", "1px solid #9DB3C5");
		$("#" + y).css("background-color", "#fbfff4");
		$("#" + y + "_content").css("display", "none");

		$("#" + z).css("border-bottom", "1px solid #9DB3C5");
		$("#" + z).css("background-color", "#fbfff4");
		$("#" + z + "_content").css("display", "none");
	}
	//显示或隐藏子类
	function showHidden(x) {
		$("#" + x).slideToggle("fast");
		if ($.trim($("#btn_" + x).html()) == "-") {
			$("#btn_" + x).html("+");
		} else {
			$("#btn_" + x).html("-");
		}
	}
</script>
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
		<table width="95%" border="0" align="center" cellpadding="0"
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
     new PathUtil(data)
  </script>
</html>
