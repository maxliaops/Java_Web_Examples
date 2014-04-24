<%@ page language="java" pageEncoding="gb2312"%>
<jsp:directive.page import="com.hiernate.util.*,com.hiernate.persistence.*;"/>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<head>
	<html:base />
	<title></title>
<%
   Tongxun tx = (Tongxun)session.getAttribute("Tongxun");
   tx.setName1(request.getParameter("name1"));
   HibernateUtil.updateTx(tx);
%>
<script language="javascript">
 alert("通讯组信息修改成功!");
 opener.location.reload();
 window.close();
</script>
</head>




