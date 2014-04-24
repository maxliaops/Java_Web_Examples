<%@ page language="java" pageEncoding="gb2312"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<head>
<%
  String strid = request.getParameter("idd");
  session.setAttribute("idd",strid);
  System.out.print(strid);
  response.sendRedirect("tongxun_xianshi.jsp");
%>
</head>