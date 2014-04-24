<%@ page contentType="text/html; charset=GBK" %>
<%@ page import="com.model.Link" %>
<%@ page import="com.core.*" %>
<%
if (!Crazyadept.UserIsOK(session,FinalConstants.STATUS_ADMIN)) return;
session.removeAttribute("error");
String action =request.getParameter("action").toString();
int lid=ParamUtils.getIntParameter(request,"lid");
BasetableFactory bf=BasetableFactory.getInstance();
if(action==null||"".equals(action)){
    return;}else if("add".equals(action)&&bf.CreateLink(request)){
        response.sendRedirect("manage_link.jsp");}else if("del".equals(action)&&bf.DeleteLink("WHERE lid="+lid)){
        response.sendRedirect("manage_link.jsp");}else if("modify".equals(action)){
        Link l=bf.SearchLink("WHERE lid="+lid);
        l.setName(ParamUtils.getRequestString(request,"name"));
        l.setUrl(ParamUtils.getRequestString(request,"url"));        response.sendRedirect("manage_link.jsp");}else{
        session.setAttribute("error","在友情链接中操作失败");
        response.sendRedirect("error.jsp");
}
%>
