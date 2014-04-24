<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%
session.invalidate();
response.sendRedirect("../index.jsp");
%>
