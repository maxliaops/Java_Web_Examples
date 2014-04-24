<%@ page language="java" pageEncoding="gb2312"%>
<%@ page import="java.util.*"%>
<jsp:directive.page import="com.hiernate.util.*,com.hiernate.persistence.*;"/>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<head>
	<html:base />
	<title>企业计划管理页面</title>
<%
   int link=Integer.parseInt(request.getParameter("link"));
    int currPage=Integer.parseInt(request.getParameter("currPage"));
   
    if(link==1){
   				 if(currPage!=1){
  				  currPage=currPage-1;
  			
   			 }}
  String strid = request.getParameter("Id");
  System.out.print(strid);
  List listqiye = HibernateUtil.findqiye(Integer.parseInt(strid));
	  if(!listqiye.isEmpty()&&listqiye.size()>0){
		  for(int i=0; i<listqiye.size();i++){
			  Qiye qiye = (Qiye)listqiye.get(i);
			  HibernateUtil.deleqiye(qiye);
		  }
	}
%>
 <script language="javascript">
 opener.location.reload();
 {alert("企业计划信息删除成功!")}
 
</script>
<%
  response.sendRedirect("qiye_planindex.jsp?currPage="+currPage);
%>
</head>