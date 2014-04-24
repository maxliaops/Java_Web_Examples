<%@ page contentType="text/html; charset=GBK"%>
<%@ page import="java.util.Collection" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="com.core.BasetableFactory" %>
<%@ page import="com.core.ParamUtils" %>
<%@ page import="com.model.*" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<title>明日科技</title>
<link href="css/css.css" rel="stylesheet" type="text/css">
</head>
<body onLoad="clockon(bgclock)">
<table width="750" border="0" align="center" cellpadding="0" cellspacing="0"  class="tableBorder">
  <tr>
    <td height="165" colspan="3"><jsp:include page="top.jsp"/></td>
  </tr>
  <tr><td height="9pt"></td></tr>
  <tr>
    <td align="left" valign="top">
	<table width="97%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#45B5E3" style="padding-left:5pt;">
        <%int rid=ParamUtils.getIntParameter(request,"rid");
BasetableFactory bf=BasetableFactory.getInstance();
Resolvent r=bf.SearchResolvent("WHERE rid="+rid);
if(r.getRid()<=0){        session.setAttribute("error","查找失败");
        response.sendRedirect("error.jsp");}else{%>
        <tr align="center">
          <td colspan="2" class="TableTitle1">查看解决方案</td>
        </tr>
        <tr align="center">
          <td width="30%" bgcolor="#FFFFFF">方案名称</td>
          <td width="60%" align="left" bgcolor="#FFFFFF"><%=r.getName()%></td>
        </tr>
  <tr align="center">
    <td height="27" bgcolor="#FFFFFF">所属软件类别</td>
    <td align="left" bgcolor="#FFFFFF"><%=bf.SearchSsort("WHERE sid="+r.getSid()).getName()%></td>
  </tr>
  <tr align="center">
    <td height="27" bgcolor="#FFFFFF">实例应用</td>
    <td align="left" bgcolor="#FFFFFF"><%=bf.SearchSoft("WHERE sfid="+r.getSfid()).getName()%></td>
  </tr>
        <tr align="center">
          <td height="27" colspan="2" bgcolor="#FFFFFF">解决方案</td>
        </tr>
        <tr align="left">
          <td colspan="2" bgcolor="#FFFFFF"><%=r.getContent()%></td>
        </tr>
        <tr align="center">
          <td height="2" colspan="2" bgcolor="#FFFFFF"><%String path=bf.SearchHead("WHERE iid='"+r.getIid()+"'").getPath();if(path==null){out.print("无图片");}else{out.print("<img src="+path+" width=530 >");}%></td>
        </tr>
        <tr align="center">
          <td height="3" bgcolor="#FFFFFF">添加人</td>
          <td height="3" align="left" bgcolor="#FFFFFF"><%=((User)bf.SearchUser("WHERE uid='"+r.getUid()+"'")).getName()%></td>
        </tr>
        <tr align="center">
          <td height="2" bgcolor="#FFFFFF">添加时间</td>
          <td height="2" align="left" bgcolor="#FFFFFF"><%=r.getUptime()%></td>
        </tr>
        <tr align="center">
          <td height="6" colspan="2" bgcolor="#FFFFFF">&nbsp;</td>
        </tr>        <%}%>
      </table></td>
  </tr>
  <tr>
    <td width="550" align="left" valign="top">&nbsp;</td>
  <tr>
    <td colspan="3" align="center"><jsp:include page="bottom.jsp"/></td>
  </tr>
</table>
</body>
</html>
