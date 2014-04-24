<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="java.util.Vector"%>
<%@ page import="beans.bookelement"%> 
<jsp:useBean id="connDB" scope="page" class="beans.connDB"/>
<jsp:useBean id="chStr" scope="page" class="beans.chStr"/>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>添加购物车</title>
</head>

<body>
<%
String ISBN=chStr.chStr(request.getParameter("ISBN"));
String sql="select * from tb_bookinfo where ISBN='"+ISBN+"'";
ResultSet rs=connDB.executeQuery(sql);
float price=0;
if(rs.next()){
	price=rs.getInt("price");
}
bookelement mybookelement=new bookelement();
mybookelement.ISBN=ISBN;
mybookelement.price=price;
mybookelement.number=1;
boolean Flag=true;
Vector cart=(Vector)session.getAttribute("cart");
if(cart==null){
	cart=new Vector();
}else{
	for(int i=0;i<cart.size();i++){
		bookelement bookitem=(bookelement)cart.elementAt(i);
		if(bookitem.ISBN.equals(mybookelement.ISBN)){  //此处必须用equals方法，不能用==
			bookitem.number++;
			cart.setElementAt(bookitem,i);
			Flag=false;
		}
	}
}
if(Flag)cart.addElement(mybookelement);
session.setAttribute("cart",cart);
rs.close();
response.sendRedirect("cart_see.jsp");
%>
