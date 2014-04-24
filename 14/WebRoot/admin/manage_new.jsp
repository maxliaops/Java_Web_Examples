<%@ page contentType="text/html; charset=GBK" %>
<%@ page import="com.model.User" %>
<%@ page import="com.model.New" %>
<%@ page import="com.core.*" %>
<%@ page import="java.util.*" %>
<%if (!Crazyadept.UserIsOK(session,FinalConstants.STATUS_ADMIN)) return;%>
<html>
<head>
<title>manage_new</title>
</head>
<link href="../css/admin.css" rel="stylesheet" type="text/css">
<body> 
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="1" class="tableNew"> 
  <tr align="center"> 
    <td colspan="5" class="TableTitle1" >新闻管理</td> 
  </tr> 
  <tr align="center"> 
    <td colspan="4" bgcolor="#FFFFFF">&nbsp;</td> 
    <td bgcolor="#FFFFFF"><a href="add_new.jsp" target="_self" >添加新闻</a></td> 
  </tr> 
  <tr align="center"> 
    <td height="27" bgcolor="#FFFFFF">新闻标题</td> 
    <td bgcolor="#FFFFFF">发布时间</td> 
    <td bgcolor="#FFFFFF">发布人</td> 
    <td bgcolor="#FFFFFF">摘自</td> 
    <td width="30%" bgcolor="#FFFFFF">删除</td> 
  </tr>   <%BasetableFactory bf=BasetableFactory.getInstance();int submit_page=ParamUtils.getIntParameter(request,"page");
        Collection coll=bf.ListNew(submit_page,"");if(coll==null||coll.size()<=0){%> 
  <tr align="center"> 
    <td height="27" colspan="5" bgcolor="#FFFFFF">当前新闻记录为空</td> 
  </tr>   <%}else{Iterator it=coll.iterator();while(it.hasNext()){          New n=(New)it.next();%> 
  <tr align="center"> 
    <td height="27" bgcolor="#FFFFFF"><a target="_self" href="info_new.jsp?nid=<%=n.getNid()%>"><%=n.getTitle()%></a></td> 
    <td bgcolor="#FFFFFF"><%=n.getNtime()%></td> 
    <td bgcolor="#FFFFFF"><%=bf.SearchUser("WHERE uid='"+n.getUid()+"'").getName()%> </td> 
    <td bgcolor="#FFFFFF"><%=ParamUtils.nullToString(n.getFromto(),"无")%></td> 
    <td bgcolor="#FFFFFF"><a href="modify_new.jsp?action=del&nid=<%=n.getNid()%>" onClick="javascript:return confirm('你确定删除该新闻吗？')"><img src="../images/del.gif" border="0"></a></td> 
  </tr>   <%}%> 
  <tr align="right"> 
    <td height="27" colspan="5" bgcolor="#E9F2F6"><%=HtmlUtils.table(bf.getRow("new"),submit_page,"manage_new.jsp")%></td> 
  </tr>   <%}%> 
</table> 
</body>
</html>
