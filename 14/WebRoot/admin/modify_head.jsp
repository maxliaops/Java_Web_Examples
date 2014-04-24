<%@ page contentType="text/html; charset=GBK" %>
<%@ page import="com.model.Head" %>
<%@ page import="com.core.*" %>
<%
if (!Crazyadept.UserIsOK(session,FinalConstants.STATUS_ADMIN)) return;
session.removeAttribute("error");
String action =request.getParameter("action").toString();
String lid=ParamUtils.getRequestString(request,"iid");
BasetableFactory bf=BasetableFactory.getInstance();
if(action==null||"".equals(action)){
    return;}else if("del".equals(action)&&bf.DeleteHead(request,"WHERE iid='"+lid+"'")){
        response.sendRedirect("manage_head.jsp");}else{
        session.setAttribute("error","在删除头像中操作失败");
        response.sendRedirect("error.jsp");
}
%>
