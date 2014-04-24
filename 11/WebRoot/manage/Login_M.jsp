<%@ page contentType="text/html; charset=gb2312" language="java"%>
<html>
<head>
<title>后台管理!</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="../CSS/style.css" rel="stylesheet">
<script src="../JS/check.js"></script>
</head>

<body>
 <table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
   <tr>
     <td bgcolor="#2C5D97"> <form name="form1" method="post" action="Login_M_deal.jsp" onSubmit="return checkM(form1)">
      <table width="491" height="275"  border="0" align="center" cellpadding="0" cellspacing="0" background="../images/login_M.jpg">
        <tr>
          <td height="60" colspan="2" align="center">&nbsp;</td>
        </tr>	  
              
        <tr>
          <td width="189" height="87" align="center" valign="top">&nbsp;</td>
          <td width="302" align="left" valign="top"><table width="81%" height="98"  border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td width="95%" height="30" align="center">&nbsp;用户名：
                <input name="manager" type="text" id="manager" size="26"></td>
            </tr>
            <tr>
              <td height="30" align="center">&nbsp;密&nbsp;&nbsp;码：<span class="word_white">
                <input name="PWD" type="password" id="PWD" size="26">
              </span></td>
            </tr>
            <tr>
              <td align="center"><input name="Submit" type="submit" class="btn_bg_manageLogin" value="确认">
                &nbsp;
                <input name="Submit2" type="reset" class="btn_bg_manageLogin" value="重置">
                &nbsp;
                <input name="Submit3" type="button" class="btn_bg_manageLogin" value="返回" onClick="window.location.href='../index.jsp';"></td>
            </tr>
          </table></td>
        </tr>
</table>
      <table width="491" height="39" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td align="center" class="word_white">All CopyRights &copy; reserved 2011 吉林省明日科技有限公司</td>
        </tr>
      </table>
     </form></td>
   </tr>
 </table>
</body>
</html>
