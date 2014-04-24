<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>登录―明日论坛</title>
<script type="text/JavaScript" src="js/jquery.js"></script>
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

	function login() {
		if (!$.trim($('#userName').val())) {
           alert('用户名不能为空');
           return;
	    }
		if (!$.trim($('#password').val())) {
           alert('密码不能为空');
           return;
	    }
		var validate = $('#validate').text();
		var validate_input = $('#validate_input').val();
        if (!$.trim(validate_input)) {
           alert('验证码不能为空');
        }
		if (validate != validate_input) {
          alert('验证码不对,请重新输入');
          return;
		}
		loginForm.submit();
	}

	function setValidateCode() {
		var s = '';
		var colors = new Array('Red', "Green", 'Gray', 'Blue', 'Maroon',
				'Fuchsia', 'Lime', 'Olime', 'Silver', '#SDFD5W');
		for ( var i = 0; i < 5; i++) {
			var num = Math.floor(Math.random() * 10);
			s += num ;
		}
		$('#validate').text(s);
	}

	window.onload = function() {
		setValidateCode();
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
<form action="userAction_login.action" method="post" id="loginForm">
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
						<table width="776" border="0" align="center" cellpadding="0"
							cellspacing="0">
							<tr>
								<td width="401" align="center"><img src="images/login.jpg"
									width="368" height="236" /></td>
								<td width="375">
								<table width="332" height="198" border="0" cellpadding="0"
									cellspacing="0">
									<tr>
										<td height="30" valign="top" class="henhong">
										<table width="332" height="40" border="0" cellpadding="0"
											cellspacing="0">
											<tr>
												<td valign="top" style="padding-left: 24px;">用户名： <input
													name="user.userName" type="text" size="30"
													style="width: 200px;" id="userName" /></td>
											</tr>
										</table>
										<table width="332" height="40" border="0" cellpadding="0"
											cellspacing="0">
											<tr>
												<td valign="top" style="padding-left: 24px;">密
												&nbsp;&nbsp;码： <input name="user.password" type="password"
													size="30" id="password" /></td>
											</tr>
										</table>
										<table width="332" height="40" border="0" cellpadding="0"
											cellspacing="0">
											<tr>
												<td valign="top">输入验证码： <input id="validate_input"
													type="text" size="30" style="width: 200px;" /></td>
											</tr>
										</table>
										<table width="332" height="40" border="0" cellpadding="0"
											cellspacing="0">
											<tr>
												<td width="191" valign="top" style="padding-left: 24px;">验证码：&nbsp;&nbsp;<span
													id="validate"></span></td>
												<td width="191" valign="top" class="chengse"
													style="cursor: hand;" onclick=setValidateCode();>看不清，换一张</td>
											</tr>
										</table>
										<table width="320" height="34" border="0" align="center"
											cellpadding="0" cellspacing="0">
											<tr>
												<td><img onclick="login()" src="images/loginb.gif"
													width="127" height="38" style="cursor: hand;" /></td>
											</tr>
										</table>
										<table width="320" height="34" border="0" align="center"
											cellpadding="0" cellspacing="0">
											<tr>
												<td><a href="userAction_register.action"
													class="shenlvcu">不是会员，立即注册</a></td>
											</tr>
										</table>
										</td>
									</tr>
								</table>
								</td>
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
</form>
</body>
</html>
