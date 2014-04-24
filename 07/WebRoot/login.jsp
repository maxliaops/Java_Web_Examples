<%@ page contentType="text/html; charset=gb2312" language="java"%>
<html>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<head>
<title>物资管理系统</title>
<link href="Css/style.css" rel="stylesheet">
<script language="javascript">
function check(form){
	if (form.name.value==""){
		alert("请输入用户名称!");form.name.focus();return false;
	}
	if (form.pwd.value==""){
		alert("请输入密码!");form.pwd.focus();return false;
	}	
}
</script>
</head>
<body">
<table width="778" border="0" align="center" cellpadding="0" cellspacing="0" class="tableBorder">
  <tr>
	<td bgcolor="#F4FEff">
	<table width="100%"  border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td valign="top"><table width="100%" height="525"  border="0" align="center" cellpadding="0" cellspacing="0" background="images/login.gif">
  <tr>
    <td height="523" align="center" valign="top"><table width="100%" height="478"  border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td height="478" align="right" valign="top" class="word_orange"><table width="100%" height="457"  border="0" cellpadding="0" cellspacing="0" background="Images/login.jpg">
          <tr>
            <td height="57"><table width="100%" height="185" border="0" cellpadding="0" cellspacing="0">
              <tr>
                <td>&nbsp;</td>
              </tr>
            </table></td>
          </tr>
          <tr>
            <td height="72" valign="top"><table width="100%" height="63"  border="0" cellpadding="0" cellspacing="0">
                <tr>
                  <td width="2%">&nbsp;</td>
                  <td width="97%" align="center" valign="top"><form name="form1" method="post" action="user.do?action=login">
                      <table width="100%" height="142"  border="0" cellpadding="0" cellspacing="0" bordercolorlight="#FFFFFF" bordercolordark="#D2E3E6">
                        <tr>
                          <td height="24">&nbsp;</td>
                          <td height="24" colspan="2" align="center">&nbsp;</td>
                          <td>&nbsp;</td>
                        </tr>
                        <tr>
                          <td width="64%" height="44">&nbsp;</td>
                          <td width="11%">用户名称：</td>
                          <td width="24%"><input name="name" type="text" class="logininput" id="name" size="25">
                          </td>
                          <td width="1%">&nbsp;</td>
                        </tr>
                        <tr>
                          <td height="44">&nbsp;</td>
                          <td>用户密码：</td>
                          <td><input name="pwd" type="password" class="logininput" id="pwd" size="25"></td>
                          <td>&nbsp;</td>
                        </tr>
                        <tr>
                          <td height="25">&nbsp;</td>
                          <td height="50" colspan="2" align="center"><input name="Submit" type="submit" class="btn_grey" value="确定" onClick="return check(form1)">
                            &nbsp;
                            <input name="Submit3" type="reset" class="btn_grey" value="重置">
                            &nbsp;
                            <input name="Submit2" type="button" class="btn_grey" value="关闭" onClick="window.close();"></td>
                          <td>&nbsp;</td>
                        </tr>
                      </table>
                  </form></td>
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
      </td>
  </tr>
</table></td>
  </tr>
</table>
</td>
  </tr>
</table>
</body>
</html>
