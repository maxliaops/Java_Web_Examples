<%@ page language="java" pageEncoding="gb2312"%>

<jsp:directive.page import="com.hiernate.util.*,com.hiernate.persistence.*"/>
<jsp:directive.page import="java.sql.Date"/>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<head>
	<html:base />
	<title></title>
<%
   Waichu waichu = new Waichu();                        //创建外出信息对象               
   waichu.setContent(request.getParameter("content"));  //设置对象的外出原因
   waichu.setDepartment(request.getParameter("department"));
   waichu.setName1(request.getParameter("name1"));      //设置对象姓名
   waichu.setState(0);                                  //设置对象的初始状态
   waichu.setTime1(Date.valueOf(request.getParameter("time1")));    //设置对象的外出时间
   waichu.setTime2(Date.valueOf(request.getParameter("time2")));    //设置对象的回归时间
   HibernateUtil.saveWaichu(waichu);                    //调用保持对象方法
%>
<script language="javascript">
alert("外出信息添加成功！");
opener.location.reload();
window.location.href='waichu.jsp';
window.close();
</script>
</head>