<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>错误提示</title>
<link href="CSS/style.css" rel="stylesheet">
</head>

<body>
<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#EEEEEE">
  <tr>
    <td align="center"><table width="350" height="192" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td width="388" align="center" background="Images/error.jpg">&nbsp;&nbsp;错误提示信息： ${error} <br>
              <br>
              <input name="Submit" type="submit" class="btn_grey" value="返回" onClick="history.back(-1)"></td>
      </tr>
    </table></td>
  </tr>
</table>
<center>
</center>
</body>
</html>
