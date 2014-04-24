<%@ page contentType="text/html;charset=gb2312" language="java"%>
<html>
<title>企业进销存登录</title>
<link href="CSS/style.css" rel="stylesheet" type="text/css">
  <meta http-equiv="Content-Type" content="text/html;charset=gb2312">
<body style="filter:progid:DXImageTransform.Microsoft.Gradient(startColorStr='#4F6D92',endColorStr='#ACCBE7',gradientType='0')">
<table width="100%" height="451" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td align="center"><table width="509" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="142"><img src="images/login_top.jpg" width="509" height="142"></td>
      </tr>
      <tr>
        <td height="159" valign="top" background="images/login_bottom.jpg"><table width="350" height="116"  border="0" cellpadding="0" cellspacing="0" background="KCM/login.gif">
  <form  name="form1" method="post" action="login.jsp" onSubmit="return check();">
  <tr>
      <td width="91">&nbsp;</td>
      <td width="59" height="46">用户名：</td>
	<td width="200"><input type="text" name="username"></td></tr>
	<tr>
	  <td>&nbsp;</td>
	  <td height="28">密&nbsp;&nbsp;码：</td>
	<td><input type="password" name="password"></td></tr>
    <tr>
      <td height="37" colspan="3" align="center"><input name="submit" type="submit" class="btn_bg_manageLogin" value="登 录"> &nbsp;
        <input name="reset" type="reset" class="btn_bg_manageLogin" value="取 消"></td>
      </tr>
  </form>
</table></td>
      </tr>
    </table>
    </td>
  </tr>
</table>

</body>
</html>
<script language="javascript">
  function check(){
   if(form1.username.value==""){
     alert("请输入用户名");form1.username.focus();return false;
   }
   if(form1.password.value==""){
     alert("请输入密码");form1.password.focus();return false;
   }
  }
</script>












