<%@ page language="java" pageEncoding="gb2312"%>
<jsp:directive.page import="com.hiernate.util.*,com.hiernate.persistence.*"/>
<jsp:directive.page import="java.sql.Date"/>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<head>
	<html:base />
	<%
	  TongXunAdd txa = (TongXunAdd)session.getAttribute("TXA");
	  txa.setAddress(request.getParameter("address"));
	  txa.setBirthday(Date.valueOf(request.getParameter("birthday")));
	  txa.setCf(request.getParameter("sf"));
	  txa.setCs(request.getParameter("cs"));
	  txa.setDepartment(request.getParameter("department"));
	  txa.setEmail(request.getParameter("email"));
	  txa.setFamily(request.getParameter("family"));
	  txa.setZw(request.getParameter("zw"));
	  txa.setSex(request.getParameter("sex"));
	  txa.setRemark(request.getParameter("remark"));
	  txa.setPostcode(request.getParameter("postcode"));
	  txa.setPhone1(request.getParameter("phone1"));
	  txa.setPhone(request.getParameter("phone"));
	  txa.setOICQ(request.getParameter("OICQ"));
	  txa.setName11(request.getParameter("name11"));
	  txa.setHy(request.getParameter("hy"));
	  HibernateUtil.updateTongxun(txa);
	%>
	<script language="javascript">
	alert("信息修改成功！");
	opener.location.reload();
	window.close();
	</script>
	
</head>