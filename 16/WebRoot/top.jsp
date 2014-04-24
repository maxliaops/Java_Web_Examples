<%@ page contentType="text/html;charset=gb2312" language="java"%>
<%@ page import="java.io.*,java.sql.*,java.util.*"%>
<html>
  <title>
  </title>
  <meta http-equiv="Content-Type" content="text/html; charset=gb2312">
  <link href="CSS/style.css" rel="stylesheet" type="text/css">
  <body>
<%
  boolean isLog=false;
  try
  {
    //获得用户是否登录的信息
    isLog=((String)session.getAttribute("isLog")).equals("1");
  }
  catch(Exception e){}
  if(!isLog)
  {
    out.println("<script language='javascript'>alert('您还没有登录');parent.location.href='index.jsp';</script>");
  }
%>
<table width="778"  border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="784" height="115" align="center" valign="top"><img src="images/logo.jpg" width="778" height="115"></td>
  </tr>
</table>
  </body>
</html>



















