<%@ page contentType="text/html; charset=gb2312" language="java"%>
<%
if(session.getAttribute("username")!=null || session.getAttribute("username")!=""){
%>
<script language="javascript">
function check(form){
	if(form.pwd0.value==""){
		alert("请输入原密码!");form.pwd0.focus();return false;
	}
	if(form.pwd.value==""){
		alert("请输入新密码!");form.pwd.focus();return false;
	}
	if(form.pwd1.value==""){
		alert("请确认新密码!");form.pwd1.focus();return false;
	}
	if(form.pwd.value!=form.pwd1.value){
		alert("您两次输入的用户密码不一致，请重新输入!");form.pwd.focus();return false;
	}
	if(form.pwd0.value!=form.hpwd.value){
		alert("您输入的原密码错误!");form.pwd0.focus();return false;
	}
	form.submit();
}
</script>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>物资管理系统</title>
<link rel="stylesheet" href="Css/style.css">
</head>

<body>
<table width="757" height="174" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="133" align="center" valign="top"><%@ include file="top.jsp"%></td>
  </tr>
  <tr>
    <td>
      <table width="100%" height="26" border="0" cellpadding="0" cellspacing="0" background="images/area_bg.jpg">
        <tr>
          <td width="26%" align="center" class='word_white'>当前登录用户：<%=session.getAttribute("username")%></td>
          <td width="4%">&nbsp;</td>
          <td width="70%" valign="bottom">当前位置： 修改密码 &gt;&gt;&gt;</td>
        </tr>
      </table>
<table width="100%" height="385" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
      <tr>
        <td width="5" valign="top" background="images/left.gif">&nbsp;</td>
        <td align="center" valign="top">&nbsp;
		<form name="form1" method="post" action="user.do?action=pwsModify" onSubmit="return check(form1)">
        <table width="96%" height="160" border="0" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF" bordercolorlight="#DDDDDA" bordercolordark="#FFFFFF">
          <tr>
            <td width="31%" align="center">用户名称：<input name="id" type="hidden" id="id" size="10" value="<%=user_id%>"></td>
            <td width="69%" align="left"><input name="name" type="text" id="name" size="30" value="<%=user_name%>"></td>
            </tr>
          <tr>
            <td width="31%" align="center">原&nbsp;密&nbsp;码：</td>
            <td align="left"><input name="pwd0" type="password" id="pwd0" size="30"></td>
          </tr>
         <tr>
            <td align="center">新&nbsp;密&nbsp;码：
              <input name="hpwd" type="hidden" id="hpwd" size="10" value="<%=user_pwd%>"></td>
            <td align="left"><input name="pwd" type="password" id="pwd" size="30"></td>
            </tr>
         <tr>
           <td align="center">确认密码：</td>
           <td align="left"><input name="pwd1" type="password" id="pwd1" size="30"></td>
         </tr>
         <tr>
           <td>&nbsp;</td>
           <td>
             <input name="Submit" type="submit" class="btn_grey" value="保存">
&nbsp;
<input name="Submit2" type="reset" class="btn_grey" value="重置">
&nbsp;
<input name="Submit3" type="button" class="btn_grey" value="返回" onClick="history.back()"></td>
         </tr>
        </table>
		</form>
		</td>
        <td width="10" valign="top" background="images/right.jpg">&nbsp;</td>
      </tr>
    </table>
    </td>
  </tr>
  <tr>
    <td height="55" valign="top" background="images/bottom.jpg"><%@ include file="copyright.jsp"%></td>
  </tr>
</table>
</body>
</html>
<%}else{
response.sendRedirect("login.jsp");
} %>
