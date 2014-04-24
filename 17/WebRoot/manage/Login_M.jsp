<%@ page contentType="text/html; charset=gb2312" language="java"%>
<html>
<head>
<title>后台管理!</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="../CSS/style.css" rel="stylesheet">
</head>

<body>
      <table width="350" height="230"  border="0" align="center" cellpadding="0" cellspacing="0" background="../Images/login_M.jpg" class="tableBorder">
        <tr>
          <td height="64" align="center">&nbsp;</td>
        </tr>	  
              
        <tr>
          <td height="45" valign="top"><table width="62%" height="96"  border="0" cellpadding="0" cellspacing="0">
              <form name="form1" method="post" action="Login_M_deal.jsp">
			<tr>
              <td align="center">&nbsp;用户名：
              <input name="manager" type="text" id="manager" size="20"></td>
            </tr>
            <tr>
              <td align="center">&nbsp;密&nbsp;&nbsp;码：
              <input name="PWD" type="password" id="PWD" size="20"></td>
            </tr>

            <tr>
              <td align="center"><input name="Submit" type="submit" class="btn_grey" value="确认"> &nbsp;
                <input name="Submit2" type="reset" class="btn_grey" value="重置">
              &nbsp;
              <input name="Submit3" type="button" class="btn_grey" value="返回" onClick="window.location.href='../index.jsp';"></td>
            </tr>
            </form>
          </table></td>
        </tr>
</table>
</body>
</html>
