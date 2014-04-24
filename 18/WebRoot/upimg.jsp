<%@ page contentType="text/html; charset=gb2312" %>
<%@ page import="electric.electricUtils.ParamUtils"%>
<%
  String formName=ParamUtils.getEscapeHTMLParameter(request,"formname","");
  String controlName=ParamUtils.getEscapeHTMLParameter(request,"controlname","");
  String imageHandle=ParamUtils.getEscapeHTMLParameter(request,"imagename","");
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="style.css" rel="stylesheet">
<title>上传图片</title>
</head>

<body>
<table width="100%"  border="0" cellspacing="0" cellpadding="0" height="161">
  <tr>
    <td height="33" bgcolor="#eeeeee" style="padding:10px; ">  图片上传工具
	</td>
  </tr>
  <tr>
    <td height="128" style="padding:10px; ">
<form method="POST" action="upimg_upload.jsp" ENCTYPE="multipart/form-data">
  选择要上传的文件：<br>
<input name="UPIMG" type="file" size="40">
<br>
<br>

  <input type="hidden" name="formname" value="<%=formName%>">
  <input type="hidden" name="controlname" value="<%=controlName%>">
  <input type="hidden" name="imagename" value="<%=imageHandle%>">
  <input name="B1" type="submit" class="btn_grey" value="开始上传">
  &nbsp;
  <input name="B2" type="button" class="btn_grey" value="取消返回">

</form>	</td>
  </tr>
</table>

</body>

</html>
