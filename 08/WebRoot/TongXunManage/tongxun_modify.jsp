<%@ page language="java" pageEncoding="gb2312"%>
<%@ page import="java.util.*"%>
<jsp:directive.page import="com.hiernate.util.*,com.hiernate.persistence.*;"/>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<head>
	<html:base />
	<title>修改通讯组类型</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-bottom: 0px;
}
.STYLE2 {
	font-size: 10pt;
	color: #FFFFFF;
}
.STYLE4 {
	font-size: 10pt;
	color: #000000;
}
-->
</style>
<script language="javascript">
function Mycheck()
{
if(form1.name1.value=="")
{alert("请输入通讯组名称!!");form1.name1.focus();return;}
form1.submit();
}
</script>
<link href="../CSS/style.css" rel="stylesheet" type="text/css">
</head>
<body>
<form name="form1" method="post" action="tongxun_modifySave.jsp">
<table width="302" height="230" border="0" cellpadding="0" cellspacing="0" background="../Images/noword.jpg">
  <tr>
    <td width="274" height="228" valign="top"><table width="289" height="225" border="0" align="right" cellpadding="0" cellspacing="0">
      <tr>
        <td height="27" valign="middle">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br>&nbsp;&nbsp;<span class="STYLE4">修改通讯组类型 </span></td>
      </tr>
      <tr>
        <td height="198"><table width="282" height="92" border="0" align="center" cellpadding="0" cellspacing="0">
        
          <tr>
            <td width="83" height="46"><span class="STYLE4">通讯组名称</span></td>
            <%
            String stridd = (String) request.getParameter("Idd");
            List listtongxun = HibernateUtil.findT(Integer.parseInt(stridd));
               if(!listtongxun.isEmpty()&& listtongxun.size()>0){
            	   for(int i=0;i<listtongxun.size();i++){
            	   Tongxun tx = (Tongxun)listtongxun.get(i);
            	   session.setAttribute("Tongxun",tx);
               %>
             <td width="199"><input name="name1" type="text" id="name1" size="25" value="<%=tx.getName1()%>"></td>
               <%}}%>
            </tr>
          <tr>
        <td height="46" colspan="2"><table width="237" height="28" border="0" align="center" cellpadding="0" cellspacing="0"/>
        <tr>
      <td width="249">&nbsp;&nbsp;&nbsp;
	  <input name="Submit" type="button" class="btn_grey"onclick="Mycheck();" value="发表">
 <input name="Submit2" type="button" class="btn_grey" onClick="JScript:window.close();" value="关闭">
 <input name="Submit3" type="button" class="btn_grey" onClick="JScript:form1.reset();" value="重填">
       </td>
</tr>
</table>
</body>




