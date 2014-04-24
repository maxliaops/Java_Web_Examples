<%@ page language="java" pageEncoding="gb2312"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<head>
<%
   String strid = request.getParameter("Idd");
   session.setAttribute("IDD",strid);
   response.sendRedirect("tongxun_modifySave.jsp?cP="+request.getParameter("cP"));
  %>
</head>




