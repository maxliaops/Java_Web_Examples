<%@ page language="java" pageEncoding="gb2312"%>
<%@ page import="java.util.*"%>
<jsp:directive.page import="com.hiernate.util.HibernateUtil"/>
<jsp:directive.page import="com.hiernate.persistence.TongXunAdd"/>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<head>
<%
   String strid = request.getParameter("IDS");
   System.out.print(strid);
   List listTx = HibernateUtil.findTonId(Integer.parseInt(strid));
    if(!listTx.isEmpty() && listTx.size()>0){
    	for(int i =0;i<listTx.size();i++){
    		TongXunAdd txa = (TongXunAdd)listTx.get(i);
    		HibernateUtil.deleteTongxun(txa);
    	}
    }
  %>
  <%
	response.sendRedirect("tongxun_xianshi.jsp");
  %>
</head>