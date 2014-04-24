<%@ page import="com.bwm.page.Show" %>
<%
if(session.getAttribute("admin")==null){
	out.print(new Show().errorBox("你还没有登录","警告信息"));
	return;
}
%>