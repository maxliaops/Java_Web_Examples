<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="java.util.Vector"%>
<%@ page import="beans.bookelement"%>
<jsp:useBean id="connDB" scope="page" class="beans.connDB"/>
<jsp:useBean id="chStr" scope="page" class="beans.chStr"/>
<jsp:include page="safe.jsp"/>
<%
	String username=chStr.chStr(request.getParameter("username"));
	String truename=chStr.chStr(request.getParameter("truename"));
	String address=chStr.chStr(request.getParameter("address"));
	String postcode=request.getParameter("postcode");
	String tel=request.getParameter("tel");
	String pay=chStr.chStr(request.getParameter("pay"));	
	String carry=chStr.chStr(request.getParameter("carry"));
	String email=request.getParameter("email");
	String bz=chStr.chStr(request.getParameter("bz"));
	int orderID=0;
	//计算打折
	float rebate=1;
	ResultSet rs_rebate=connDB.executeQuery("select rebate from V_Member where username='"+username+"'");
	
	if (rs_rebate.next()){
		rebate=rs_rebate.getFloat("rebate");
	}
	Vector cart=(Vector)session.getAttribute("cart");
	int number=0;
	float price=0;
	float sum=0;
	float Totalsum=0;
	String flag="True";
	int temp=0;
	//插入订单主表数据
	float bnumber=cart.size();
	String sql="insert into tb_Order(bnumber,username,truename,address,postcode,tel,email,pay,carry,rebate,bz) values("+bnumber+",'"+username+"','"+truename+"','"+address+"','"+postcode+"','"+tel+"','"+email+"','"+pay+"','"+carry+"','"+rebate+"','"+bz+"')";
	temp=connDB.executeUpdate_id(sql);
	if (temp==0){
		 flag="false";
	}else{
		orderID=temp;
			//out.println("<script>alert('"+String.valueOf(orderID)+"ID号')</script>");
	}
	//插入订单明细表数据
	for(int i=0;i<cart.size();i++){
		bookelement mybookelement=(bookelement)cart.elementAt(i);
		String ISBN=mybookelement.ISBN;
		price=mybookelement.price*rebate;
		number=mybookelement.number;
		sum=price*number;
		String str="insert into tb_order_Detail (orderID,ISBN,price,number) values("+orderID+",'"+ISBN+"',"+price+","+number+")";
		temp=connDB.executeUpdate(str);
		Totalsum=Totalsum+sum;
		if (temp==0){
		 	flag="false";
		}
	}
	//更新会员信息
	String sql_up="update tb_Member set Amount=Amount+"+Totalsum+" where username='"+username+"'";
	temp=connDB.executeUpdate(sql_up);	
	if (temp==0){
		 flag="false";
	}
	//更新会员等级
	ResultSet rs_Amount=connDB.executeQuery("select Amount from tb_Member where username='"+username+"'");
	if (rs_Amount.next()){
		int Amount=0;
		Amount=rs_Amount.getInt("Amount");
		ResultSet rs_grade=connDB.executeQuery("select Top 1 grade,Amount from tb_rebate where Amount<="+Amount+" order by grade desc");
		if (rs_grade.next()){
			int grade=0;
			grade=rs_grade.getInt("grade");
			String sql_upgrade="update tb_Member set grade="+grade+" where username='"+username+"'";
			temp=connDB.executeUpdate(sql_upgrade);	
			if (temp==0){
				 flag="false";
			}
		}
	}
	if(flag.equals("false")){
		out.println("<script language='javascript'>alert('订单无效');history.back();</script>");
	}else{
		session.removeAttribute("cart");
		out.println("<script language='javascript'>alert('订单生成，请记住您的订单号["+orderID+"]');window.location.href='index.jsp';</script>");
	}
	connDB.close();
%>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">