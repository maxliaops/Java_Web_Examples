<%@ page language="java" pageEncoding="gb2312"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<head>
<% 
   String str = request.getParameter("IDd");
   session.setAttribute("stid",str);
   response.sendRedirect("update.jsp");
%>
	
</head>
