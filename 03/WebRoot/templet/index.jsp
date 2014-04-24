<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<base href="<%=basePath%>">   
<%
String path1=request.getServletPath();
path1 = path1.substring(1);
path1=path1.substring(0, path1.indexOf("/"));

response.sendRedirect("userInfo_goinUser.htm?account="+path1+"");

%>
