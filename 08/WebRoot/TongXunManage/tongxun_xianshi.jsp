<%@ page language="java" pageEncoding="gb2312"%>
<%@ page import="java.util.*"%>
<jsp:directive.page import="com.hiernate.util.*,com.hiernate.persistence.*;"/>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<head>
	<html:base />
	<title>显示职工信息</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
    <link rel="stylesheet" type="text/css" href="CSS/style.css">
<style type="text/css">
<!--
.style2 {color: #000000}
body,td,th {
	font-size: 12px;
}
a {
	font-size: 12px;
}
a:link {
	text-decoration: none;
	color: #0000FF;
}
a:visited {
	text-decoration: none;
	color: #0000FF;
}
a:hover {
	text-decoration: none;
	color: #0000FF;
}
a:active {
	text-decoration: none;
}
body {
	background-color: #E9ECDB;
	margin-left: 0px;
}
-->
</style>
</head>
 <% 
    String strid =(String)session.getAttribute("idd");
     List listTong = HibernateUtil.findTX(Integer.parseInt(strid));
     if(!listTong.isEmpty() && listTong.size()>0){
   %>
<body>
 <table width="550" height="290" border="1" align="center" cellspacing="0">
  <tr bgcolor="#E9ECDB">
   <div align="center" class="style2">通讯组内信息</div>
   <td rowspan="2" valign="top" bgcolor="#E9ECDB"><table width="100%" height="25%" border="0" cellspacing="1">
   <tr bgcolor="#E9ECDB">
          <td width="18%" height="35" bgcolor="#E9ECDB" class="unnamed3"><div align="center"><span class="style2">名字</span></div></td>
          <td width="17%" bgcolor="#E9ECDB"><div align="center"><span class="style2">电话</span></div></td>
          <td width="19%" bgcolor="#E9ECDB"><div align="center">
            <div align="center" class="style2">QQ</div>
          </div></td>
          <td width="21%" bgcolor="#E9ECDB" style=" "><div align="center"><span class="style2">E-mail</span></div></td>
          <td colspan="2" bgcolor="#E9ECDB" class="unnamed1"><div align="center"></div>          
          <div align="center"><span class="style2">管理</span></div></td>
        </tr>
         <%
            for(int i=0;i<listTong.size();i++){
     		TongXunAdd txa = (TongXunAdd)listTong.get(i);
     		session.setAttribute("TXA",txa);
         %>
       <tr>
          <td bgcolor="#FFFFFF" class="unnamed3"><div align="center">
		  <a href="#" onClick="JScript:window.open('lianxianshi.jsp?IDd=<%=txa.getId()%>','','width=350,height=500')"><%=txa.getName11()%></a></div></td>
          <td width="17%" bgcolor="#FFFFFF"><div align="center"><%=txa.getPhone1()%></div></td>
          <td width="19%" bgcolor="#FFFFFF"><div align="center"><%=txa.getOICQ()%></div></td>
          <td width="21%" bgcolor="#FFFFFF" style=" "><div align="center"><a href="mailto:<%=txa.getEmail()%>"><%=txa.getEmail()%></a></div></td>
          <td width="12%" bgcolor="#FFFFFF" class="unnamed1"><div align="center">
                    <%
                      String purview = (String)application.getAttribute("Purview");
                       if(!purview.equalsIgnoreCase("系统")){
                     	 %>
                     	 <a href="tongxun_nomodifys.jsp">修改</a>
                     	 <td width="13%" bgcolor="#FFFFFF" class="unnamed2">
                     	 <div align="center"><a href="tongxun_nomodifys.jsp">删除</a></div></td>
                     	 </tr>
                    	  <%}%>
	                     <%if(purview.equalsIgnoreCase("系统")){ %>
          <a href="#" onClick="JScript:window.open('update.jsp?ID=<%=txa.getId()%>','','width=450,height=550')">修改</a>	  
	     <td width="13%" bgcolor="#FFFFFF" class="unnamed2"><div align="center"><a href="del.jsp?IDS=<%=txa.getId()%>" onClick="return confirm('是否确认删除?')">删除</a>
        <%}}}else {%>
		<div align="center" style="style2">
		  暂无信息
		  </div>
		  <%}%>  
		 
 </body>




