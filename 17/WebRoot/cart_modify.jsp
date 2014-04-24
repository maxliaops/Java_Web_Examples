<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="java.util.Vector"%>
<%@ page import="beans.bookelement"%>
<%
Vector cart=(Vector)session.getAttribute("cart");
Vector newcart=new Vector();
for(int i=0;i<cart.size();i++){
	String number=request.getParameter("num"+i);
	if(number.equals("0")){
		out.println("<script language='javascript'>alert('数量不能为0，请重新输入!');history.back();</script>");
		return;
	}
	if(number.equals("")){
		out.println("<script language='javascript'>alert('数量不能为空，请输入大于0的值!');history.back();</script>");
		return;
	}
	bookelement mybookelement=(bookelement)cart.elementAt(i);
	String num=request.getParameter("num"+i);
	int newnum=Integer.parseInt(num);
	mybookelement.number=newnum;
	if(newnum!=0){
		newcart.addElement(mybookelement);}
}
session.setAttribute("cart",newcart);
response.sendRedirect("cart_see.jsp");
%>
