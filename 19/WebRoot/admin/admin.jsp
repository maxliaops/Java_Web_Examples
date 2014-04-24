<%@ page contentType="text/html; charset=gb2312" %>
<%@ page import="com.bwm.page.Show"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
Show show=new Show();
String strUser=(String)session.getAttribute("admin");
if(strUser==null){
	out.print(show.errorBox("\u8BF7\u4F60\u6B63\u5E38\u767B\u5F55\uFF01","\u9A8C\u8BC1\u4FE1\u606F"));
	return;
}
%>
<frameset rows="70,*" cols="*" frameborder="NO" border="0" framespacing="0">
  <frame src="top.htm" name="topFrame" frameborder="no" noresize>
  <frame src="login.htm" name="mainFrame" frameborder="no">
</frameset>
<noframes><body>
</body></noframes>
</html>
