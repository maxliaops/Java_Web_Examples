<%@ page contentType="text/html; charset=GBK" %>
<%@ page import="com.core.*" %>
<%if (!Crazyadept.UserIsOK(session,FinalConstants.STATUS_ADMIN)) return;%>
<html>
<head>
<title>up_head</title>
</head>
<link href="../css/admin.css" rel="stylesheet" type="text/css">
<body  >
<table width="100%"  border="0" cellpadding="0" cellspacing="0" class="tableNew" >
  <tr align="center">
    <td class="TableTitle1">上传用户头像</td>
  </tr>
  <form name="form1" enctype="multipart/form-data" method="post" action="upimg_head.jsp">
    <tr align="center">
      <td bgcolor="#FFFFFF"><img src="../images/ico/select.gif"></td>
    </tr>
    <tr align="center">
      <td height="50" bgcolor="#FFFFFF" class="Redfont">注意：只能上传“*.gif”与“*.jpg”的头像,文件不能大于100KB</td>
    </tr>
    <tr align="center">
      <td height="40" bgcolor="#FFFFFF"><input type="file" name="file">
&nbsp;&nbsp;
      <input name="Submit" type="submit" class="btn_grey" value="开始上传"></td>
    </tr>
  </form>
</table>
</body>
</html>
