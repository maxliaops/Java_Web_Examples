<%@ page contentType="text/html; charset=GBK" %>
<%@ page import="com.model.Affiche" %>
<%@ page import="com.core.*" %>
<link href="../css/admin.css" rel="stylesheet" type="text/css">
<%if (!Crazyadept.UserIsOK(session,FinalConstants.STATUS_ADMIN)) return;
session.removeAttribute("error");
String action =request.getParameter("action").toString();
int aid=ParamUtils.getIntParameter(request,"aid");
BasetableFactory bf=BasetableFactory.getInstance();
if(action==null||"".equals(action)){
    return;}else if("add".equals(action)&&bf.CreateAffiche(request)){
        response.sendRedirect("manage_affiche.jsp");
}else if("del".equals(action)&&bf.DeleteAffiche("WHERE aid="+aid)){
        response.sendRedirect("manage_affiche.jsp");}else if("modify".equals(action)){
        Affiche a=bf.SearchAffiche("WHERE aid="+aid);        a.setTitle(ParamUtils.getRequestString(request,"title"));
        a.setContent(ParamUtils.getRequestString(request,"content"));
        response.sendRedirect("manage_affiche.jsp");
}else{        session.setAttribute("error","在公告信息中操作失败");
        response.sendRedirect("error.jsp");
}
%>
