<%@ page language="java" pageEncoding="gb2312"%>
<%@page import="com.hiernate.persistence.*"%>
<jsp:directive.page import="com.hiernate.util.HibernateUtil"/>
<jsp:directive.page import="com.hiernate.util.GetTime"/>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<head>
 <%
    Shenhe shehe = new Shenhe();
    shehe.setTitle(request.getParameter("title"));
    shehe.setContent(request.getParameter("content"));
    shehe.setTime1((java.sql.Date)GetTime.getDate());
    shehe.setShen("0");
    HibernateUtil.saveshenhe(shehe);
    response.sendRedirect("chenggong.htm");
 %>
 </head>