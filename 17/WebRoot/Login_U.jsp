<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<jsp:useBean id="connDB" scope="page" class="beans.connDB"/>
<jsp:useBean id="chStr" scope="page" class="beans.chStr"/>
<%
String username=chStr.chStr(request.getParameter("username"));//此处必须进行编码转换，否则输入中文用户名时将出现乱码
try{
	ResultSet rs=connDB.executeQuery("select * from tb_Member where username='"+username+"' and freeze=0");
	if(rs.next()){
		String PWD=request.getParameter("PWD");
		if(PWD.equals(rs.getString("password"))){
			session.setAttribute("UserName",username);
			response.sendRedirect("index.jsp");
		}else{
			out.println("<script language='javascript'>alert('您输入的用户名或密码错误，请与管理员联系!');window.location.href='index.jsp';</script>");
		}
	}else{
			out.println("<script language='javascript'>alert('您输入的用户名或密码错误，或您的帐户已经被冻结，请与管理员联系!');window.location.href='index.jsp';</script>");
	}
}catch(Exception e){
	out.println("<script language='javascript'>alert('您的操作有误!');window.location.href='index.jsp';</script>");
}
%>
