<%@ page contentType="text/html; charset=GBK" %>
<%@ page import="com.model.New" %>
<%@ page import="com.core.*" %>
<%@ page import="java.util.*" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<title>info_new</title>
</head>
<link href="../css/admin.css" rel="stylesheet" type="text/css">
<body bgcolor="#ffffff"> 
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="1" class="tableNew"> 
  <tr align="center"> 
    <td colspan="2" class="TableTitle1" >新闻详细信息</td> 
  </tr>   <%BasetableFactory bf=BasetableFactory.getInstance();String nid=ParamUtils.getRequestString(request,"nid");
			New n=bf.SearchNew("WHERE nid='"+nid+"'");if(n!=null&&n.getNid()>0){ %> 
  <tr align="center"> 
    <td width="20%" bgcolor="#FFFFFF">新闻标题</td> 
    <td width="60%" align="left" bgcolor="#FFFFFF">&nbsp;<%=n.getTitle()%> </td> 
  </tr> 
  <tr align="center"> 
    <td height="100" bgcolor="#FFFFFF">新闻内容</td> 
    <td align="left" valign="top" bgcolor="#FFFFFF">&nbsp;&nbsp;&nbsp;<%=n.getContent()%> </td> 
  </tr> 
  <tr align="center"> 
    <td height="4" bgcolor="#FFFFFF">摘自</td> 
    <td height="4" align="left" bgcolor="#FFFFFF">&nbsp;<%=n.getFromto()%></td> 
  </tr> 
  <tr align="center"> 
    <td height="3" bgcolor="#FFFFFF">发布人</td> 
    <td height="3" align="left" bgcolor="#FFFFFF">&nbsp;<%=bf.SearchUser("WHERE uid='"+n.getUid()+"'").getName()%></td> 
  </tr> 
  <tr align="center"> 
    <td height="7" bgcolor="#FFFFFF">发布时间</td> 
    <td height="7" align="left" bgcolor="#FFFFFF">&nbsp;<%=n.getNtime()%></td> 
  </tr> 		<%}%> 
</table> 
<table width="80%"  border="0" cellspacing="0" cellpadding="0"> 
  <tr> 
    <td height="50" colspan="5" align="right"><a href="#" onClick="Jscript:history.back()">返回</a></td> 
  </tr> 
</table> 
</body>
</html>
