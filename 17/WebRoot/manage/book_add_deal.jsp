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
	ResultSet rs=connDB.executeQuery("select * from tb_bookinfo where ISBN='"+ISBN+"'");
	if(rs.next()){
		out.println("<script language='javascript'>alert('该图书信息已经添加!');history.back(-1);</script>");
	}else{
	String sql="Insert into tb_bookinfo (ISBN,BookName,Type,publisher,writer,Introduce,price,pDate,cover,newbook,commend) values('"+ISBN+"','"+bookname+"','"+type+"','"+TPI+"','"+writer+"','"+introduce+"',"+price+",'"+pDate+"','"+cover+"',"+newbook+","+commend+")";
	int ret=0;
	ret=connDB.executeUpdate(sql);
	if (ret!=0){
		out.println("<script language='javascript'>alert('图书信息添加成功！');window.location.href='index.jsp';</script>");
		}else{
		out.println("<script language='javascript'>alert('图书信息添加失败！');window.location.href='book_add.jsp';</script>");
	}
	}
}else{
	out.println("<script language='javascript'>alert('您的操作有误！');window.location.href='index.jsp';</script>");
}
%>
</body>
</html>
