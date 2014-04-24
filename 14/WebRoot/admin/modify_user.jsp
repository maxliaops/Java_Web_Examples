<%@ page contentType="text/html; charset=GBK" %>
<%@ page import="com.model.User" %>
<%@ page import="com.core.*" %>
<%
if (!Crazyadept.UserIsOK(session,FinalConstants.STATUS_ADMIN)) return;
String uid=ParamUtils.getRequestString(request,"uid");
int status=ParamUtils.getIntParameter(request,"status",-1);
int state=ParamUtils.getIntParameter(request,"state",-1);
User user=BasetableFactory.getInstance().SearchUser("where uid='"+uid+"'");
session.removeAttribute("error");
if(uid==null){
    return;
}else if(state!=-1){
    user.setState(state);
	response.sendRedirect("manage_user.jsp");
}else if(status!=-1){
    user.setStatus(status); 
	response.sendRedirect("manage_user.jsp");
	}else{
   		return;
}
%>
