<%@ page contentType="text/html; charset=GBK" %>
<%@ page import="com.model.User" %>
<%@ page import="com.model.Affiche" %>
<%@ page import="com.core.*" %>
<%@ page import="java.util.*" %>
<%
response.setHeader("Cache-Control","no-cache");
response.setHeader("Cache-Control","no-store");
response.setDateHeader("Expires",0);
response.setHeader("Pragma","no-cache");
if (!Crazyadept.UserIsOK(session,FinalConstants.STATUS_ADMIN)) {    out.println("<script>parent.location.href='../index.jsp';</script>");
    return ;}%>
<html>
<head>
<title>manage_affiche</title>
</head>
<link href="../css/admin.css" rel="stylesheet" type="text/css">
<body> 
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="1" class="tableNew"> 
  <tr align="center"> 
    <td colspan="4" class="TableTitle1" >公告管理</td> 
  </tr> 
  <tr align="center"> 
    <td colspan="3" bgcolor="#FFFFFF">&nbsp;</td> 
    <td bgcolor="#FFFFFF"><a href="add_affiche.jsp" target="_self" >添加公告</a></td> 
  </tr> 
  <tr align="center"> 
    <td height="27" bgcolor="#FFFFFF">公告标题</td> 
    <td bgcolor="#FFFFFF">发布时间</td> 
    <td bgcolor="#FFFFFF">发布人</td> 
    <td width="30%" bgcolor="#FFFFFF">修改删除</td> 
  </tr>   <%BasetableFactory bf=BasetableFactory.getInstance();int submit_page=ParamUtils.getIntParameter(request,"page");
        Collection coll=bf.ListAffiche(submit_page,"");if(coll==null||coll.size()<=0){%> 
  <tr align="center"> 
    <td height="27" colspan="4" bgcolor="#FFFFFF">当前公告记录为空</td> 
  </tr>   <%}else{Iterator it=coll.iterator(); while(it.hasNext()){
        Affiche a=(Affiche)it.next();%> 
  <tr align="center"> 
    <td height="27" bgcolor="#FFFFFF"><a target="_self" href="info_affiche.jsp?aid=<%=a.getAid()%>"><%=a.getTitle()%></a></td> 
    <td bgcolor="#FFFFFF"><%=a.getAtime()%></td> 
    <td bgcolor="#FFFFFF"><%=bf.SearchUser("WHERE uid='"+a.getUid()+"'").getName()%> </td> 
    <td bgcolor="#FFFFFF"><a href="update_affiche.jsp?action=modify&aid=<%=a.getAid()%>"><img src="../images/modify.gif" border="0"></a>&nbsp;&nbsp;<a href="modify_affiche.jsp?action=del&aid=<%=a.getAid()%>" onClick="javascript:return confirm('你确定删除该公告吗？')"><img src="../images/del.gif" border="0"></a></td> 
  </tr>   <%}%> 
  <tr align="right"> 
    <td height="27" colspan="4" bgcolor="#E9F2F6"><%=HtmlUtils.table(bf.getRow("affiche"),submit_page,"manage_affiche.jsp")%></td> 
  </tr>   <%}%> 
</table> 
</body>
</html>
