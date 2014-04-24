<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>明日论坛-国内领先的IT技术搜素引擎</title>
<SCRIPT src="js/jquery.js" type=text/javascript></SCRIPT>
<SCRIPT src="js/reply.js" type=text/javascript></SCRIPT>
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
	function addReply() {
		// 序列化回复表单数据
		var data = $('#addReplyForm').serialize();
		// 校验回复内容
		var replyContent = $.trim($('#replyContent').val());
		if (!replyContent) {
			alert('回复内容不能为空');
			return;
		}
		// 异步提交数据
		$.ajax( {
			type : 'POST',
			url : 'replyAction_addReply',
			processData : true,
			datatype : 'json',
			data : data,
			success : function(result) {
				// 追加回复信息
			    var json = eval('(' + result + ')');
				if (json.success == true) {
					var template = $('#replyItemTemplate').html().replace(
							'userName', json.userName).replace('replyTime',
							json.replyTime).replace('content', json.content);
					$('#replySet')[0].innerHTML = template
							+ $('#replySet')[0].innerHTML;
					if ('${session.currUser.userId}' == '<s:property value="article.user.userId"/>') {
                       var replyCount = new Number($('#replyCount').text());
                       $('#replyCount').text(replyCount + 1);
					}
					addReplyForm.reset();
				} else {
					alert(json.msg);
				}
			}
		});
	}
		
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

<body style="padding: 5px 30px 0px 30px;">
<s:include value="/WEB-INF/jsp/article/search.jsp"></s:include>
<table width="100%" border="0" align="center" cellpadding="0"
	cellspacing="0">
	<tr>
		<td width="4"><img src="images/left011.gif" width="4" height="33" /></td>
		<td background="images/left022.GIF">
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td class="danhuang">&nbsp;&nbsp;<s:property
					value="article.title" /></td>
				<td>&nbsp;</td>
			</tr>
		</table>
		</td>
		<td width="4"><img src="images/left033.gif" width="4" height="33" /></td>
	</tr>
</table>
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
<table width="100%" border="0" cellpadding="1" cellspacing="1"
	bgcolor="#527800">
	<tr>
		<td height="100" bgcolor="#FFFFFF">
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td width="19%" rowspan="3" bgcolor="#F2F7E6">
				<table width="140" height="44" border="0" align="center"
					cellpadding="0" cellspacing="0">
					<tr>
						<td width="160"><img src="images/unface.gif" width="120"
							height="120" /></td>
					</tr>
				</table>

				<table width="140" height="44" border="0" align="center"
					cellpadding="0" cellspacing="0">
					<tr>
						<td width="160" class="huise1">用户：<s:property
							value="article.user.userName" /><br />
						主题：<span class="chengse"><s:property
							value="article.user.myArticleCount" /></span> 篇<br />
						回答：<span class="chengse" id="replyCount"><s:property
							value="article.user.myReplyCount" /></span> 个<br />
						注册：<span class="henhong"><s:date
							name="article.user.registerTime" format="yyyy-MM-dd hh:mm:ss" /></span></td>
					</tr>
				</table>
				</td>
				<td width="81%" bgcolor="#EEEEEE" class="huise1">
				<table width="197" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td width="24" align="center"><img src="images/mark_time.gif"
							width="16" height="16" /></td>
						<td width="173">提出于：<s:date name="article.emitTime"
							format="yyyy-MM-dd hh:mm:ss" /></td>
					</tr>
				</table>
				</td>
			</tr>
			<tr>
				<td height="200" valign="top"><br />
				<table width="95%" border="0" align="center" cellpadding="0"
					cellspacing="0">
					<tr>
						<td class="huise1">
						<div style="width: 50"><s:property value="article.content" /></div>
						</td>
					</tr>
				</table>
				</td>
			</tr>
			<s:set id="articleUserId" value="%{article.user.userId}"></s:set>
			<tr>
				<td height="20" bgcolor="#EEEEEE"><a href="#">&nbsp;&nbsp;&nbsp;&nbsp;</a>
				<s:if test="test=#session.currUser.userId == article.user.userId">
					<s:a action="articleAction_querySingleArticleForUpdate"
						cssClass="hong">
						<s:param name="article.articleId" value="article.articleId" />
											修改</s:a>
					<s:a action="articleAction_deleteArticle" cssClass="hong">
						<s:param name="article.articleId" value="article.articleId"></s:param>
												删除
											</s:a></td>
				</s:if>
			</tr>
		</table>
		</td>
	</tr>
</table>
<br />
<table width="100%" border="0" align="center" cellpadding="0"
	cellspacing="0">
	<tr>
		<td width="4"><img src="images/left011.gif" width="4" height="33" /></td>
		<td background="images/left022.GIF">
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td class="danhuang">&nbsp;&nbsp;问题回答</td>
				<td>&nbsp;</td>
			</tr>
		</table>
		</td>
		<td width="4"><img src="images/left033.gif" width="4" height="33" /></td>
	</tr>
</table>
<!--单条回复信息模板 -->
<div id="replyItemTemplate" style="display: none;">
<table width="100%" border="1" cellpadding="1" cellspacing="1"
	bordercolor="#FFFFFF" bgcolor="#527800">
	<tr>
		<td height="20" bgcolor="#FFFFFF">userName于replyTime回复到：<br />
		<div style="font-size: 6">content</div>
		</td>

	</tr>
</table>
</div>
<div id="replySet"><!-- 回复信息集合 --> <s:iterator
	value="article.replies" status="st" id="reply">
	<table width="100%" border="1" cellpadding="1" cellspacing="1"
		bordercolor="#FFFFFF" bgcolor="#527800">
		<tr>
			<td height="20" bgcolor="#FFFFFF"><s:property
				value="#reply.user.userName" />于<s:date name="#reply.replyTime"
				format="yyyy-MM-dd hh:mm:ss" />回复到： <br />
			<div><s:property value="#reply.content" /></div>
			</td>
		</tr>
	</table>
</s:iterator></div>
<table width="100%" border="1" cellpadding="1" cellspacing="1"
	bordercolor="#FFFFFF" bgcolor="#527800">
	<tr>
		<td height="20" bgcolor="#FFFFFF">
		<form action="replyAction_addReply.action" method="post"
			id="addReplyForm">
		<table width="90%" border="0" align="center" cellpadding="0"
			cellspacing="0">
			<s:hidden name="reply.article.articleId" value="%{article.articleId}"></s:hidden>
			<s:hidden name="reply.user.userId" value="%{article.user.userId}"></s:hidden>
			<tr>
				<td><span class="henhong">回复主题：</span><br />
				<textarea rows="6" cols="90" name="reply.content" id="replyContent"></textarea>
				<br />
				<span class="huise1">请在上述文本框中输入回复主题<br />
				<a href="#" onclick="addReply()"><img src="images/ite.gif"
					width="107" height="28" border="0" /><br />
				</a></span></td>
			</tr>
		</table>
		</form>
		</td>
	</tr>
</table>
</td>
</tr>
</tbody>
</table>
</td>
</tr>
</table>
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
<script language="JavaScript" type="text/javascript" src="js/search.js"></script>
<script language="JavaScript" type="text/javascript">
    $(function(){
		    var data = new Array();// 存放路径对象
		     data.push(articleType);
		     data.push(articlesOfType.init('<s:property value="article.articleType.articleTypeName" escape="false"/>'));
		     data.push(articleOfType.init('<s:property value="article.title" escape="false"/>','<s:property value="article.articleId"/>'));
		     new PathUtil(data)
        });
  </script>

</body>
</html>
