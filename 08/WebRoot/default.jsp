<%@ page language="java" pageEncoding="gbk"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html:html locale="true">
  <head>
    <html:base />
    
<title>ÍøÒ³Ö÷´°¿Ú</title>
    <link rel="stylesheet" type="text/css" href="CSS/style.css">
    </head>

<body>
<table width="1003" height="690" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="100" colspan="2"><jsp:include page="top.jsp"></jsp:include></td>
  </tr>
  <tr>
 
    <td width="202">  <iframe src="left.jsp" width="100%" height="100%" frameborder="0" scrolling="auto" name="leftiframe">
    </iframe></td>
    <td width="801"> <iframe src="main.jsp" width="100%" height="100%" frameborder="0"  scrolling="auto" name="mainFrame">
    </iframe></td>
  </tr>
  <tr>
    <td height="17" valign="bottom" background="Images/left_bg_bottom.jpg"></td>
	<td height="17" valign="bottom" background="Images/main_bottom.jpg"></td>
  </tr>
</table>
</body>
</html:html>
