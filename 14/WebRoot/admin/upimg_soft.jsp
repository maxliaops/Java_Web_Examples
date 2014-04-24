<%@ page contentType="text/html; charset=GBK" %>
<%@ page import="com.core.*" %>
<%@ page import="com.jspsmart.upload.*" %>
<%if (!Crazyadept.UserIsOK(session,FinalConstants.STATUS_ADMIN)) return;%>
<jsp:useBean id="up" scope="page" class="com.jspsmart.upload.SmartUpload" />
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<body>
<table width="100%" height="80%"  border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td height="27"><%        session.removeAttribute("error");
        int count=0;        up.initialize(pageContext);
		up.setTotalMaxFileSize(1000000);
  		up.setAllowedFilesList("gif,jpg"); 
	       try{up.upload();}catch(Exception e){}
        BasetableFactory bf=BasetableFactory.getInstance();
    java.util.Random r=new java.util.Random(System.currentTimeMillis()+1);
        long longr=r.nextLong();
        long longd=System.currentTimeMillis()+longr;
        String name=new Long(longr).toString();
        name=name.replace('-','_');
        File f=up.getFiles().getFile(0);
        String path="images/soft/"+name+"."+f.getFileExt();
        if(!f.isMissing()){
            try {  f.saveAs(path); } catch (Exception e) {}
                    if(bf.CreateHead(name,path,FinalConstants.STATE_SOFT)){
                        out.println("上传成功");
                    }else{
                        session.setAttribute("error","上传失败");
                        response.sendRedirect("errorw.jsp");}
                }%></td>
  </tr>
  <tr>
    <td align="center" valign="bottom"><a style="cursor:hand" onClick="javascrip:opener.document.forms.ico.src='../<%=path%>';opener.document.forms.iid.value='<%=name%>';window.close();"><img src="../images/close.gif" border="0"></a></td>
  </tr>
</table>
</body>
</html>
