<%@ page contentType="text/html; charset=GBK" %>
<%@ page import="com.model.Affiche" %>
<%@ page import="com.core.*" %>
<%@ page import="java.util.*" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<title>查看公告详细内容</title>
</head>
<link href="css/css.css" rel="stylesheet" type="text/css">
<body> 
<table width="499" height="300" border="0" align="center" cellpadding="0" cellspacing="0" style="filter:progid:DXImageTransform.Microsoft.Gradient(startColorStr='#B9E4FF',endColorStr='#4CABE5',gradientType='0')"> 
  <tr align="center"> 
    <td height="30" colspan="2"><img src="images/affiche.JPG" width="499" height="38"></td> 
  </tr> 
  <%BasetableFactory bf=BasetableFactory.getInstance();
String aid=ParamUtils.getRequestString(request,"aid");
Affiche a=bf.SearchAffiche("WHERE aid='"+aid+"'");if(a!=null&&a.getAid()>0){ %> 
  <tr align="center"> 
    <td height="27" colspan="2"><%=a.getTitle()%></td> 
  </tr> 
  <tr align="left" valign="top"> 
    <td colspan="2">&nbsp;&nbsp;&nbsp;&nbsp;<%=a.getContent()%></td> 
  </tr> 
  <tr align="center"> 
    <td width="40%" height="27">发布人</td> 
    <td width="60%" height="7" align="left">&nbsp;<%=bf.SearchUser("WHERE uid='"+a.getUid()+"'").getName()%></td> 
  </tr> 
  <tr align="center"> 
    <td height="27">发布时间</td> 
    <td height="3" align="left">&nbsp;<%=a.getAtime()%></td> 
  </tr>   <%}%> 
  <tr align="center"> 
    <td height="30" colspan="2"><a onClick="javascript:window.close();"><img src="images/close.gif" border="0"></a></td> 
  </tr> 
</table> 
</body>
</html>
