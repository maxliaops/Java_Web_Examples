<%@ page language="java" contentType="text/html" pageEncoding="GBK"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <body>
    <%
    	session.invalidate();
    	response.sendRedirect("../index.jsp");
    %>
  </body>
</html>
