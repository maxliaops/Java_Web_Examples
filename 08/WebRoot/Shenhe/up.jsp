<%@ page language="java" pageEncoding="gb2312"%>
<%@page import="com.hiernate.persistence.*"%>
<jsp:directive.page import="com.hiernate.util.HibernateUtil"/>
<jsp:directive.page import="java.util.*"/>
<jsp:directive.page import="java.text.SimpleDateFormat"/>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<head>
<%
  String strid = request.getParameter("Idd");
  List listShenhe =(List)HibernateUtil.findShenheId(Integer.parseInt(strid));
  if(!listShenhe.isEmpty() && listShenhe.size()>0){
	  for(int i=0;i<listShenhe.size();i++){
	    Shenhe sh = (Shenhe)listShenhe.get(i);
	    sh.setShen("1");
	    HibernateUtil.updateshenhe(sh);
	    response.sendRedirect("piguan.jsp");
	  }}
%>
 </head>