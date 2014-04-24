<%@ page contentType="text/html; charset=GBK" %>
<%@ page import="java.sql.*" %>
<html>
<head>
<title>车辆数据修改处理</title>
</head>
<jsp:useBean id="datas" scope="page" class="cars.Bean1" />
<jsp:useBean id="gets1" scope="page" class="cars.SendGet" />
<jsp:useBean id="adds" scope="page" class="cars.caradd" />
<body bgcolor="#ffffff">
<h1>
<%! int counts;
int logo;
int sum;
%>
<%
gets1.setdata(request.getInputStream(),request.getContentLength());
counts=gets1.getcounts();
logo=Integer.parseInt(gets1.getdatas(2).trim());
%>
<%for(int i=3;i<=counts;i++){%>
<%sum=sum+adds.getupdate(gets1.getformname(i),gets1.getdatas(i),gets1.getdatas(1),logo);%>
<%}%>
<%if(sum==counts-2){%>
<% sum=0; %>
<script language="javascript">
	alert("车辆数据修改成功");
	opener.location.reload();
	window.close();
</script>
<%}else{%>
<% sum=0; %>
<script language="javascript">
	alert("车辆数据修改失败！请验证后重新添加");
</script>
<%}%>
</h1>
</body>
</html>
