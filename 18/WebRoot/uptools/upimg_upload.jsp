<%@ page contentType="text/html; charset=GB2312" %>
<%@ page import="electric.electricUtils.ParamUtils"%>
<%@ page import="com.jspsmart.upload.*"%>
<%
	String uploadedPathName="";//
        String uploadedFileName="";
	double uploadedFileSize=0;
	boolean bSuccessed=false;
	boolean bControl=true;
	com.jspsmart.upload.SmartUpload mySmartUpload=new com.jspsmart.upload.SmartUpload();

	// 初始化，在JSP中参数必须是pageContext
	mySmartUpload.initialize(pageContext);

	// 执行上传操作
	mySmartUpload.upload();

	// 遍历文件集合
	for (int i=0;i<mySmartUpload.getFiles().getCount();i++){

		// 取得集合中的当前文件
		com.jspsmart.upload.File myFile = mySmartUpload.getFiles().getFile(i);

		// isMissing判断文件上传是否有错误，如果没有错误返回true,否则返回false
		if (!myFile.isMissing()&&i==0) {

			// 文件换名保存到文件夹中
            java.util.Random rnd=new java.util.Random(new java.util.Date().getTime()+1);
			long lRand=rnd.nextLong();
			long tRand=new java.util.Date().getTime();
			String strRand=new Long(lRand).toString()+new Long(tRand).toString();
			uploadedPathName="/uploads/kxi_"+strRand+"."+myFile.getFileExt();
			uploadedFileName="kxi_"+strRand+"."+myFile.getFileExt();
            uploadedPathName=uploadedPathName.replace('-','_');
			uploadedFileName=uploadedFileName.replace('-','_');

			myFile.saveAs(uploadedPathName);
			//  显示文件属性
			uploadedFileSize=myFile.getSize()/1024;
			bSuccessed=true;
			break;
		}
	}
	// 取得所有控件的值
	String formName=mySmartUpload.getRequest().getParameter("formname");
	String controlName=mySmartUpload.getRequest().getParameter("controlname");
	String imageHandle=mySmartUpload.getRequest().getParameter("imagename");
	if(formName==null)
	{
	  formName="";
	}
	if(controlName==null)
	{
	  controlName="";
	}
	if(imageHandle==null)
	{
	  imageHandle="";
	}
	if(formName.trim().equals("")||controlName.trim().equals("")||imageHandle.trim().equals(""))
	{
	  bControl=false;
	}

%>
<html>

<head>
<meta http-equiv="Content-Language" content="zh-cn">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<meta name="GENERATOR" content="Microsoft FrontPage 4.0">
<meta name="ProgId" content="FrontPage.Editor.Document">
<title>图片上传完成</title>
<style>
<!--
  td,th,tr,table,body{font-size:9pt}
-->
</style>
<script language="javascript">
<!--
  function ImgOk()
  {
  	opener.document.<%=formName%>.<%=controlName%>.value='<%=uploadedPathName%>';
  	opener.document.<%=formName%>.<%=imageHandle%>.src='<%=uploadedPathName%>';
  	window.close();


  }
//-->
</script>
</head>

<body>
<%

  if(bSuccessed)
  {
%>
<table border="1" cellpadding="3" cellspacing="0" width="400">
  <tr>
    <td width="390" colspan="4" height="24">
      <p align="center">图片上传成功</td>
  </tr>
  <tr>
    <td width="91" height="18">上传后文件名：</td>
    <td width="74" height="18"><%=uploadedFileName%>　</td>
    <td width="110" height="18">文件大小(KB)：</td>
    <td width="91" height="18"><%=uploadedFileSize%></td>
  </tr>
  <tr>
    <td width="390" height="92" colspan="4"><img border="0" src="<%=uploadedPathName%>" width="383" height="256"></td>
  </tr>
  <tr>
  <%
    if(bControl)
    {
  %>
    <td width="390" height="19" colspan="4"><input type="button" name="btn" value="确定并返回" onclick="JavaScript:ImgOk();"></td>
   <%
    }
     else
     {
   %>
   <td width="390" height="19" colspan="4"><input type="button" name="btn" value="确定并返回" onclick="JavaScript:window.close();">></td>

   <%
     }
   %>
  </tr>
</table>
<%
   }
   else
   {
%>
   图像上传失败！<BR><BR><BR><BR>
   <input type="button" name="btn" value="关闭窗口" onclick="JavaScript:window.close();">>
<%
    }
%>
</body>

</html>
