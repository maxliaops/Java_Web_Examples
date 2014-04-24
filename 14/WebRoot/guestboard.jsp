<%@ page contentType="text/html; charset=GBK" %>
<%@ page import="java.util.Collection" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="com.core.*" %>
<%@ page import="com.model.Guestboard" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<title>明日科技</title>
<link href="css/css.css" rel="stylesheet" type="text/css">
</head>
<body> 
<table width="750" border="0" align="center" cellpadding="0" cellspacing="0"  class="tableBorder6"> 
  <tr> 
    <td height="165" colspan="3"><jsp:include page="top.jsp"/></td> 
  </tr> 
  <tr> 
    <td width="200" rowspan="2" align="left" valign="top"><jsp:include page="left.jsp"/></td> 
    <td width="20" rowspan="2">&nbsp;</td> 
    <td width="540"  align="center" valign="top"><table width="100%" border="1" align="center" cellpadding="0" cellspacing="0" class="tableBorder2"> 
        <tr align="center"> 
          <td height="30" colspan="2" class="TableTitle1" >留言信息</td> 
        </tr> 
        <%int gid=ParamUtils.getIntParameter(request,"gid");
BasetableFactory bf=BasetableFactory.getInstance();Guestboard a=bf.SearchGuestboard("WHERE gid="+gid);
if(a.getGid()<=0){%> 
        <tr align="center"> 
          <td height="27" colspan="2">当前留言为空</td> 
        </tr>         <%}else{%> 
        <tr align="center"> 
          <td width="36%" height="27">留言标题</td> 
          <td width="64%" align="left"><%=a.getTitle()%></td> 
        </tr> 
        <tr align="left"> 
          <td height="13" align="center">留言时间</td> 
          <td height="0" align="left"><%=a.getGtime()%></td> 
        </tr> 
        <tr align="left"> 
          <td height="14" align="center">留&nbsp;言&nbsp;人</td> 
          <td height="0" align="left"><%=a.getGuest()%></td> 
        </tr> 
        <tr align="left"> 
          <td height="60" align="center">留言内容</td> 
          <td height="0" align="left" valign="top">&nbsp;&nbsp;&nbsp;&nbsp;<%=a.getContent()%></td> 
        </tr> 
        <tr align="left"> 
          <td height="50" align="center">回复内容</td> 
          <td height="0" align="left" valign="top">&nbsp;&nbsp;&nbsp;&nbsp;<%=a.getRecontent()%></td> 
        </tr> 
        <tr align="left"> 
          <td height="27" align="center">回复时间</td> 
          <td height="0" align="left">&nbsp;<%=a.getRtime()%></td> 
        </tr><%}%> 
        <tr align="right"> 
          <td height="27" colspan="2"><a class="delink" onClick="javascript:history.back()" href="#">返回</a></td> 
        </tr> 
    </table></td> 
  </tr> 
  <tr> 
    <td>&nbsp;</td> 
  </tr> 
  <tr> 
    <td colspan="3" align="center"><jsp:include page="bottom.jsp"/></td> 
  </tr> 
</table> 
</body>
</html>
