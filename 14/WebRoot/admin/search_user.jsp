<%@ page contentType="text/html; charset=GBK" %>
<%@ page import="com.model.User" %>
<%@ page import="com.core.*" %>
<%@ page import="java.util.*" %>
<%if (!Crazyadept.UserIsOK(session,FinalConstants.STATUS_ADMIN)) return;%>
<html>
<head>
<title>find_user</title>
</head><link href="../css/admin.css" rel="stylesheet" type="text/css">
<body bgcolor="#ffffff"> 
<form name="form1" method="post" action="manage_user.jsp"> 
  <table width="98%" border="0" cellpadding="0" cellspacing="1" class="tableNew"> 
    <tr align="center"> 
      <td height="27" colspan="3" class="TableTitle1">用户查找</td> 
    </tr> 
    <tr> 
      <td width="585" height="81" rowspan="3" align="center" bgcolor="#FFFFFF"> <select name="select"> 
          <option value="uid">用户ID</option> 
          <option value="name">真实姓名</option> 
          <option value="age">用户年龄</option> 
          <option value="tel">用户电话</option> 
          <option value="email">电子邮件</option> 
          <option value="qq">OICQ</option> 
          <option value="address">个人地址</option> 
          <option value="http">个人主页</option> 
        </select> 
&nbsp;&nbsp; 
        <input type="text" name="value"></td> 
      <td width="334" bgcolor="#FFFFFF"><input name="sex" type="checkbox" class="noborder" value="1"> 
        男 &nbsp;&nbsp;&nbsp;&nbsp; 
        <input name="sex" type="checkbox" class="noborder" value="0"> 
        女</td> 
      <td width="99" rowspan="3" align="center" bgcolor="#FFFFFF"><input type="image" class="noborder" src="../images/search.gif"> 
    <input type="hidden" value="submit" name="submit"></td>
    </tr> 
    <tr> 
      <td bgcolor="#FFFFFF"> <input name="status" type="checkbox" class="noborder" value="1"> 
        管理员
        <input name="status" type="checkbox" class="noborder" value="0"> 
        普通用户</td> 
    </tr> 
    <tr> 
      <td bgcolor="#FFFFFF"><input name="state" type="checkbox" class="noborder" value="1"> 
        被冻结
        <input name="state" type="checkbox" class="noborder" value="0"> 
        正常 </td> 
    </tr> 
  </table> 
</form> 
</body>
</html>
