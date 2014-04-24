<%@ page language="java" pageEncoding="gb2312"%>
<%@page import="com.hiernate.persistence.*"%>
<jsp:directive.page import="com.hiernate.util.HibernateUtil"/>
<jsp:directive.page import="java.util.*"/>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<head>
<%
    int link=Integer.parseInt(request.getParameter("link"));
    int currPage=Integer.parseInt(request.getParameter("currPage"));
   
    if(link==1){
   				 if(currPage!=1){
  				  currPage=currPage-1;
  			
   			 }}
    
  String strid = request.getParameter("id");
  List listShenhe =(List)HibernateUtil.findShenheId(Integer.parseInt(strid));
  if(!listShenhe.isEmpty() && listShenhe.size()>0){
	  for(int i=0;i<listShenhe.size();i++){
	    Shenhe sh = (Shenhe)listShenhe.get(i);
	    HibernateUtil.deleshenhe(sh);                //调用删除方法
	    response.sendRedirect("piguan.jsp?currPage="+currPage);
	  }}
       %>
</head>