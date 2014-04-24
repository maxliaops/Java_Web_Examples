<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<html:base />
<title>网络在线考试</title>
<link href="CSS/style.css" rel="stylesheet">
</head>

<body>
<table width="778" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="208" background="Images/default_top.jpg">&nbsp;</td>
  </tr>
  <tr>
    <td><img src="Images/default_mid.JPG" width="778" height="254" border="0" usemap="#Map"></td>
  </tr>
  <tr>
    <td height="158" background="Images/default_bottom.JPG">&nbsp;</td>
  </tr>
</table>
<map name="Map">
        <area shape="poly" coords="190,65,190,65,215,82,194,98,105,113,103,81" href="examRule.jsp">
        <area shape="poly" coords="313,59,402,45,435,56,406,78,311,90,313,58" href="manage/stuResult.do?action=stuResultQueryS&ID=${student}">
        <area shape="poly" coords="380,141,508,119,541,139,521,154,385,176" href="manage/student.do?action=modifyQuery&ID=${student}">
        <area shape="poly" coords="602,58,690,46,715,63,696,76,602,91" href="logout.jsp">
</map>
</body>
</html>
