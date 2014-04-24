<%@ page language="java" pageEncoding="gb2312"%>
<jsp:directive.page import="com.hiernate.util.*,com.hiernate.persistence.*"/>
<jsp:directive.page import="java.sql.Date"/>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<head>
 <%
   Bm bm = new Bm();
   bm.setName1(request.getParameter("name1"));
   bm.setContent(request.getParameter("content"));
   bm.setTitle(request.getParameter("title"));
   bm.setTime1(Date.valueOf(request.getParameter("time1")));
   HibernateUtil.savebm(bm);
 %>
 <script language="javascript">
 alert("部门计划发表成功!!");
 opener.location.reload();
 window.close();
 </script>

</head>