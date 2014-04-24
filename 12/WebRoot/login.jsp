<%@ page contentType="text/html; charset=gb2312" language="java"%>
<html>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<head>
<title>图书馆管理系统</title>
<link href="CSS/style.css" rel="stylesheet">
<script language="javascript">
function check(form){
	if (form.name.value==""){
		alert("请输入管理员名称!");form.name.focus();return false;
	}
	if (form.pwd.value==""){
		alert("请输入密码!");form.pwd.focus();return false;
	}	
}
</script>
</head>
<body">
<table width="778" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#c3a339" class="tableBorder">
  <tr>
    <td>
<table width="760" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="142" valign="top">&nbsp;</td>
  </tr>
</table>
	</td>
  </tr>
	<td>
	<table width="100%"  border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td valign="top"><table width="100%" height="525"  border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="523" align="center" valign="top"><table width="100%" height="271"  border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td height="271" align="right" valign="top" class="word_orange"><table width="100%" height="255"  border="0" cellpadding="0" cellspacing="0" background="Images/login.jpg">
          <tr>
            <td height="57">&nbsp;</td>
            </tr>
          <tr>
            <td height="179" valign="top"><table width="100%" height="63"  border="0" cellpadding="0" cellspacing="0">
              <tr>
                <td width="2%">&nbsp;</td>
                  <td width="97%" align="center" valign="top">
                    <form name="form1" method="post" action="manager?action=login">
                      <table width="100%"  border="0" cellpadding="0" cellspacing="0" bordercolorlight="#FFFFFF" bordercolordark="#D2E3E6">
                        <tr>
                          <td height="57">&nbsp;</td>
                          <td height="57" colspan="2" align="center">&nbsp;</td>
                          <td>&nbsp;</td>
                        </tr> 
                        <tr>
                          <td width="50%" height="37">&nbsp;</td>
                      <td width="10%">管理员名称：</td>
                      <td width="31%">
                        <input name="name" type="text" class="logininput" id="name" size="27">                        </td>
                      <td width="9%">&nbsp;</td>
                    </tr>
                        <tr>
                          <td height="37">&nbsp;</td>
                      <td>管理员密码：</td>
                      <td><input name="pwd" type="password" class="logininput" id="pwd" size="27"></td>
                      <td>&nbsp;</td>
                    </tr>
                        <tr>
                          <td height="30">&nbsp;</td>
                      <td colspan="2" align="center"><input name="Submit" type="submit" class="btn_grey" value="确定" onClick="return check(form1)">
                        &nbsp;
                        <input name="Submit3" type="reset" class="btn_grey" value="重置">&nbsp;
                        <input name="Submit2" type="button" class="btn_grey" value="关闭" onClick="window.close();"></td>
                      <td>&nbsp;</td>
                    </tr>
                        </table> 
			  </form>				   </td>
                  <td width="1%">&nbsp;</td>
                </tr>
              </table></td>
            </tr>
          <tr>
            <td height="19">&nbsp;</td>
            </tr>
        </table></td>
      </tr>
      
    </table>
      <table width="100%" height="27"  border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td align="center" class="word_login">CopyRight &copy; 2011 www.**********.com 长春市*****有限公司<br>
            本站请使用IE6.0或以上版本 1024*768为最佳显示效果</td>
        </tr>
      </table></td>
  </tr>
</table></td>
  </tr>
</table>
</td>
  </tr>
</table>
</body>
</html>
