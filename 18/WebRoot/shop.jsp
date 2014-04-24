<%@ page contentType="text/html; charset=gb2312" %>
<html>
<head>
<title>新连锁店</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="style.css" rel="stylesheet">
</head>

<body>
<table width="777" height="172"  border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td><table width="777"  border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td><img src="Images/tiring-room/tiring-room_01.gif" width="777" height="125"></td>
      </tr>
      <tr>
        <td height="47" valign="top" background="Images/tiring-room/tiring-room_02.gif"><jsp:include page="H_navigation.jsp"/></td>
      </tr>
    </table></td>
  </tr>
</table>
<table width="777"  border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="44" height="380" valign="top"><img src="Images/tiring-room/tiring-room_03.gif" width="44" height="248"></td>
    <td valign="top"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="68" colspan="2" background="Images/tiring-room/h_newchain.gif">&nbsp;</td>
      </tr>
      <tr>
        <td width="4%">&nbsp;</td>
        <td width="96%">
		  <form method="POST" action="shop_add.jsp">
            <table width="80%" border="0" align="center">
              <tr>
                <td width="26%" height="30">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 用&nbsp;户&nbsp;名：</td>
                <td colspan="2"><input type="text" name="username" size="20"></td>
              </tr>
              <tr>
                <td width="26%" height="30">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;密&nbsp;&nbsp;&nbsp;&nbsp;码：</td>
                <td colspan="2"><input type="text" name="password" size="20"></td>
              </tr>
              <tr>
                <td width="26%" height="30">&nbsp;&nbsp;&nbsp;&nbsp; 连锁店名称：</td>
                <td colspan="2"><input type="text" name="shopname" size="50"></td>
              </tr>
              <tr>
                <td width="26%" height="30">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 所属地区：</td>
                <td colspan="2"><input type="text" name="area" size="20"></td>
              </tr>
              <tr>
                <td width="26%" height="30">&nbsp;&nbsp; 连锁店负责人：</td>
                <td colspan="2">
                  <input type="text" name="peopleman" size="20"></td>
              </tr>
              <tr>
                <td width="26%" height="30">&nbsp;&nbsp;&nbsp;&nbsp; 负责人电话：</td>
                <td colspan="2">
                  <input type="text" name="mantel" size="20"></td>
                <input type="hidden" name="pageaction" value="create">
                <input type="hidden" name="responsepage" value="shopman.jsp">
                <input type="hidden" name="usertype" value="1">
              </tr>
              <tr>
                <td width="26%" height="30">&nbsp;&nbsp;&nbsp;&nbsp; 连锁店电话：</td>
                <td colspan="2"><input type="text" name="shoptel" size="20"></td>
              </tr>
              <tr>
                <td height="49" colspan="2" align="center"><input name="B1" type="submit" class="btn_grey" value="提交">
&nbsp;                  <input name="B2" type="reset" class="btn_grey" value="全部重写">
&nbsp;
<input name="button" type="button" class="btn_grey" onClick="history.back();" value="&nbsp;返&nbsp;回&nbsp;"></td>
                <td width="34%" height="49" align="center">&nbsp;</td>
              </tr>
            </table>
            <p>　</p>
	      </form>		  </td>
      </tr>
    </table></td>
    <td width="35" valign="top"><img src="Images/tiring-room/tiring-room_05.gif" width="35" height="248"></td>
  </tr>
</table>
<jsp:include page="copyright.htm"/>
</body>
</html>

