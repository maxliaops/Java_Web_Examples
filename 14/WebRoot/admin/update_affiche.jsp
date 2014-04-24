<%@ page contentType="text/html; charset=GBK" %>
<%@ page import="com.model.Affiche" %>
<%@ page import="com.core.*" %>
<%if (!Crazyadept.UserIsOK(session,FinalConstants.STATUS_ADMIN)) return;%>
<html>
<head>
<title>update_affiche</title>
</head>
<link href="../css/admin.css" rel="stylesheet" type="text/css">
<script src="../js/validate.js"></script>
<body> 
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="1" class="tableNew"> 
  <tr align="center"> 
    <td colspan="2" class="TableTitle1" >公告详细信息修改</td> 
  </tr> 
  <%
BasetableFactory bf=BasetableFactory.getInstance();
String aid=ParamUtils.getRequestString(request,"aid");
Affiche a=bf.SearchAffiche("WHERE aid='"+aid+"'");
if(a!=null&&a.getAid()>0){
 %> 
  <form name="form2" method="post" action="modify_affiche.jsp"> 
    <tr align="center"> 
      <td width="40%" bgcolor="#FFFFFF">公告标题</td> 
      <td width="60%" align="left" bgcolor="#FFFFFF"><input type="text" name="title" value="<%=a.getTitle()%>"></td> 
    </tr> 
    <tr align="center"> 
      <td height="100" bgcolor="#FFFFFF">公告内容</td> 
      <td align="left" valign="top" bgcolor="#FFFFFF"><textarea name="content" cols="50" rows="8" class="textarea"><%=a.getContent()%></textarea></td> 
    </tr> 
    <tr align="center"> 
      <td height="7" bgcolor="#FFFFFF">发布人</td> 
      <td height="7" align="left" bgcolor="#FFFFFF">&nbsp;<%=bf.SearchUser("WHERE uid='"+a.getUid()+"'").getName()%></td> 
    </tr> 
    <tr align="center"> 
      <td height="3" bgcolor="#FFFFFF">发布时间</td> 
      <td height="3" align="left" bgcolor="#FFFFFF">&nbsp;<%=a.getAtime()%></td> 
    </tr> 
    <tr align="center"> 
      <td height="4" colspan="2" bgcolor="#FFFFFF"> <input type="hidden" name="action" value="modify"> 
        <input type="hidden" name="aid" value="<%=a.getAid()%>"> 
        <input name="Submit" type="submit" class="btn_grey" onClick="return affiche()" value="提交"> 
&nbsp;&nbsp; 
      <input name="Submit2" type="reset" class="btn_grey" value="重置"></td> 
    </tr> 
  </form> 
</table> 
<%}%> 
<table width="80%"  border="0" cellspacing="0" cellpadding="0"> 
  <tr> 
    <td height="50" colspan="5" align="right"><a href="#" onClick="Jscript:history.back()">返回</a></td> 
  </tr> 
</table> 
</body>
</html>
