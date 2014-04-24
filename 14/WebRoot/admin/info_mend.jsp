<%@ page contentType="text/html; charset=GBK" %>
<%@ page import="com.model.Mend" %>
<%@ page import="com.core.*" %>
<%@ page import="java.util.*" %>
<%if (!Crazyadept.UserIsOK(session,FinalConstants.STATUS_ADMIN)) return;%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<title>info_new</title>
</head>
<link href="../css/admin.css" rel="stylesheet" type="text/css">
<body bgcolor="#ffffff">
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="1" class="tableNew">
  <tr align="center">
    <td colspan="2" class="TableTitle1" >工具软件详细信息</td>
  </tr>   <%BasetableFactory bf=BasetableFactory.getInstance();int nid=ParamUtils.getIntParameter(request,"mid");
Mend n=bf.SearchMend("WHERE mid="+nid);if(n!=null&&n.getMid()>0){%>
  <tr align="center">
    <td width="20%" bgcolor="#FFFFFF">软件名称</td>
    <td width="60%" align="left" bgcolor="#FFFFFF"><%=n.getName()%> </td>
  </tr>
  <tr align="center">
    <td bgcolor="#FFFFFF">软件类别</td>
    <td align="left" bgcolor="#FFFFFF"><%=bf.SearchSsort("where sid="+n.getSid()).getName()%></td>
  </tr>
  <tr align="center">
    <td height="4" bgcolor="#FFFFFF">软件类型</td>
    <td height="4" align="left" bgcolor="#FFFFFF"><%=n.getState()==FinalConstants.STATE_MEND?"补丁":"工具"%></td>
  </tr>
  <tr align="center">
    <td height="1" bgcolor="#FFFFFF">推荐指数</td>
    <td height="0" align="left" bgcolor="#FFFFFF"><% for(int i=0;i<n.getCommend();i++){out.print("<img src='../images/star.gif'>");}%></td>
  </tr>
  <tr align="center">
    <td height="2" bgcolor="#FFFFFF">程序大小</td>
    <td height="0" align="left" bgcolor="#FFFFFF"><%=n.getFilesize()%></td>
  </tr>
  <tr align="center">
    <td height="3" bgcolor="#FFFFFF">上传时间</td>
    <td height="0" align="left" bgcolor="#FFFFFF"><%=n.getUptime()%></td>
  </tr>
  <tr align="center">
    <td height="3" bgcolor="#FFFFFF">下载次数</td>
    <td height="3" align="left" bgcolor="#FFFFFF"><%=n.getLoadnum()%></td>
  </tr>
  <tr align="center">
    <td height="80" bgcolor="#FFFFFF">其他介绍</td>
    <td height="7" align="left" valign="top" bgcolor="#FFFFFF">&nbsp;&nbsp;&nbsp;&nbsp;<%=n.getResume()%></td>
  </tr>   <%}%>
</table>
<table width="80%"  border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="50" colspan="5" align="right"><a href="#" onClick="Jscript:history.back()">返回</a></td>
  </tr>
</table>
</body>
</html>
