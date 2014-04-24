<%@ page contentType="text/html; charset=gb2312"%>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<jsp:useBean id="data" scope="session" class="cars.Bean1" />
<%!
	String sql;
	String type;
	String content;
%>
<% request.setCharacterEncoding("gb2312");%>
<%
type=request.getParameter("action");
content=request.getParameter("content");
if(type.equals("future")){
	sql="update tb_News set Content='"+content+"' where Title='未来展望'";
	int i=data.getint(sql);
	if(i>0){
%>
<script language="javascript">
	alert("信息更新成功");
	location.href="Manage.jsp?id=7";
</script>
<%
	}
}
else{
	sql="update tb_News set Content='"+content+"' where Title='历史回顾'";
	int i=data.getint(sql);
	if(i>0){
%>
<script language="javascript">
	alert("信息更新成功");
	location.href="Manage.jsp?id=7";
</script>
<%
	}
}
%>
