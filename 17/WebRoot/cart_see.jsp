<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="java.util.Vector"%>
<%@ page import="beans.bookelement"%>
<jsp:useBean id="connDB" scope="page" class="beans.connDB"/>
<jsp:useBean id="chStr" scope="page" class="beans.chStr"/>
<%
Vector cart=(Vector)session.getAttribute("cart");
if(cart==null || cart.size()==0){
	response.sendRedirect("cart_null.jsp");
}else{
%>
<html>
<head>
<title>网上图书超市</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="CSS/style.css" rel="stylesheet">
</head>
<body>
<table width="100%"  border="0" cellspacing="0" cellpadding="0" background="Images/bg.gif">
  <tr>
    <td>
<table width="777" height="768"  border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
  <tr>
    <td valign="top">
	<jsp:include page="Top.jsp"/>
	<table width="100%" height="330"  border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td width="26%" valign="top">
		 <jsp:include page="left.jsp"/> 
		</td>
          <td width="5" valign="top" background="Images/Cen_separate.gif"></td>
          <td width="73%" valign="top"><table width="100%" height="272"  border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td width="97%" height="220" valign="top">
			   <table width="100%" height="126"  border="0" cellpadding="0" cellspacing="0">

			    <tr>
                  <td valign="top"><table width="100%" height="59"  border="0" cellpadding="0" cellspacing="0">
                    <tr>
                      <td width="86%" height="59" class="tableBorder_B"><img src="Images/ico_cart.gif" width="176" height="70"></td>
                    </tr>
                  </table>
                    <table width="100%"  border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td>
<form method="post" action="cart_modify.jsp" name="form1">
<table width="100%" height="48" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr align="center" valign="middle">
        <td height="27" class="tableBorder_B1">编号</td>
        <td height="27" class="tableBorder_B1">书号</td>
        <td class="tableBorder_B1">书名</td>
        <td height="27" class="tableBorder_B1">单价</td>
        <td height="27" class="tableBorder_B1">数量</td>
        <td height="27" class="tableBorder_B1">金额</td>
        <td class="tableBorder_B1">退回</td>
      </tr> 
	<%
		float sum=0;
		float pric=0;
		String ISBN="";
		String bookname="";
		String publisher="";
		for(int i=0;i<cart.size();i++){
			bookelement bookitem=(bookelement)cart.elementAt(i);
			sum=sum+bookitem.number*bookitem.price;
			ISBN=(String)bookitem.ISBN;
			if (ISBN!=""){
				ResultSet rs_book=connDB.executeQuery("select * from tb_bookinfo where ISBN='"+ISBN+"'");
				if (rs_book.next()){
					bookname=rs_book.getString("Bookname");
				}
			}
	%> 
      <tr align="center" valign="middle"> 
        <td width="32" height="27"><%=i+1%></td>
        <td width="109" height="27"><%=ISBN%></td> 
        <td width="199" height="27"><%=bookname%></td>
        <td width="59" height="27">￥<%=bookitem.price%></td> 
        <td width="51" height="27">
          <input name="num<%=i%>" size="7" type="text" class="txt_grey" value="<%=bookitem.number%>" onBlur="form1.submit();"></td> 
        <td width="65" height="27">￥<%=(bookitem.price*bookitem.number)%></td> 
        <td width="34"><a href="cart_move.jsp?ID=<%=i%>"><img src="Images/del.gif" width="16" height="16"></a></td>
        <script language="javascript">
			<!--
			function check(){
				if(isNaN(form1.num<%=i%>.value)){
					alert("请不要输入非法字符");
					return false;
					history.back();
				}
				if(form1.num<%=i%>.value==""){
					alert("请输入修改的数量");
					return false;
					history.back();
				}	
			}
			-->
		</script>
	<%
		}

	%> </tr>
      </table>
	  </form>
<table width="100%" height="52" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr align="center" valign="middle">
		<td height="10">&nbsp;		</td>
        <td width="24%" height="10" colspan="-3" align="left">&nbsp;</td>
		</tr>
      <tr align="center" valign="middle">
        <td height="21" class="tableBorder_B1">&nbsp;</td>
        <td height="21" colspan="-3" align="left" class="tableBorder_B1">合计总金额：￥<%=sum%></td>
      </tr>
      <tr align="center" valign="middle">
        <td height="21" colspan="2"> <a href="#" onClick="form1.submit();">修改数量</a> | <a href="BookSort.jsp">继续购书</a> | <a href="cart_checkout.jsp">去收银台结账</a> | <a href="cart_clear.jsp">清空购物车</a></td>
        </tr>
</table>
						</td>
                      </tr>
                    </table></td>
			     </tr>
              </table>
					  </td>
              <td width="3%" valign="top">&nbsp;</td>
            </tr>
          </table></td>
        </tr>
      </table>
      <jsp:include page="copyright.jsp"/>
    </td>
  </tr>
</table>
</td>
  </tr>
</table>
</body>
</html>
<%	}%>