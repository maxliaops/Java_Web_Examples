<%@ page contentType="text/html; charset=GBK" %>
<%@ page import="com.model.User" %>
<%@ page import="com.model.Link" %>
<%@ page import="com.core.*" %>
<%@ page import="java.util.*" %>
<%if (!Crazyadept.UserIsOK(session,FinalConstants.STATUS_ADMIN)) return;%>
<html>
<head>
<link href="../css/admin.css" rel="stylesheet" type="text/css">
<title>manage_link</title>
</head>
<body bgcolor="#ffffff"> 
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="1" class="tableNew"> 
  <tr align="center"> 
    <td colspan="4" class="TableTitle1" >友情链接管理</td> 
  </tr> 
  <tr align="center"> 
    <td colspan="3" bgcolor="#FFFFFF">&nbsp;</td> 
    <td bgcolor="#FFFFFF"><a href="add_link.jsp" target="_self" >添加链接</a></td> 
  </tr> 
  <tr align="center"> 
    <td height="27" bgcolor="#FFFFFF">链接名称</td> 
    <td bgcolor="#FFFFFF">链接地址</td> 
    <td bgcolor="#FFFFFF">添加时间</td> 
    <td width="30%" bgcolor="#FFFFFF">修改删除</td> 
  </tr> 
  <%BasetableFactory bf=BasetableFactory.getInstance();int submit_page=ParamUtils.getIntParameter(request,"page");
Collection coll=bf.ListLink(submit_page,"");if(coll==null||coll.size()<=0){%> 
  <tr align="center"> 
    <td height="27" colspan="4" bgcolor="#FFFFFF">当前链接记录为空</td> 
  </tr>   <%        }else{Iterator it=coll.iterator();            while(it.hasNext()){
                Link a=(Link)it.next();%> 
  <tr align="center"> 
    <td height="27" bgcolor="#FFFFFF"><%=a.getName()%></td> 
    <td bgcolor="#FFFFFF"><%=a.getUrl()%></td> 
    <td bgcolor="#FFFFFF"><%=a.getLtime()%> </td> 
    <td bgcolor="#FFFFFF"><a href="update_link.jsp?action=modify&lid=<%=a.getLid()%>"><img src="../images/modify.gif" border="0"></a>&nbsp;&nbsp; <a href="modify_link.jsp?action=del&lid=<%=a.getLid()%>" onClick="javascript:return confirm('你确定删除该友情链接吗？')"><img src="../images/del.gif" border="0"></a></td> 
  </tr>   <%}%> 
  <tr align="right"> 
    <td height="27" colspan="4" bgcolor="#E9F2F6"><%=HtmlUtils.table(bf.getRow("link"),submit_page,"manage_link.jsp")%></td> 
  </tr>   <%}%> 
</table> 
</body>
</html>
