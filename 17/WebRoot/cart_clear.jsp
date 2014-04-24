<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*"%>
<%
session.removeAttribute("cart");
response.sendRedirect("cart_null.jsp");
%>
