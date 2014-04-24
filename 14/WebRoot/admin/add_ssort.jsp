<%@ page contentType="text/html; charset=GBK" %>
<%@ page import="com.core.*" %>
<%if (!Crazyadept.UserIsOK(session,FinalConstants.STATUS_ADMIN)) return;%>
<html>
<head>
<title>add_ssort</title>
</head>
<link href="../css/admin.css" rel="stylesheet" type="text/css">
<body> 
<script src="../js/validate.js"></script> 
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="1" class="tableNew"> 
  <tr align="center"> 
    <td colspan="2" class="TableTitle1" >添加软件类别</td> 
  </tr> 
  <form name="form2" method="post" action="modify_ssort.jsp"> 
    <tr align="center"> 
      <td width="30%" bgcolor="#FFFFFF">类别名称</td> 
      <td width="60%" align="left" bgcolor="#FFFFFF"> <input name="name" type="text" size="40"> </td> 
    </tr> 
    <tr align="center"> 
      <td height="27" bgcolor="#FFFFFF">类别简介</td> 
      <td align="left" bgcolor="#FFFFFF"> <input name="resume" type="text" size="50"> </td> 
    </tr> 
    <tr align="center"> 
      <td height="27" colspan="2" bgcolor="#FFFFFF"> <input type="hidden" name="action" value="add"> 
        <input name="Submit" type="submit" class="btn_grey"  onClick="return ssort()" value="提交"> 
&nbsp;&nbsp; 
      <input name="Submit2" type="reset" class="btn_grey" value="重置"> </td> 
    </tr> 
  </form> 
</table> 
<table width="80%"  border="0" cellspacing="0" cellpadding="0"> 
  <tr> 
    <td height="50" colspan="5" align="right"><a href="#" onClick="Jscript:history.back()">返回</a></td> 
  </tr> 
</table> 
</body>
</html>
