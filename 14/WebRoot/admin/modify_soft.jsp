<%@ page contentType="text/html; charset=GBK" %>
<%@ page import="com.model.Soft" %>
<%@ page import="com.core.*" %>
<%
if (!Crazyadept.UserIsOK(session,FinalConstants.STATUS_ADMIN)) return;
session.removeAttribute("error");
String action =request.getParameter("action").toString();
int sfid=ParamUtils.getIntParameter(request,"sfid");
BasetableFactory bf=BasetableFactory.getInstance();
if(action==null||"".equals(action)){
    return;
}else if("del".equals(action)){
    bf.DeleteHead(request,"WHERE iid='"+bf.SearchSoft("WHERE sfid="+sfid).getIid()+"'");
    if(bf.DeleteSoft(request,"WHERE sfid="+sfid)){
	     response.sendRedirect("manage_soft.jsp");
    }else{
	    session.setAttribute("error","删除软件信息失败");
        response.sendRedirect("error.jsp");
	}
}else if("modify".equals(action)){
    Soft s=bf.SearchSoft("WHERE sfid="+sfid);
    s.setName(ParamUtils.getRequestString(request,"name"));
    s.setEdition(ParamUtils.getRequestString(request, "edition"));
    s.setPrice(new Float(ParamUtils.getRequestString(request,"price")).floatValue());
    s.setSid(ParamUtils.getIntParameter(request,"sid"));
    s.setEnvironment(ParamUtils.getRequestString(request,"environment"));
    s.setFilesize(ParamUtils.getIntParameter(request,"filesize"));
    s.setCommend(ParamUtils.getIntParameter(request,"commend"));
    s.setRegular(ParamUtils.getIntParameter(request,"regular"));
    s.setIntroduce(ParamUtils.getRequestString(request,"introduce"));
    s.setResume(ParamUtils.getRequestString(request,"resume"));
    response.sendRedirect("manage_soft.jsp");
}else{
    session.setAttribute("error","对软件详细信息修改失败");
    response.sendRedirect("error.jsp");
}
%>
