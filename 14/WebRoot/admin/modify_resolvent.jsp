<%@ page contentType="text/html; charset=GBK" %>
<%@ page import="com.model.Resolvent" %>
<%@ page import="com.core.*" %>
<%
if (!Crazyadept.UserIsOK(session,FinalConstants.STATUS_ADMIN)) return;
session.removeAttribute("error");
String action =request.getParameter("haction").toString();
int sfid=ParamUtils.getIntParameter(request,"rid");
BasetableFactory bf=BasetableFactory.getInstance();if(action==null||"".equals(action)){
    return;}else if("del".equals(action)){
    bf.DeleteHead(request,"WHERE iid='"+bf.SearchResolvent("WHERE rid="+sfid).getIid()+"'");
    if(bf.DeleteResolvent("WHERE rid="+sfid)){
        response.sendRedirect("manage_resolvent.jsp");    }else{
        session.setAttribute("error","删除解决方案失败");
        response.sendRedirect("error.jsp");    }}else if("modify".equals(action)){
    Resolvent s=bf.SearchResolvent("WHERE rid="+sfid);
    s.setName(ParamUtils.getRequestString(request,"name"));
    s.setSid(ParamUtils.getIntParameter(request,"sid"));
    s.setSfid(ParamUtils.getIntParameter(request,"sfid"));
    s.setContent(ParamUtils.getRequestString(request,"content"));
    response.sendRedirect("manage_resolvent.jsp");}else{    session.setAttribute("error","对解决方案详细信息修改失败");
    response.sendRedirect("error.jsp");}
%>
