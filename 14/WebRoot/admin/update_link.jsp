<%@ page contentType="text/html; charset=GBK" %>
<%@ page import="com.model.Link" %>
<%@ page import="com.core.*" %>
<%if (!Crazyadept.UserIsOK(session,FinalConstants.STATUS_ADMIN)) return;%>
<html>
<head>
<title>update_link</title>
</head>
<link href="../css/admin.css" rel="stylesheet" type="text/css">
<script src="../js/validate.js"></script>
<body> 
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="1" class="tableNew"> 
  <tr align="center"> 
    <td colspan="2" class="TableTitle1" >友情链接信息修改</td> 
  </tr> 
  <%
BasetableFactory bf=BasetableFactory.getInstance();
String aid=ParamUtils.getRequestString(request,"lid");
Link a=bf.SearchLink("WHERE lid='"+aid+"'");
if(a!=null&&a.getLid()>0){
 %> 
  <form name="form2" method="post" action="modify_link.jsp"> 
    <tr align="center"> 
      <td width="40%" bgcolor="#FFFFFF">链接名称</td> 
      <td width="60%" align="left" bgcolor="#FFFFFF"><input type="text" name="name" value="<%=a.getName()%>" size="40"></td> 
    </tr> 
    <tr align="center"> 
      <td bgcolor="#FFFFFF">链拉地址</td> 
      <td align="left" valign="top" bgcolor="#FFFFFF"><input type="text" name="url" value="<%=a.getUrl()%>" size="50"></td> 
    </tr> 
    <tr align="center"> 
      <td height="3" bgcolor="#FFFFFF">发布时间</td> 
      <td height="3" align="left" bgcolor="#FFFFFF">&nbsp;<%=a.getLtime()%></td> 
    </tr> 
    <tr align="center"> 
      <td height="4" colspan="2" bgcolor="#FFFFFF"> <input type="hidden" name="action" value="modify"> 
        <input type="hidden" name="lid" value="<%=a.getLid()%>"> 
        <input name="Submit" type="submit" class="btn_grey" onClick="return linkss()" value="提交"> 
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
