<%@ page language="java" pageEncoding="gb2312"%>
<%@ page import="java.util.*"%>
<jsp:directive.page import="com.hiernate.util.*,com.hiernate.persistence.*"/>

<head>
<%
    List listQing = HibernateUtil.findQingjia(Integer.parseInt(request.getParameter("id")));
    if(!listQing.isEmpty() && listQing.size()>0){
  	  for(int j=0;j<listQing.size();j++){
  		  Qingjia qingjia = (Qingjia)listQing.get(j);
  		  qingjia.setState("1");
          HibernateUtil.updateQingjia(qingjia);
            }
    }
    response.sendRedirect("qingjia_index.jsp?currPage="+request.getParameter("currPage"));
	%>
</head>