<%@ page contentType="text/html; charset=GBK" %>
<%@ page import="com.model.User" %>
<%@ page import="com.model.Guestboard" %>
<%@ page import="com.core.*" %>
<%@ page import="java.util.*" %>
<%if (!Crazyadept.UserIsOK(session,FinalConstants.STATUS_ADMIN)) return;%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<title>manage_guestboard</title>
</head>
<link href="../css/admin.css" rel="stylesheet" type="text/css">
<body> 
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="1" class="tableNew"> 
  <tr align="center"> 
    <td height="30" colspan="3" class="TableTitle1" >留言簿</td> 
  </tr> 
  <tr align="center"> 
    <td width="77%" height="27" bgcolor="#FFFFFF">留言标题</td> 
    <td width="11%" bgcolor="#FFFFFF">回复</td> 
    <td width="12%" bgcolor="#FFFFFF">删除</td> 
  </tr> 
  <%BasetableFactory bf=BasetableFactory.getInstance();int submit_page=ParamUtils.getIntParameter(request,"page");
Collection coll=bf.ListGuestboard(submit_page,"ORDER BY gid");if(coll==null||coll.size()<=0){%> 
  <tr align="center"> 
    <td height="27" colspan="3" bgcolor="#FFFFFF">当前留言薄为空</td> 
  </tr> 
  <% }else{ Iterator it=coll.iterator(); while(it.hasNext()){Guestboard a=(Guestboard)it.next();%> 
  <tr align="left"> 
    <td height="27" bgcolor="#FFFFFF"><%=a.getTitle()%></td> 
    <td height="27" align="center" bgcolor="#FFFFFF"> <%if(a.getGflag()==0){%> 
      <a href="add_guestboard.jsp?action=add&gid=<%=a.getGid()%>">未回复</a>       <%}else{%> 
    <a href="info_guestboard.jsp?action=add&gid=<%=a.getGid()%>">已回复</a>      <%}%> </td> 
    <td height="27" align="center" bgcolor="#FFFFFF"><a href="modify_guestboard.jsp?action=del&gid=<%=a.getGid()%>" onClick="javascript:return confirm('你确定删除该条留言吗？')">删除</a></td> 
  </tr>  <%}}%> 
  <tr align="right"> 
    <td height="27" colspan="3" bgcolor="#E9F2F6"><%=HtmlUtils.table(bf.getRow("guestboard ORDER BY gid"),submit_page,"manage_guestboard.jsp")%></td> 
  </tr> 
</table> 
</body>
</html>
