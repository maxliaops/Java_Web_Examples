<%@ page contentType="text/html; charset=GBK" %>
<%@ page import="com.model.Mend" %>
<%@ page import="com.core.*" %>
<link href="../css/admin.css" rel="stylesheet" type="text/css">
<%
if (!Crazyadept.UserIsOK(session,FinalConstants.STATUS_ADMIN)) return;
session.removeAttribute("error");
String action =request.getParameter("action").toString();
int lid=ParamUtils.getIntParameter(request,"mid");
BasetableFactory bf=BasetableFactory.getInstance();
if(action==null||"".equals(action)){
    return;
}else if("del".equals(action)&&bf.DeleteMend(request,"WHERE mid="+lid)){
        response.sendRedirect("manage_mend.jsp");
}else if("modify".equals(action)){
		Mend l=bf.SearchMend("WHERE mid="+lid);
        l.setName(ParamUtils.getRequestString(request,"name"));
        l.setResume(ParamUtils.getRequestString(request,"resume"));
        l.setSid(ParamUtils.getIntParameter(request,"sid"));
        l.setState(ParamUtils.getIntParameter(request,"state"));
        l.setCommend(ParamUtils.getIntParameter(request,"commend"));
        l.setFilesize(ParamUtils.getIntParameter(request,"filesize"));
        response.sendRedirect("manage_mend.jsp");
}else{        session.setAttribute("error","在工具软件中操作失败");
        response.sendRedirect("error.jsp");
}
%>
