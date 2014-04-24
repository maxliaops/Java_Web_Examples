<%@ page contentType="text/html; charset=gb2312" %>
<%@ page import="com.model.User" %>
<%@ page import="com.core.*" %>
<%
response.setHeader("Cache-Control","no-cache");
response.setHeader("Cache-Control","no-store");
response.setDateHeader("Expires",0);
response.setHeader("Pragma","no-cache");
User u=null;if (!Crazyadept.UserIsOK(session,FinalConstants.STATUS_ADMIN)) {
    out.println("<script>parent.location.href='../index.jsp';</script>");    return ;}else{    u=(User)session.getAttribute("user");}%>
<%
response.setHeader("Cache-Control","no-cache");
response.setHeader("Cache-Control","no-store");
response.setDateHeader("Expires",0);
response.setHeader("Pragma","no-cache");
if (!Crazyadept.UserIsOK(session,FinalConstants.STATUS_ADMIN)) return;
%>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="../css/style.css" rel="stylesheet" type="text/css">

<table width="776" height="310"  border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td valign="top" background="../images/admin_top1.gif">
	<table width="100%" height="100%" border="0" align="center" cellpadding="0" cellspacing="0" > 
  <tr> 
       <td height="28" colspan="4" align="center"></td>
  </tr> 
  <tr> 
    <td width="426" height="25" align="center">&nbsp;</td> 
    <td width="142" align="center" >当前管理员[<%=u.getUid()%>]</td> 
    <td width="102" align="center"><a href="../index.jsp" target="_parent">返回首页</a></td> 
    <td width="97" align="center"><a href="exit.jsp" target="_parent">安全退出</a></td> 
    <td width="9"></td> 
  </tr> 
  <tr> 
    <td colspan="4" align="center">&nbsp;</td>
  </tr> 
</table>	</td>
  </tr>
</table>