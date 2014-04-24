<%@ page contentType="text/html; charset=GB2312" %>
<%@ page import="electric.electricUtils.ParamUtils"%>
<%
  String formName=ParamUtils.getEscapeHTMLParameter(request,"formname","");
  String controlName=ParamUtils.getEscapeHTMLParameter(request,"controlname","");
  String imageHandle=ParamUtils.getEscapeHTMLParameter(request,"imagename","");
%>
<html>
<head>
<meta http-equiv="Content-Language" content="zh-cn">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<meta name="GENERATOR" content="Microsoft FrontPage 4.0">
<meta name="ProgId" content="FrontPage.Editor.Document">
<title>上传图片</title>
</head>

<body>

<form method="POST" action="upimg_upload.jsp" ENCTYPE="multipart/form-data">
  <p>&nbsp;aYAYA 图片上传工具<br>
  <br>
  选择要上传的文件：<input type="file" name="UPIMG" size="40"></p>
  <p>
  <input type="hidden" name="formname" value="<%=formName%>">
  <input type="hidden" name="controlname" value="<%=controlName%>">
  <input type="hidden" name="imagename" value="<%=imageHandle%>">

  <input type="submit" value="开始上传" name="B1"><input type="button" value="取消返回" name="B2"></p>
</form>

</body>

</html>
