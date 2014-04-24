<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="java.util.Vector"%>
<%@ page import="com.model.Goodselement"%>
<%
Vector cart=(Vector)session.getAttribute("cart");
int ID=Integer.parseInt(request.getParameter("ID"));
int number=Integer.parseInt(request.getParameter("number"));
Vector newcart=new Vector();
float sum=0;
for(int i=0;i<cart.size();i++){
	Goodselement mygoodselement=(Goodselement)cart.elementAt(i);
	try{
		if(mygoodselement.ID==ID){	//修改单件商品的购买数量
			mygoodselement.number=number;
		}
		if(number!=0){
			newcart.addElement(mygoodselement);
			sum=sum+mygoodselement.number*mygoodselement.nowprice;	//计算合计金额
		}
	}catch(Exception e){
		out.println("<script language='javascript'>alert('您的操作有误!');history.back();</script>");
		return;
	}
}
session.setAttribute("cart",newcart);	//将购物车中的商品保存到session中
out.println("合计总金额：<span class='word_orange'>￥"+sum+"</span>");
%>
