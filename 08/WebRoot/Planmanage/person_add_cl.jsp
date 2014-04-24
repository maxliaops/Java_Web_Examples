<%@ page language="java" pageEncoding="gb2312"%>
<jsp:directive.page import="com.hiernate.util.*,com.hiernate.persistence.*"/>
<jsp:directive.page import="java.sql.Date"/>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<head>
 <%
 Person person = new Person();
 person.setName1(request.getParameter("name1"));
 person.setTitle(request.getParameter("title"));
 person.setContent(request.getParameter("content"));
 person.setTime1(Date.valueOf(request.getParameter("time1")));
 HibernateUtil.saveperson(person);
%>
<script language="javascript">
alert("个人计划发表成功!!");
opener.location.reload();
window.close();
</script>
</head>