<%@ page contentType="text/html; charset=GBK" %>
<%@ page import="com.model.New" %>
<%@ page import="com.core.*" %>
<link href="../css/admin.css" rel="stylesheet" type="text/css"><%
if (!Crazyadept.UserIsOK(session,FinalConstants.STATUS_ADMIN)) return;
session.removeAttribute("error");
String action =request.getParameter("action").toString();
int nid=ParamUtils.getIntParameter(request,"nid");
BasetableFactory bf=BasetableFactory.getInstance();
if(action==null||"".equals(action)){    return;}else if("add".equals(action)&&bf.CreateNew(request)){
        response.sendRedirect("manage_new.jsp");
}else if("del".equals(action)&&bf.DeleteNew("WHERE nid="+nid)){
        response.sendRedirect("manage_new.jsp");
}else{        session.setAttribute("error","在公告信息中操作失败");
        response.sendRedirect("error.jsp");
}
%>
