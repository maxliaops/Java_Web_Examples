<%@ page contentType="text/html; charset=GBK" %>
<%@ page import="com.model.User" %>
<%@ page import="com.core.*" %>
<%
response.setHeader("Cache-Control","no-cache");
response.setHeader("Cache-Control","no-store");
response.setDateHeader("Expires",0);
response.setHeader("Pragma","no-cache");
if (!Crazyadept.UserIsOK(session,FinalConstants.STATUS_ADMIN)) {
	response.sendRedirect("../user_logon.jsp");
}
%>
<html>
<head>
<title>管理员控制台</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>
<body>
<table width="778" border="0" align="center" cellpadding="0" cellspacing="0" class="tableBorder">
  <tr align="center">
    <td height="300" colspan="2"> 
    <iframe src="top.jsp" frameborder="0" scrolling="no" name="topFrame" height="100%" width="100%" >
 	</iframe>
 	</td>
  </tr>
  <tr>
    <td width="10" align="left" valign="top"><jsp:include page="left.jsp"/></td>
    <td align="center">
    <table width="600" height="400"><tr><td valign="top"><br/>
          <iframe src="main.jsp" name="mainFrame" frameborder="0" width="98%" height="98%"></iframe>
 		</td>
 		</tr>
 		</table>
 	</td>
  </tr>
  <tr>
    <td colspan="2" align="center"><jsp:include page="bottom.jsp"/></td>
  </tr>
</table>
</body> 
</html>
