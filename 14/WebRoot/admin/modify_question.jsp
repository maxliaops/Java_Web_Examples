<%@ page contentType="text/html; charset=GBK" %>
<%@ page import="com.model.Question"%>
<%@ page import="com.core.*" %>
<link href="../css/admin.css" rel="stylesheet" type="text/css">
<%if (!Crazyadept.UserIsOK(session,FinalConstants.STATUS_ADMIN)) return;
session.removeAttribute("error");String action =request.getParameter("action").toString();
int lid=ParamUtils.getIntParameter(request,"qid");
BasetableFactory bf=BasetableFactory.getInstance();
if(action==null||"".equals(action)){    return;
}else if("add".equals(action)&&bf.CreateQuestion(request)){        response.sendRedirect("manage_question.jsp");
}else if("del".equals(action)&&bf.DeleteQuestion("WHERE qid="+lid)){
        response.sendRedirect("manage_question.jsp");
}else {        session.setAttribute("error","在常见问题中操作失败");        response.sendRedirect("error.jsp");}
%>
