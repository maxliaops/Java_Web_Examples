<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>登录―明日论坛</title>
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
<table width="100%" height="610%" border="0" cellpadding="0"
	cellspacing="0">
	<tr>
		<td height="28" valign="top" background="images/loginbg.gif">
		<table width="676" height="284" border="0" align="center"
			cellpadding="0" cellspacing="0">
			<tr>
				<td height="84" align="left">
				<table width="237" height="39" border="0" cellpadding="0"
					cellspacing="0">
					<tr>
						<td align="right" bgcolor="#FFFFFF"><img
							src="images/logo.gif" width="226" height="62" /></td>
					</tr>
				</table>
				</td>
			</tr>
			<tr>
				<td>
				<table id="__01" width="785" height="125" border="0" cellpadding="0"
					cellspacing="0">
					<tr>
						<td height="30"><img src="images/login1_01.gif" width="785"
							height="30" alt="" /></td>
					</tr>
					<tr>
						<td height="18" background="images/login1_02.gif">
						<table width="576" border="0" align="center" cellpadding="0"
							cellspacing="0">
							<tr>
								<s:property value="msg" />
								<br />
								你可以进行以下操作：
								<br />
								<a href="index.jsp">返回首页</a>
								<br />
								<a href="articleAction_forum.action">进入论坛</a>
								<br />
								<a href="userAction_toUpdatePage.action">维护个人信息</a>
								<br />
							</tr>
						</table>
						</td>
					</tr>
					<tr>
						<td height="39"><img src="images/login1_03.gif" width="785"
							height="39" alt="" /></td>
					</tr>
					<tr>
						<td height="38" background="images/login1_04.gif">
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span
							class="huise1">(C) 1999-2010吉林省明日科技有限公司</span></td>
					</tr>
				</table>
				</td>
			</tr>
			<tr>
				<td align="center">&nbsp;</td>
			</tr>
		</table>
		</td>
	</tr>
</table>
</body>
</html>
