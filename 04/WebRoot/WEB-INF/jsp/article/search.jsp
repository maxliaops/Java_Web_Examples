<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>明日论坛-国内领先的IT技术搜素引擎</title>
<head>
</head>
<script type="text/javascript" src="js/search.js"></script>
<script type="text/javascript" src="js/jquery.js"></script>
<body>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td height="26" background="images/bbs_header_nav.gif" class="huise1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;明日软件
		| 明日图书 | 编程词典 | 网络学院 | 明日书店</td>
	</tr>
</table>
<br />
<s:form action="articleAction_doSearch" method="post" id="doSearchForm">
	<div><span><img src="images/logo.gif" /></span> <span><input
		type="text" name="searchStr" id="searchStr"
		style="width: 350px; margin-bottom: 10px;" /></span> <span><img
		src="images/so.GIF" width="109" height="35"
		style="margin-left: 10px; cursor: hand;" onclick="doSearch()" /></span></div>
</s:form>
<br />
<table width="100%" border="0" align="center" cellpadding="0"
	cellspacing="0">
	<tr>
		<td width="4"><img src="images/left01.gif" width="4" height="33" /></td>
		<td background="images/left02.gif">
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
			<tr>
				<s:if test="#session.currUser.userName!=null">
					<td><span class="hong">&nbsp;&nbsp;<a class="hong">欢迎您，<s:property
						value="#session.currUser.userName" /></a></span> <span class="hong">&nbsp;&nbsp;<a
						class="hong" href="userAction_exitSys">退出</a></span></td>
				</s:if>
				<s:else>
					<td><span class="hong">&nbsp;&nbsp; <s:a
						action="userAction_toLoginPage" cssClass="hong">登录</s:a> </span> <span
						class="henhong">|</span><span cssClass="hong"> <s:a
						action="userAction_register" cssClass="hong">注册</s:a></span></td>
				</s:else>
				<td align="right" class="hong"><a href="#" class="hong">软件</a>
				&nbsp;&nbsp;<span class="henhong">|</span>&nbsp;&nbsp;&nbsp;<a
					href="#" class="hong">图书</a> &nbsp;&nbsp;<span class="henhong">|</span>&nbsp;&nbsp;&nbsp;<a
					href="#" class="hong">词典</a> &nbsp;&nbsp;<span class="henhong">|</span>&nbsp;&nbsp;&nbsp;<a
					href="#" class="hong">学院</a> &nbsp;&nbsp;<span class="henhong">|</span>&nbsp;&nbsp;&nbsp;<a
					href="#" class="hong">书店</a>&nbsp;</td>
			</tr>
		</table>
		</td>
		<td width="4"><img src="images/left03.gif" width="4" height="33" /></td>
	</tr>
</table>
<br />
<div id="path"><span class="huise"> <img
	src="images/home32.gif" width="25" height="25" /> <s:a
	action="homeAction_index" cssClass="hong">明日论坛 </s:a> </span></div>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<s:if test="{#session.currUser.userName!=null}">
			<td align="left">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td align="right"><s:a action="articleAction_toAddArticlePage">
						<img src="images/grxx.gif" width="129" height="39" border="0" />
					</s:a> <s:a action="articleAction_queryAllMyArticles">
						<img src="images/wz.gif" width="129" height="39" border="0" />
					</s:a> <s:a action="userAction_toUpdatePage">
						<img src="images/wh.gif" width="129" height="39" border="0" />
					</s:a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
				</tr>
			</table>
			</td>
		</s:if>
		<s:else>
			<td height="24"><span class="huise1">您可以</span><span
				class="henhong"><s:a action="userAction_register"
				target="_blank" cssClass="chengse">注册</s:a></span><span class="huise1">一个账户，并以此</span><span
				class="henhong"><s:a action="userAction_toLoginPage"
				target="_blank" cssClass="chengse">登录</s:a></span><span class="huise1">，以便参与本站更多活动，与大家交流。</span></td>
		</s:else>
	</tr>
</table>
</body>
<script type="text/javascript" src="js/search.js"></script>