<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<jsp:useBean id="connDB" scope="page" class="beans.connDB"/>
<jsp:useBean id="chStr" scope="page" class="beans.chStr"/>
<jsp:include page="safe.jsp"/>
<html>
<head>
<title>用户注册成功!</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body>
<%
String username=chStr.chStr(request.getParameter("UserName"));
if (username!=null && username.length()>0 ){
	String truename=chStr.chStr(request.getParameter("TrueName"));
	String PWD=chStr.chStr(request.getParameter("PWD2"));
	String cardNO=chStr.chStr(request.getParameter("cardNO"));
	String CardType=chStr.chStr(request.getParameter("CardType"));
	String tel=chStr.chStr(request.getParameter("tel"));
	String city=chStr.chStr(request.getParameter("city"));
	String address=chStr.chStr(request.getParameter("address"));
	String postcode=chStr.chStr(request.getParameter("postcode"));
	String Email=chStr.chStr(request.getParameter("Email"));
	int ret=0;
	String sql="update tb_Member set Truename='"+truename+"',password='"+PWD+"',cardNO='"+cardNO+"',CardType='"+CardType+"',tel='"+tel+"',city='"+city+"',address='"+address+"',postcode='"+postcode+"',email='"+Email+"' where username='"+username+"'";
	ret=connDB.executeUpdate(sql);
	if(ret!=0){
	out.println("<script language='javascript'>alert('资料修改成功！');window.location.href='index.jsp';</script>");
	}else{
	out.println("<script language='javascript'>alert('资料修改失败！');window.location.href='modify.jsp';</script>");
	}
}else{
	response.sendRedirect("index.jsp");
}

%>
</body>
</html>
