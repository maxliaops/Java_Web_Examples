<%@ page contentType="text/html; charset=GBK" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*"%>
<html>
<head>
<title>车辆数据添加处理</title>
</head>
<jsp:useBean id="datas" scope="page" class="cars.Bean1" />
<jsp:useBean id="gets" scope="page" class="cars.SendGet" />
<jsp:useBean id="add" scope="page" class="cars.caradd" />
<body bgcolor="#ffffff">
<h1>
<%! int counts;
int logo;
int sum;
%>
<%
gets.setdata(request.getInputStream(),request.getContentLength());
counts=gets.getcounts();
logo=add.getmax();%>
<%
for(int i=2;i<=counts;i++){
         sum=sum+add.getint(gets.getformname(i),gets.getdatas(i),gets.getdatas(1),logo);
}
%>
<%
if(sum==counts-1){
sum=0;
 %>
<script language="javascript">
	alert("车辆数据添加成功!");
	window.close();
	opener.location.reload();
</script>
<%}else{%>
<% sum=0; %>
<script language="javascript">
	alert("车辆数据添加失败！请验证后重新添加");
	history.back();
</script>
<%}%>
</h1>
</body>
</html>
