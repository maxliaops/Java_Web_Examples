<%@ page contentType="text/html; charset=gb2312" import="java.sql.*"%>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<jsp:useBean id="data" scope="session" class="cars.Bean1" />
<%!
	String sql;
	int id;
	int i;
%>
<%
	request.setCharacterEncoding("gb2312");
	id=Integer.parseInt(request.getParameter("id"));
	sql="delete tb_News where ID="+id;
	i=data.getint(sql);
	if(i>0){
%>
 <script language="javascript">
 	alert("新闻信息删除成功");
	window.close();
	opener.location.reload();
 </script>
<%}%>

