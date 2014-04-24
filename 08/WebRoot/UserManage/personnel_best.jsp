<%@ page language="java" pageEncoding="gb2312"%>
<%@ page import="java.util.*"%>
<%@page import="com.hiernate.persistence.*"%>
<jsp:directive.page import="com.hiernate.util.HibernateUtil"/>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<head>
	<html:base />
	<title>优秀员工</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
    <link href="../CSS/style.css" rel="stylesheet" type="text/css">
</head>
<body>
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
}
.style1 {color: #C60001}
.style2 {color: #669999}
.style3 {color: #FF0000}
.STYLE6 {color: #669999; font-size: 9pt; }
.STYLE7 {
	font-size: 9pt;
	color: #000000;
}
-->
</style>
<body>
<table width="421" height="260" border="0" cellpadding="-2" cellspacing="-2">
  <tr>
    <td width="421" valign="top"><table width="100%" height="88"  border="0"
	 cellpadding="-2" cellspacing="-2">
      <tr>
        <td height="88">&nbsp;</td>
      </tr>
    </table>      
      
        <table width="83%"  border="1" align="center" cellpadding="-2" cellspacing="-2"
		 bordercolor="#FFCCCC" bordercolordark="#FFFFFF">
          <tr>
            <td width="21%" height="23"><div align="center" class="STYLE7">名次</div></td>
            <td width="30%" height="23"><div align="center" class="STYLE7">用户名</div></td>
            <td width="28%"><div align="center" class="STYLE7">员工姓名</div></td>
           
          </tr>
		 <% 
		  List listU = HibernateUtil.findU();
		  int Mycount=1;
		   if(!listU.isEmpty() && listU.size()>0){
			   for(int i =0 ;i<listU.size();i++){
				  User user = (User)listU.get(i);
			 %>
          <tr>
            <td height="23" align="center"><span class="STYLE6">第[</span> <span class="STYLE6">
			<%=Mycount++%></span> <span class="STYLE6">]名</span></td>
            <td height="23"><div align="center" class="style2"><%=user.getUserName()%></div></td>
            <td height="23"><div align="center" class="style2"><%=user.getName()%></div></td>
           
          </tr>
          <% 
			   }}
		 %>
      </table>
        <table width="83%" height="40"  border="0" align="center" cellpadding="-2" cellspacing="-2">
          <tr>
            <td height="10"></td>
          </tr>
		  <tr>
            <td valign="bottom"> <div align="center"> 
              <form name="form1" method="post">
                <input name="myclose" type="button" class="btn_grey" id="myclose"
				 value="关闭窗口" onClick="javascrip:window.close()">
              </form></div></td>
          </tr>
    </table></td>
  </tr>
</table>
</body>




