<%@ page contentType="text/html; charset=GBK" %>
<%@ page import="com.core.BasetableFactory" %>
<%@ page import="com.model.User" %>
<%@ page import="com.core.*" %>
<%
response.setHeader("Cache-Control","no-cache");
response.setHeader("Cache-Control","no-store");
response.setDateHeader("Expires",0);
response.setHeader("Pragma","no-cache");
String action =request.getParameter("action").toString();
String uid,password;
BasetableFactory bf=BasetableFactory.getInstance();
session.removeAttribute("error");
uid=ParamUtils.getRequestString(request,"uid");
if(action==null||"".equals(action)||uid==null||"".equals(uid)){
    return;
}else if("reg".equals(action)){
    if("".equals(uid)||uid.length()<=0){
        session.setAttribute("error","不允许特殊字符");
        response.sendRedirect("error.jsp");
    }else if(!"".equals(ParamUtils.nullToString(bf.SearchUser("where uid='"+uid+"'").getUid()))){
        session.setAttribute("error","用户存在");
        response.sendRedirect("error.jsp");
    }else if(bf.CreateUser(request)){     //调用BasetableFactory中的方法CreateUser方法插入数据
        response.sendRedirect("user_logon.jsp");
    }else{
        session.setAttribute("error","注册失败");
        response.sendRedirect("error.jsp");
    }
}else if("logon".equals(action)){
        password=ParamUtils.getRequestString(request,"password");
        session.removeAttribute("user");
        User u=bf.SearchUser("where uid='"+uid+"' and password='"+password+"'");
        if(u.getUid()==null){
            session.setAttribute("error","用户名或密码错误");
            response.sendRedirect("error.jsp");
        }else if(u.getState()==FinalConstants.STATE_FREEZE){
            session.setAttribute("error","被冻结");
            response.sendRedirect("error.jsp");
        }else if(uid!=null&&!"".equals(uid)&&u.getStatus()==FinalConstants.STATUS_ADMIN){
            session.setAttribute("user",u);
            response.sendRedirect("admin/index.jsp");
        }else if((uid!=null&&!"".equals(uid)&&u.getStatus()==FinalConstants.STATUS_USER)){
            session.setAttribute("user",u);
            response.sendRedirect("index.jsp");
        }else{
            session.setAttribute("error","用户名或密码错误");
            response.sendRedirect("error.jsp");
        }
}else if("modify".equals(action)){
        String reganswer=ParamUtils.getRequestString(request,"reganswer");
        String regqu=ParamUtils.getRequestString(request,"regqu");
        if(!"".equals(uid)&&"".equals(regqu)){
                User u=bf.SearchUser("WHERE uid='"+uid+"'");
                request.setAttribute("user",u);
                RequestDispatcher rd=request.getRequestDispatcher("user_return.jsp");
                rd.forward(request,response);
        }else if(reganswer!=null&&!"".equals(reganswer)&&regqu!=null&&!"".equals(regqu)){
                User u=bf.SearchUser("WHERE reganswer='"+reganswer+"' AND uid='"+uid+"' AND regqu='"+regqu+"'");
                if(u!=null&&u.getUid()!=null){
                        request.setAttribute("re",u);
                        RequestDispatcher rd=request.getRequestDispatcher("user_return.jsp");
                        rd.forward(request,response);
                }else{
                        session.setAttribute("error","找回密码失败");
                        response.sendRedirect("error.jsp");
                }
        }
}else  if("updates".equals(action)){
        User u=bf.SearchUser("WHERE uid='"+uid+"'");
        if(u==null||"".equals(u.getUid())){
                session.setAttribute("error","用户修改失败");
                response.sendRedirect("error.jsp");
        }else{
                u.setPassword(ParamUtils.getRequestString(request,"password"));
                u.setName(ParamUtils.getRequestString(request,"name"));
                u.setRegqu(ParamUtils.getRequestString(request,"regqu"));
                u.setReganswer(ParamUtils.getRequestString(request,"reganswer"));
                u.setAge(ParamUtils.getIntParameter(request,"age",24));
				u.setSex(ParamUtils.getIntParameter(request,"sex",0));
                u.setTel(ParamUtils.getRequestString(request,"tel"));
                u.setEmail(ParamUtils.getRequestString(request,"email"));
                u.setQq(ParamUtils.getRequestString(request,"qq"));
                u.setAddress(ParamUtils.getRequestString(request,"address"));
                u.setHttp(ParamUtils.getRequestString(request,"http"));
                u.setResume(ParamUtils.getRequestString(request,"resume"));
                u.setIid(ParamUtils.getRequestString(request,"iid"));
                response.sendRedirect("user_logon.jsp");
        }
}else{
    return;
}
%>
