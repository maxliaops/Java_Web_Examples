<%@ page language="java" pageEncoding="gb2312"%>
<jsp:directive.page import="com.hiernate.persistence.Placard"/>
<jsp:directive.page import="com.hiernate.util.HibernateUtil"/>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<head>
	<html:base />
	<title>删除公告信息成功</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
    <link rel="stylesheet" type="text/css" href="../../CSS/style.css">
 <style type="text/css">
 <!--
 body {
 	margin-left: 0px;
	margin-top: 0px;
 }
 .style1 {color: #C60001}
 .style3 {
	color: #C60001;
	font-size: 12pt;
	font-weight: bold;
 }
 .STYLE5 {
	font-size: 9pt;
	 color: #FFFFFF;
 }
 .style7 {font-size: 9pt; color: #000000; }
 -->
</style>
<body>

<%
    int link=Integer.parseInt(request.getParameter("link"));
    int currPage=Integer.parseInt(request.getParameter("currPage"));
    Placard placard = (Placard)session.getAttribute("PL");
    HibernateUtil.delePlacard(placard);
%>

<table width="557" height="401" border="0" cellpadding="-2" cellspacing="-2" background="../../Images/noword.jpg">
  <tr>
    <td width="817" height="349" valign="top"><table width="100%" height="101"  border="0" cellpadding="-2" cellspacing="-2">
      <tr>
        <td height="43">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="style7">公告信息删除成功</span></td>
      </tr>
      <tr>
        <td>&nbsp;</td>
      </tr>
    </table>      
      <form name="form1" method="post" action="">
        <table width="80%" height="169"  border="0" align="center" cellpadding="-2" cellspacing="-2">
          <tr>
            <td height="105"><div align="center" class="style1"></div>              
            <div align="center"><span class="style3">公告信息删除成功！</span></div></td>
          </tr>
          <tr>
            <td height="25" valign="top"><div align="center" class="style1"></div></td>
          </tr>
          <tr>
            <td><div align="center">
              <input name="myclose" type="button" class="btn_grey" id="myclose" value="关闭" onClick="javascrip:opener.location.href='bbc_index.jsp?link=<%=link%>';window.close()">
            </div></td>
          </tr>
        </table>
      </form></td>
  </tr>
</table>
</body>




