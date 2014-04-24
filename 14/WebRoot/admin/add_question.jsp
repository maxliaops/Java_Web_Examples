<%@ page contentType="text/html; charset=GBK" %>
<%@ page import="com.core.*" %>
<%if (!Crazyadept.UserIsOK(session,FinalConstants.STATUS_ADMIN)) return;%>
<html>
<head>
<title>add_question</title>
</head>
<link href="../css/admin.css" rel="stylesheet" type="text/css">
<script src="../js/validate.js"></script>
<body> 
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="1" class="tableNew"> 
  <tr align="center"> 
    <td colspan="2" class="TableTitle1" >添加常见问题</td> 
  </tr> 
  <form name="form2" method="post" action="modify_question.jsp"> 
    <tr align="center"> 
      <td width="24%" bgcolor="#FFFFFF">添加问题</td> 
      <td width="76%" align="left" bgcolor="#FFFFFF"> <input name="question" type="text" size="70"> </td> 
    </tr> 
    <tr align="center"> 
      <td height="27" bgcolor="#FFFFFF">添加回答</td> 
      <td align="left" bgcolor="#FFFFFF"> <textarea name="answer" cols="70" rows="7" class="textarea"></textarea></td> 
    </tr> 
    <tr align="center"> 
      <td height="27" colspan="2" bgcolor="#FFFFFF"> <input type="hidden" name="action" value="add"> 
        <input name="Submit" type="submit" class="btn_grey" onClick="return questions()" value="提交"> 
&nbsp;&nbsp; 
      <input name="Submit2" type="reset" class="btn_grey" value="重置"></td> 
    </tr> 
  </form> 
</table> 
<table width="98%"  border="0" cellspacing="0" cellpadding="0"> 
  <tr> 
    <td height="50" colspan="5" align="right"><a href="#" onClick="Jscript:history.back()">返回</a></td> 
  </tr> 
</table> 
</body>
</html>
