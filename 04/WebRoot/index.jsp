<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>明日论坛-国内领先的IT技术搜素引擎</title>
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
-->
</style>
<link href="css/css.css" rel="stylesheet" type="text/css" />
<script type="text/JavaScript" src="js/jquery.js"></script>
<script type="text/JavaScript" src="js/articleTypes.js"></script>
<script type="text/JavaScript" src="js/index.js"></script>
</head>

<body>
<table width="1002" height="610" border="0" align="center"
	cellpadding="0" cellspacing="0">
	<tr>
		<td align="center"><s:if
			test="{#session.currUser.userName!=null}">
			<table width="97%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td height="50" align="right" valign="top"><span
						class="henhong">欢迎您，<s:property
						value="#session.currUser.userName" /></span><br />
					<span class="henhong"><s:a action="articleAction_forum">进入论坛</s:a></td>
				</tr>
			</table>
		</s:if> <s:else>
			<table width="97%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td height="50" align="right" valign="top"><span class="hong"><a
						href="userAction_toLoginPage.action" class="hong">登录</a> </span><span
						class="henhong">|</span><span class="hong"> <a
						href="userAction_register.action" class="hong">注册</a></span><br />
					<span class="henhong"><s:a action="articleAction_forum">进入论坛</s:a></td>
				</tr>
			</table>
		</s:else>
		<table width="676" height="222" border="0" cellpadding="0"
			cellspacing="0">
			<tr>
				<td height="100" align="center"><img src="images/logo.gif"
					width="226" height="62" /></td>
			</tr>
			<tr>
				<td>
				<table width="100" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td height="35">
						<table id="__01" width="732" height="35" border="0"
							cellpadding="0" cellspacing="0">
							<tr>
								<td><img src="images/top_01.gif" width="19" height="35"
									alt="" /></td>
								<td id="articleTypeDiv"></td>
								<td><img src="images/top_10.gif" width="17" height="35"
									alt="" /></td>
							</tr>
						</table>
						</td>
					</tr>
					<tr>
						<td height="70" background="images/bg.gif"><s:form
							action="articleAction_doSearch" method="post" id="doSearchForm">
							<table width="480" border="0" align="center" cellpadding="0"
								cellspacing="0">
								<s:hidden name="article.articleTypeName" id="articleTypeName"></s:hidden>
								<tr>
									<td width="378" height="35">
									<table width="359" height="35" border="0" cellpadding="0"
										cellspacing="0">
										<tr>
											<td align="center"><input type="text" id="searchStr"
												name="searchStr" style="width: 350px; height: 20px;" /></td>
										</tr>
									</table>
									</td>
									<td width="113"><img src="images/so.GIF" width="109"
										height="35" style="cursor: hand;" onclick="doSearch()" /></td>
								</tr>
							</table>

							<table width="480" border="0" align="center" cellpadding="0"
								cellspacing="0">
								<tr>
									<td><span class="danhuang02">明日论坛热门搜索：</span> <span
										class="cubai"><a href="#" onclick="seartchHot('c#')">c#</a>
									&nbsp; &nbsp;<a href="#" onclick="seartchHot('java编程词典')">java编程词典</a>
									&nbsp; &nbsp;<a href="#" onclick="seartchHot('java web')">java
									web</a> &nbsp; &nbsp;<a href="#">java</a> &nbsp; &nbsp;<a href="#"
										onclick="seartchHot('java从入门到精通')">java从入门到精通</a> &nbsp;</span></td>
								</tr>
							</table>
						</s:form></td>
					</tr>
				</table>
				</td>
			</tr>
			<tr>
				<td align="center">
				<p><a href="http://www.mingribook.com" target="_blank"
					class="hong"><br />
				<br />
				明日图书</a> <span class="henhong">|</span> <a
					href="http://www.mingrisoft.com" target="_blank" class="hong">明日软件</a>
				<span class="henhong">|</span> <a href="http://www.mrbccd.com"
					target="_blank" class="hong">编程词典</a></p>
				<p class="huise1">技术服务热线：400-675-1066 传真：0431-84939777
				企业邮箱：mingrisoft@mingrisoft.com<br />
				公司地址：吉林省长春市二道区东盛大街89号亚泰广场C座 吉ICP备07500273号<br />
				Copyright&copy;www.mingribook.com All Rights Reserved!</p>
				<div></div>
				</td>
			</tr>
		</table>
		</td>
	</tr>
</table>
</body>
</html>
