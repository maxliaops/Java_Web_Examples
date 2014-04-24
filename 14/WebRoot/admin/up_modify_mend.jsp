<%@ page contentType="text/html; charset=GBK" %>
<%@ page import="java.io.File" %>
<%@ page import="com.jspsmart.upload.Request" %>
<%@ page import="com.model.Soft" %>
<%@ page import="com.core.*" %>
<jsp:useBean id="up" scope="page" class="com.jspsmart.upload.SmartUpload" /><%
if (!Crazyadept.UserIsOK(session,FinalConstants.STATUS_ADMIN)) return;
session.removeAttribute("error");
int count=0;
up.initialize(pageContext);
try{up.upload();}catch(Exception e){}
Request uprequest=up.getRequest();
String action =uprequest.getParameter("action").toString();
if(action==null||"".equals(action)){
    return;
}else{
    File f=new File(application.getRealPath("/upload")+File.separatorChar+up.getFiles().getFile(0).getFileName());
    if(f.exists()){
        session.setAttribute("error","文件已经存在");
        response.sendRedirect("errorw.jsp");
    }else{
        try { count = up.save("upload"); } catch (Exception e) {}
        if(count==1){
            if(BasetableFactory.getInstance().CreateMend(uprequest,File.separatorChar+up.getFiles().getFile(0).getFileName())){
                response.sendRedirect("manage_mend.jsp");
            }else{
                session.setAttribute("error","软件信息存储失败");
                response.sendRedirect("errorw.jsp");
            }
         }else{
             session.setAttribute("error","上传失败");
             response.sendRedirect("errorw.jsp");
        }
    }
}
%>
