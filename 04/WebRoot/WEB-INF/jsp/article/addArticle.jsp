<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>明日知道-国内领先的IT技术搜素引擎</title>
<link href="css/css.css" rel="stylesheet" type="text/css" />
<style type="text/css">
.huise {
	COLOR: #666666;
}
</style>
<SCRIPT type="text/javascript" src="js/jquery.js"></SCRIPT>
<SCRIPT type="text/javascript">
function addArticle1() {
    if (!$('#title').val()) {
       alert('请输入标题');
       return;
    }
    if (!$('#type').val()) {
       alert('请选择文章类型');
       return;
     }
    if (!$('#content').val()) {
       alert('请输入文章内容');
       return;
    }
	addArticleForm.submit();
}
</SCRIPT>
</head>
<body style="padding: 0px 30px 0px 30px;">
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
					<td style="">添加文章</td>
					<td>&nbsp;</td>
				</tr>
			</table>
			</td>
			<td width="4"><img src="images/left033.gif" width="4"
				height="33" /></td>
		</tr>
	</table>
	<div style="margin-left: 20px;">
	<form action="articleAction_addArticle" method="post"
		id="addArticleForm">
	<table>
		<tr>
			<td class="huise">文章标题：</td>
			<td><input typoe="text" name="article.title" id="title"></td>
		</tr>
		<tr>
			<td class="huise">所属类型：</td>
			<td><select name="article.articleTypeName" id="type">
				<option value="">请选择</option>
				<option value="Visual Basic">Visual Basic</option>
				<option value="Visual C++">Visual C++</option>
				<option value="Java">Java</option>
				<option value="Java web">Java web</option>
				<option value="C#">C#</option>
				<option value="ASP.NET">ASP.NET</option>
				<option value="PHP">PHP</option>
				<option value="ASP">ASP</option>
				<option value="其它">其它</option>
			</select></td>
		</tr>
		<tr>
			<td class="huise">文章内容：</td>
			<td><textarea name="article.content" cols="80" rows="10"
				id="content"></textarea></td>
		</tr>
	</table>
	<p align="center"><input type="button" value="发表文章"
		onclick="addArticle1()" /></p>
	</form>
	</div>
	<table width="100%" height="26" border="0" align="center"
		cellpadding="0" cellspacing="0">
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
	<script language="JavaScript" type="text/javascript" src="js/search.js"></script>
	<script language="JavaScript" type="text/javascript">
     var data = new Array();// 存放路径对象
     data.push(forum);
     data.push(addArticle);
     new PathUtil(data)
  </script>
</body>