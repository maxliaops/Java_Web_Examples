<%@ page contentType="text/html; charset=GB2312" %>
<%@ page import="com.bwm.db.Data" %>
<%@ page import="com.bwm.page.Show" %>
<html>
<head>
<title>
login
</title>
</head>
<body>
<%
String strName=(String)request.getParameter("name");
String strPassword=(String)request.getParameter("password");
Data data=new Data();
Show show=new Show();
int intT=0;
if(strName!=null||strPassword!=null){
    intT=data.getRowCount("tb_admin WHERE admin='"+strName+"' AND password='"+strPassword+"'");
    if(intT>0){
	session.setAttribute("admin",strName);
	response.sendRedirect("admin.jsp");
    }else{
	out.print(show.errorBox("请检查你的用户名密码！","验证信息"));
	return;
    }
}else{
    out.print(show.errorBox("请检查你的用户名密码！","验证信息"));
    return;
}
%>
</body>
</html>
