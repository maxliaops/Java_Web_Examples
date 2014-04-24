<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="java.lang.*"%>
<jsp:useBean id="connDB" scope="page" class="beans.connDB"/>
<jsp:useBean id="chStr" scope="page" class="beans.chStr"/>
<jsp:include page="safe.jsp"/>
<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body>
<%
if(request.getParameter("ISBN")!=""){
	String ISBN=chStr.chStr(request.getParameter("ISBN"));
	String bookname=chStr.chStr(request.getParameter("bookname"));
	String writer=chStr.chStr(request.getParameter("writer"));
	String type=chStr.chStr(request.getParameter("type"));	
	String TPI=chStr.chStr(request.getParameter("TPI"));
	String pDate=chStr.chStr(request.getParameter("pDate"));
	String cover=chStr.chStr(request.getParameter("cover"));
	float price=Float.valueOf(request.getParameter("price")).floatValue();	
	int commend=Integer.parseInt(request.getParameter("commend"));
	int newbook=Integer.parseInt(request.getParameter("newbook"));
	String introduce=chStr.chStr(request.getParameter("introduce"));
	if(introduce.equals("")) introduce="暂无";
	String sql="update tb_bookinfo set BookName='"+bookname+"',Type='"+type+"',publisher='"+TPI+"',writer='"+writer+"',Introduce='"+introduce+"',price="+price+",pDate='"+pDate+"',cover='"+cover+"',newbook="+newbook+",commend="+commend+" where ISBN='"+ISBN+"'";
	out.println(sql);
	int ret=0;
	ret=connDB.executeUpdate(sql);
	if (ret!=0){
		out.println("<script language='javascript'>alert('图书信息修改成功！');window.location.href='index.jsp';</script>");
		}else{
		out.println("<script language='javascript'>alert('图书信息修改失败！');window.location.href='index.jsp';</script>");
	}
}
%>
</body>
</html>
