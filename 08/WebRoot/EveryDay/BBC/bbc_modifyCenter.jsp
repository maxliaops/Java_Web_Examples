<%@ page language="java" pageEncoding="gb2312"%>
<%@ page import="com.hiernate.util.*"%>
<jsp:directive.page import="com.hiernate.persistence.Placard;"/>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<head>
	<html:base />
	<title></title>
	<link rel="stylesheet" type="text/css" href="../../CSS/style.css">
	</head>
	<%
	  Placard placard = (Placard)session.getAttribute("placard");   //得到保存在session中的Placard对象。
	  placard.setContent(request.getParameter("content"));          //更改Placard的属性值。
	  placard.setSubject(request.getParameter("subject"));
	  HibernateUtil.updatePlacard(placard);                         //调用修改方法
%>
<body>
<table width="600" height="500" cellpadding="-2" cellspacing="-2" background="../../Images/noword.jpg">
  <tr>
    <td width="817" height="349" valign="top"><table width="100%" height="102"  border="0" cellpadding="-2" cellspacing="-2">
      <tr><br>
        <td height="44">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="style7">公告信息修改成功</span></td>
      </tr>
      <tr>
        <td>&nbsp;</td>
      </tr>
    </table>      
   <form name="form1" method="post" action="bbc_index.jsp">
        <table width="80%" height="169"  border="0" align="center" cellpadding="-2" cellspacing="-2">
          <tr>
            <td height="105"><div align="center" class="style1"></div>              
            <div align="center"><span class="style3">公告信息修改成功！</span></div></td>
          </tr>
          <tr>
            <td height="25" valign="top"><div align="center" class="style1"></div></td>
          </tr>
          <tr>
            <td><div align="center">
                <input name="myclose" type="button" class="btn_grey" id="myclose" value="关闭" onClick="javascrip:opener.location.reload();window.close()">
            </div></td>
          </tr>
        </table>
      </form></td>
  </tr>
</table>

</body>

