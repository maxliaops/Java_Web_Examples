<%@ page language="java" pageEncoding="gb2312"%>
<%@ page import="java.util.*"%>
<jsp:directive.page import="com.hiernate.util.*,com.hiernate.persistence.*;"/>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<head>
	<title></title>
	<%
	
	
	    
    int link=Integer.parseInt(request.getParameter("link"));
    int currPage=Integer.parseInt(request.getParameter("currPage"));
   
    if(link==1){
   				 if(currPage!=1){
  				  currPage=currPage-1;
  			
   			 }}
    
    
 	String strid = request.getParameter("id");
	System.out.print(strid);
	List list = HibernateUtil.findT(Integer.parseInt(strid));
	if(list != null){
		for(int i=0;i<list.size();i++){
			Tongxun txa = (Tongxun)list.get(i);
			 HibernateUtil.deleTx(txa);
		}
	}	
		%>
 <script language="javascript">
  opener.location.reload();
  alert("通讯组删除成功!!");
  </script>
<%

response.sendRedirect("tongxun_index.jsp?currPage="+currPage);

%>
</head>