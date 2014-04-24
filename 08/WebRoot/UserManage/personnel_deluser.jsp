<%@ page language="java" pageEncoding="gb2312"%>
<%@ page import="java.util.List"%>
<%@page import="com.hiernate.persistence.*"%>
<jsp:directive.page import="com.hiernate.util.HibernateUtil"/>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<head>

	<title>删除用户页面</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
 <link href="../style.css" rel="stylesheet">
</head>
 <%
   int link=Integer.parseInt(request.getParameter("link"));
    int currPage=Integer.parseInt(request.getParameter("currPage"));
   
    if(link==1){
   				 if(currPage!=1){
  				  currPage=currPage-1;
  			
   			 }}
  String strid = request.getParameter("ID");
  List listUser =(List)HibernateUtil.findUserId(Integer.parseInt(strid));
  if(!listUser.isEmpty() && listUser.size()>0){
	  for(int i=0;i<listUser.size();i++){
	    User user = (User)listUser.get(i);
	    HibernateUtil.deleUser(user);
	    }}
  %>
   <script language="javascript">
         alert("信息删除成功!")
         window.location.href="personnel_info.jsp?currPage="+<%=currPage%>;
   </script>
	 
	