<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body>
<%
//String sessionname=request.getParameter("SN");
//session.removeAttribute(sessionname);  //清空Session变量
session.invalidate();
response.sendRedirect("index.jsp");
//out.println("<script language='javascript'>window.location.href='index.jsp';</script>");
%>
</body>
</html>
