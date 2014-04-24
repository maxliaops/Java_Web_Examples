<%@ page contentType="text/html; charset=GBK" %>
<%@ page import="com.model.User" %>
<%@ page import="com.model.Resolvent" %>
<%@ page import="com.core.*" %>
<%@ page import="java.util.*" %>
<%if (!Crazyadept.UserIsOK(session,FinalConstants.STATUS_ADMIN)) return;%>
<html>
<head>
<link href="../css/admin.css" rel="stylesheet" type="text/css">
<title>manage_resolvent</title>
</head>
<body bgcolor="#ffffff"> 
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="1" class="tableNew"> 
  <tr align="center"> 
    <td colspan="3" class="TableTitle1" >解决方案管理</td> 
  </tr> 
  <tr align="center"> 
    <td colspan="2" bgcolor="#FFFFFF">&nbsp;</td> 
    <td width="30%" bgcolor="#FFFFFF"><a href="add_resolvent.jsp" target="_self" >添加解决方案</a></td> 
  </tr> 
  <tr align="center"> 
    <td height="27" bgcolor="#FFFFFF">解决方案名称</td> 
    <td bgcolor="#FFFFFF">添加时间</td> 
    <td width="30%" bgcolor="#FFFFFF">修改删除</td> 
  </tr> 
  <%BasetableFactory bf=BasetableFactory.getInstance();
int submit_page=ParamUtils.getIntParameter(request,"page");

Collection coll=bf.ListResolvent(submit_page,"");if(coll==null||coll.size()<=0){%> 
  <tr align="center"> 
    <td height="27" colspan="3" bgcolor="#FFFFFF">当前解决方案为空</td> 
  </tr>   <%}else{            Iterator it=coll.iterator();
            while(it.hasNext()){Resolvent a=(Resolvent)it.next();%> 
  <tr align="center"> 
    <td height="27" bgcolor="#FFFFFF"><a href="info_resolvent.jsp?rid=<%=a.getRid()%>"><%=a.getName()%></a></td> 
    <td height="27" bgcolor="#FFFFFF"><%=a.getUptime()%> </td> 
    <td height="27" bgcolor="#FFFFFF"><a href="update_resolvent.jsp?rid=<%=a.getRid()%>"><img src="../images/modify.gif" border="0"></a>&nbsp;&nbsp; <a href="modify_resolvent.jsp?haction=del&rid=<%=a.getRid()%>" onClick="javascript:return confirm('你确定删除解决方案吗？')"><img src="../images/del.gif" border="0"></a></td> 
  </tr>   <%}%> 
  <tr align="right"> 
    <td height="27" colspan="3" bgcolor="#E9F2F6"><%=HtmlUtils.table(bf.getRow("resolvent"),submit_page,"manage_resolvent.jsp")%></td> 
  </tr>   <%}%> 
</table> 
</body>
</html>
