<%@ page contentType="text/html; charset=GBK" %>
<%@ page import="javax.servlet.http.HttpServletRequest" %>
<%@ page import="com.model.Head" %>
<%@ page import="com.core.*" %>
<%@ page import="com.jspsmart.upload.*" %>
 <jsp:useBean id="up" scope="page" class="com.jspsmart.upload.SmartUpload" /> 
<%if (!Crazyadept.UserIsOK(session,FinalConstants.STATUS_ADMIN)) return;
       session.removeAttribute("error");
%> 
  <table width="100%" height="80%"  border="0" cellpadding="0" cellspacing="0">
  <tr>
     <td height="27"><% 
        int count=0;
		up.initialize(pageContext);
        up.setTotalMaxFileSize(100000);
        up.setAllowedFilesList("gif,jpg");
        try{
			up.upload();
		}catch(Exception e){
			System.out.println("up.upload()时出错！");
		} 
    java.util.Random r=new java.util.Random(System.currentTimeMillis()+1);
        long longr=r.nextLong();
        long longd=System.currentTimeMillis()+longr;
        String name=new Long(longr).toString();
        name=name.replace('-','_');
        File f=up.getFiles().getFile(0);
		System.out.println(f);
		String path="images/ico/"+name+"."+f.getFileExt();
		BasetableFactory bf=BasetableFactory.getInstance();
        if(!f.isMissing()){
              try { f.saveAs(path);} catch (Exception e) {}
                    if(bf.CreateHead(name,path,FinalConstants.STATE_HEAD)){
                        out.println("上传成功");
                }else{
                        session.setAttribute("error","上传失败");
                        response.sendRedirect("errorw.jsp");}
                }%></td>
   </tr>
  <tr>
     <td align="center" valign="bottom"><a style="cursor:hand" onClick="javascript:history.back();">返回上页</a>&nbsp;&nbsp;<a style="cursor:hand" onClick="javascrip:opener.location.reload();window.close();">关闭窗口</a></td>
   </tr>
</table>
