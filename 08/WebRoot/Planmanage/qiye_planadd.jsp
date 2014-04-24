<%@ page language="java" pageEncoding="gb2312"%>
<%@page import="com.hiernate.persistence.*,com.hiernate.util.*" %>
<jsp:directive.page import="java.sql.Date"/>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<head>
<%
  
	  Qiye qiye = new Qiye();
      qiye.setName1(request.getParameter("name1"));
	  qiye.setRiqi(Date.valueOf(request.getParameter("riqi")));
	  qiye.setContent(request.getParameter("content"));
	  qiye.setTitle(request.getParameter("title"));
	  HibernateUtil.saveqiye(qiye);
	  
%>
<script language="javascript">
alert("企业计划发表成功!!");
opener.location.reload();
window.close();
</script>

</head>




