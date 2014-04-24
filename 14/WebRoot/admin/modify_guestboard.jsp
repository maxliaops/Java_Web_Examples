<%@ page contentType="text/html; charset=GBK" %>
<%@ page import="com.model.Guestboard" %>
<%@ page import="com.core.*" %>
<link href="../css/admin.css" rel="stylesheet" type="text/css">
<%
if (!Crazyadept.UserIsOK(session,FinalConstants.STATUS_ADMIN)) return;
session.removeAttribute("error");
String action =request.getParameter("action").toString();
int lid=ParamUtils.getIntParameter(request,"gid");
BasetableFactory bf=BasetableFactory.getInstance();
if(action==null||"".equals(action)){    return;
}else if("del".equals(action)&&bf.DeleteGuestboard("WHERE gid="+lid)){
        response.sendRedirect("manage_guestboard.jsp");
}else if("add".equals(action)){        Guestboard b=bf.SearchGuestboard("WHERE gid="+lid);
        b.setRecontent(ParamUtils.getRequestString(request,"recontent"));
        response.sendRedirect("manage_guestboard.jsp");
}else{        session.setAttribute("error","ÔÚÁôÑÔ²¾ÖÐ²Ù×÷Ê§°Ü");        response.sendRedirect("error.jsp");}
%>
