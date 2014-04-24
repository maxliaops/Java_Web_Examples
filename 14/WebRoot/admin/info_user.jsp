<%@ page contentType="text/html; charset=GBK"%>
<%@ page import="com.model.User" %>
<%@ page import="com.model.Head" %>
<%@ page import="com.core.*" %>
<%@ page import="java.util.*" %>
<%if (!Crazyadept.UserIsOK(session,FinalConstants.STATUS_ADMIN)) return;%>
<html>
<head>
<title>info_user</title>
</head>
<link href="../css/admin.css" rel="stylesheet" type="text/css">
<body> <%String uid=ParamUtils.getRequestString(request,"uid");User u=BasetableFactory.getInstance().SearchUser("WHERE uid='"+uid+"'");
session.removeAttribute("error");if(u.getUid()==null||"".equals(u.getUid())){        session.setAttribute("error","查询失败");
        response.sendRedirect("error.jsp");}else{%> 
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="1" class="tableNew"> 
  <tr align="center"> 
    <td height="40" colspan="2" class="TableTitle1">用户注册详细信息</td> 
  </tr> 
  <tr> 
    <td width="239" height="27" bgcolor="#FFFFFF">用户ID</td> 
    <td width="391" bgcolor="#FFFFFF"><%=ParamUtils.nullToString(u.getUid(),"无")%></td> 
  </tr> 
  <tr> 
    <td height="27" bgcolor="#FFFFFF">真实姓名</td> 
    <td bgcolor="#FFFFFF"><%=ParamUtils.nullToString(u.getName(),"无")%></td> 
  </tr> 
  <tr> 
    <td height="27" bgcolor="#FFFFFF">取回密码提示</td> 
    <td bgcolor="#FFFFFF"><%=ParamUtils.nullToString(u.getRegqu(),"无")%></td> 
  </tr> 
  <tr> 
    <td height="27" bgcolor="#FFFFFF">取回密码回答</td> 
    <td bgcolor="#FFFFFF"><%=ParamUtils.nullToString(u.getReganswer(),"无")%></td> 
  </tr> 
  <tr> 
    <td height="27" bgcolor="#FFFFFF">性别</td> 
    <td bgcolor="#FFFFFF"><%=u.getSex()==1?"男":"女"%></td> 
  </tr> 
  <tr> 
    <td height="27" bgcolor="#FFFFFF">年龄</td> 
    <td bgcolor="#FFFFFF"><%=u.getAge()%></td> 
  </tr> 
  <tr> 
    <td height="27" bgcolor="#FFFFFF">电话</td> 
    <td bgcolor="#FFFFFF"><%=ParamUtils.nullToString(u.getTel(),"无")%></td> 
  </tr> 
  <tr> 
    <td height="27" bgcolor="#FFFFFF">Email</td> 
    <td bgcolor="#FFFFFF"><%=ParamUtils.nullToString(u.getEmail(),"无")%></td> 
  </tr> 
  <tr> 
    <td height="27" bgcolor="#FFFFFF">QQ</td> 
    <td bgcolor="#FFFFFF"><%=ParamUtils.nullToString(u.getQq(),"无")%></td> 
  </tr> 
  <tr> 
    <td height="27" bgcolor="#FFFFFF">个人地址</td> 
    <td bgcolor="#FFFFFF"><%=ParamUtils.nullToString(u.getAddress(),"无")%></td> 
  </tr> 
  <tr> 
    <td height="27" bgcolor="#FFFFFF">个人主页</td> 
    <td bgcolor="#FFFFFF"><%=ParamUtils.nullToString(u.getHttp(),"无")%></td> 
  </tr> 
  <tr> 
    <td height="27" bgcolor="#FFFFFF">注册时间</td> 
    <td bgcolor="#FFFFFF"><%=u.getRegtime()%></td> 
  </tr> 
  <tr> 
    <td height="27" bgcolor="#FFFFFF">权限级别</td> 
    <td bgcolor="#FFFFFF"><%=u.getStatus()==FinalConstants.STATUS_ADMIN?"管理员":"普通用户"%></td> 
  </tr> 
  <tr> 
    <td height="27" bgcolor="#FFFFFF">状态显示</td> 
    <td bgcolor="#FFFFFF"><%=u.getState()==FinalConstants.STATE_FREE?"正常":"冻结"%></td> 
  </tr> 
  <tr> 
    <td height="60" bgcolor="#FFFFFF">个人简介</td> 
    <td valign="top" bgcolor="#FFFFFF">&nbsp;&nbsp;&nbsp;&nbsp;<%=ParamUtils.nullToString(u.getResume(),"无")%></td> 
  </tr> 
  <tr> 
    <td height="50" bgcolor="#FFFFFF">头像</td> 
    <td bgcolor="#FFFFFF"><%if(u.getIid()==null||"".equals(u.getIid())){        out.print("未选择");
}else{    Head h=BasetableFactory.getInstance().SearchHead("WHERE iid='"+u.getIid()+"'");
    out.print("<img  width=60 height=60 src='../"+h.getPath()+"'>");}%></td> 
  </tr> 
  <tr align="center"> 
    <td height="22" colspan="2" bgcolor="#FFFFFF">&nbsp;</td> 
  </tr> 
</table> 
<table width="80%"  border="0" cellspacing="0" cellpadding="0"> 
  <tr> 
    <td height="50" colspan="5" align="right"><a href="#" onClick="Jscript:history.back()">返回</a></td> 
  </tr> 
</table> <%}%> 
</body>
</html>
