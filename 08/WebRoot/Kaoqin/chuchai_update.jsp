<%@ page language="java" pageEncoding="gb2312"%>
<%@ page import="java.util.*"%>
<%@page import="com.hiernate.persistence.Chuchai"%>
<jsp:directive.page import="com.hiernate.util.HibernateUtil"/>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<head>
<%
  List listChuchai = HibernateUtil.findchuchai(Integer.parseInt(request.getParameter("id"))); //调用出差的条件查询方法
    if(!listChuchai.isEmpty() && listChuchai.size()>0){
  	  for(int j=0;j<listChuchai.size();j++){
  		  Chuchai chuchai = (Chuchai)listChuchai.get(j);
  		  chuchai.setState("1");
          HibernateUtil.updateChuchai(chuchai);          //调用修改方法
            }
    }
    response.sendRedirect("chuchai_index.jsp?currPage="+request.getParameter("currPage"));  //重定向到chuchai_index.jsp页面
	%>
</head>




