<%@ page language="java" pageEncoding="gb2312"%>
<%@page import="com.hiernate.persistence.*"%>
<jsp:directive.page import="java.sql.Date"/>
<jsp:directive.page import="com.hiernate.util.HibernateUtil"/>
<jsp:directive.page import="com.hiernate.util.GetTime"/>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<head>

<%
      Shenhe shenhe = (Shenhe)session.getAttribute("Shenhe");
      shenhe.setTitle(request.getParameter("title"));
      shenhe.setContent(request.getParameter("content"));
      shenhe.setTime1((java.sql.Date)GetTime.getDate());
      Integer curr = (Integer)session.getAttribute("CU");
      HibernateUtil.updateshenhe(shenhe);
	 %>
<script language="javascript">
 opener.location.reload();
 alert("信息修改成功!");
 window.close();
</script>
 </head>