<%@ page contentType="text/html; charset=GBK" %>
<%
response.setHeader("Cache-Control","no-cache");
response.setHeader("Cache-Control","no-store");
response.setDateHeader("Expires",0);
response.setHeader("Pragma","no-cache");
%>
<html>
<head>
<title>用户登录</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>
<link href="css/css.css" rel="stylesheet" type="text/css">
<script src="js/validate.js"></script>
<body bgcolor="#ffffff" onLoad="clockon(bgclock)"> 
<table width="630" border="0" cellspacing="0" cellpadding="0" class="tableBorder6"> 
  <tr> 
    <td height="165" valign="top"><jsp:include page="top.jsp"/></td> 
  </tr> 
  <tr><td height="9"></td></tr>
  <tr> 
    <td height="360" valign="top"><form method="post" action="user_modify.jsp" name="forms"> 
        <table width="97%" border="0" align="center" cellpadding="0" cellspacing="1" class="tableNew"> 
          <tr> 
            <td height="26" colspan="2" align="center" class="TableTitle1">用户登录</td> 
          </tr> 
          <tr> 
            <td height="27" align="center" bgcolor="#FFFFFF">用户名：</td> 
            <td width="466" align="center" bgcolor="#FFFFFF"><input name="uid" type="text" size="50"></td> 
          </tr> 
          <tr> 
            <td height="27" align="center" bgcolor="#FFFFFF">密&nbsp;&nbsp;&nbsp;码：</td> 
            <td width="466" height="27" align="center" bgcolor="#FFFFFF"><input name="password" type="password" size="50"></td> 
          </tr> 
          <tr> 
            <td height="27" colspan="2" align="center" bgcolor="#FFFFFF"><input name="Submit" type="submit" class="btn_grey" onClick="return logons()" value="登录"> 
              <input type="hidden" value="logon" name="action" > 
&nbsp;&nbsp; 
            <input name="Submit2" type="button" class="btn_grey" onClick="javascript:location.href='user_return.jsp'" value="找回密码"></td> 
          </tr> 
        </table> 
    </form></td> 
  </tr> 
  <tr> 
    <td align="center"><jsp:include page="bottom.jsp"/></td> 
  </tr> 
</table> 
</body>
</html>
