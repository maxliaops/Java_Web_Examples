<%@ page contentType="text/html; charset=gb2312" %>
<html>
<head>
<title>产品展示</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="style.css" rel="stylesheet">
</head>
<body>
<jsp:include page="banner.htm"/>
<table width="777" height="112"  border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="188" height="163" valign="top">
<jsp:include page="left.htm"/>
	</td>
    <td align="center" valign="top"><table width="100%" height="46"  border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td background="Images/index/index_03.gif">
		<jsp:include page="navigation.htm"/></td>
      </tr>
    </table>
      <table width="100%"  border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td align="center">
<table width="100%" height="76"  border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td height="76" valign="top" background="Images/index/before_board.GIF"><table width="95%" height="33"  border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td align="right">当前位置：留言簿 &gt;&gt;&gt;</td>
            </tr>
          </table></td>
        </tr>
      </table>
      <table width="90%" height="271"  border="0" cellpadding="0" cellspacing="0" align="center">
                <tr>
                  <td height="143"> <form method="POST" action="mess_add.jsp">
  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td width="16%" height="36">姓&nbsp;&nbsp;&nbsp;&nbsp;名：</td>
      <td width="84%"><input type="text" name="mname" size="20">
        <input type="hidden" name="pageaction" value="create">
        <input type="hidden" name="responsepage" value="mess.jsp"></td>
    </tr>
    <tr>
      <td height="36">主&nbsp;&nbsp;&nbsp;&nbsp;题：</td>
      <td><input type="text" name="mtext" size="66"></td>
    </tr>
    <tr>
      <td>留言内容：</td>
      <td><textarea name="mnote" cols="64" rows="10" class="wenbenkuang"></textarea></td>
    </tr>
    <tr>
      <td height="36">&nbsp;</td>
      <td><input name="B1" type="submit" class="btn_grey" value="提交">
        <input name="B2" type="reset" class="btn_grey" value="全部重写"></td>
    </tr>
  </table>
 </form>
</td>
                                  </tr>
                                          </table>		  </td>
        </tr>
      </table></td>
    <td width="35" valign="top"><img src="Images/index/index_04.gif" width="35" height="301"></td>
  </tr>
</table>
<jsp:include page="copyright.htm"/>
</html>
</body>
