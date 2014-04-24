<%@ page contentType="text/html; charset=GBK" %>
<%@ page import="com.jspsmart.upload.Request" %>
<%@ page import="com.model.Head" %>
<%@ page import="com.core.*" %>
<%@ page import="com.jspsmart.upload.*" %>
<jsp:useBean id="up" scope="page" class="com.jspsmart.upload.SmartUpload" /><%
if (!Crazyadept.UserIsOK(session,FinalConstants.STATUS_ADMIN)) return;
session.removeAttribute("error");int count=0;up.initialize(pageContext);
try{up.upload();}catch(Exception e){}
    java.util.Random r=new java.util.Random(System.currentTimeMillis()+1);
        long longr=r.nextLong();        long longd=System.currentTimeMillis()+longr;
        String name=new Long(longr).toString();        name=name.replace('-','_');
        File f=up.getFiles().getFile(0);        String path="images/resolvent/"+name+"."+f.getFileExt();
Request uprequest=up.getRequest();
BasetableFactory bf=BasetableFactory.getInstance();
if(!f.isMissing()){
        try { f.saveAs(path);} catch (Exception e) {}
            if(!bf.CreateHead(name,path,FinalConstants.STATE_RESOLVENT)){
                    session.setAttribute("error","添加解决方案图片失败");
                    response.sendRedirect("errorw.jsp");
                }
        }
        if(bf.CreateResolvent(uprequest,name)){ response.sendRedirect("manage_resolvent.jsp");
        }else{ session.setAttribute("error","添加解决方案失败"); response.sendRedirect("errorw.jsp");
        }%>
