<%@ page language="java" pageEncoding="gb2312"%>
<%@ page import="java.util.*"%>
<jsp:directive.page import="com.hiernate.util.*,com.hiernate.persistence.*"/>
<jsp:directive.page import="java.sql.Date"/>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<head>
	<html:base />
	<title>添加详细信息页面</title>
	<%
	  List listTongxun = HibernateUtil.findTonName(request.getParameter("name11"));
	   if(listTongxun.isEmpty()){
	  TongXunAdd txa = new TongXunAdd();
	  if(request.getParameter("address")!=null){
	  txa.setAddress(request.getParameter("address"));
	  }
	  if(request.getParameter("birthday")!=null){
	  txa.setBirthday(Date.valueOf(request.getParameter("birthday")));
	  }
	  if(request.getParameter("sf")!=null){
	  txa.setCf(request.getParameter("sf"));
	  }
	  if(request.getParameter("cs")!=null){
	  txa.setCs(request.getParameter("cs"));
	  }
	  if(request.getParameter("department")!=null){
	  txa.setDepartment(request.getParameter("department"));
	  }
	  if(request.getParameter("email")!=null){
	  txa.setEmail(request.getParameter("email"));
	  }
	  if(request.getParameter("family")!=null){
	  txa.setFamily(request.getParameter("family"));
	  }
	  if(request.getParameter("zw")!=null){
	  txa.setZw(request.getParameter("zw"));
	  }
	  if(request.getParameter("sex")!=null){
	  txa.setSex(request.getParameter("sex"));
	  }
	  if(request.getParameter("remark")!=null){
	  txa.setRemark(request.getParameter("remark"));
	  }
	  if(request.getParameter("postcode")!=null){
	  txa.setPostcode(request.getParameter("postcode"));
	  }
	  if(request.getParameter("phone1")!=null){
	  txa.setPhone1(request.getParameter("phone1"));
	  }
	  if(request.getParameter("phone")!=null){
	  txa.setPhone(request.getParameter("phone"));
	  }
	  if(request.getParameter("OICQ")!=null){
	  txa.setOICQ(request.getParameter("OICQ"));
	  }
	 txa.setName11(request.getParameter("name11"));
	  txa.setName1(Integer.parseInt(request.getParameter("name1")));
	  if(request.getParameter("hy")!=null){
	  txa.setHy(request.getParameter("hy"));
	  }
	  HibernateUtil.saveTongxun(txa);
	%>
	<script language="javascript">
     alert("通讯详细信息添加成功!!");
     window.location.href='tongxun_xianxi.jsp';
 </script>
 <%}else{%>
 <script language="javascript">
 alert("该用户信息已经存在！");
 window.location.href='tongxun_xianxi.jsp';
</script>
<%} %>
</head>




