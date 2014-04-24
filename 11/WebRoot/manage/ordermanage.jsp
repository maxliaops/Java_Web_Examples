<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<jsp:useBean id="conn" scope="page" class="com.tools.ConnDB"/>
<%
ResultSet rs=conn.executeQuery("select * from tb_order");
int orderID=0;
String username="";
int bnumber=0;
String truename="";
String address="";
String postcode="";
String tel="";
String pay="";	
String carry="";
float rebate=1;
String orderDate="";
String bz="";
int enforce=0;
%>
<html>
<head>
<title>MR网络购物中心——后台管理</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="../CSS/style.css" rel="stylesheet">
</head>

<body> 
<jsp:include page="banner.jsp"/>
<table width="788" height="288"  border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
  <tr>

    <td align="center" valign="top"><table width="100%"  border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td align="right">&nbsp;</td>
        <td height="10" colspan="3">&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td height="29" align="right">&nbsp;</td>
        <td width="19" background="../images/manage_leftTitle_left.GIF">&nbsp;</td>
        <td width="588" align="center" background="../images/manage_leftTitle_mid.GIF" class="word_white"><b>订单列表</b></td>
        <td width="20" background="../images/manage_leftTitle_right.GIF">&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
    </table>
	<!---->
   <table width="96%" height="48"  border="1" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF" bordercolordark="#CCCCCC" bordercolorlight="#FFFFFF">
                    <tr align="center">
                      <td width="8%" height="30">订单号</td>
                      <td width="8%">品种数</td>
                      <td width="10%">真实姓名</td>
                      <td width="15%">付款方式</td>
                      <td width="17%">运送方式</td>
                      <td width="6%">折扣</td>
                      <td width="26%">订货日期</td>
                      <td width="10%">执行</td>
                    </tr>
<%
String str=(String)request.getParameter("Page");
if(str==null){
	str="0";
}
int pagesize=10;
rs.last();
int RecordCount=rs.getRow(); 
int maxPage=0;
maxPage=(RecordCount%pagesize==0)?(RecordCount/pagesize):(RecordCount/pagesize+1);

int Page=Integer.parseInt(str);
if(Page<1){
	Page=1;
}else{
	if(((Page-1)*pagesize+1)>RecordCount){
		Page=maxPage;
	}
}
rs.absolute((Page-1)*pagesize+1);
for(int i=1;i<=pagesize;i++){
	orderID=rs.getInt("orderID");
	bnumber=rs.getInt("bnumber");
	truename=rs.getString("truename");
	pay=rs.getString("pay");
	carry=rs.getString("carry");
	rebate=rs.getFloat("rebate");
	orderDate=rs.getString("orderDate");
	enforce=rs.getInt("enforce");
	  %>
		<tr align="center">
		  <td height="24"><a href="order_detail.jsp?ID=<%=orderID%>"><%=orderID%></a></td>
		  <td><%=bnumber%></td>
		  <td><%=truename%></td>
		  <td><%=pay%></td>
		  <td><%=carry%></td>
		  <td><%=rebate*100%>%</td>
		  <td><%=orderDate%></td>
		  <td><%if(enforce==0){%><a href="order_enforce.jsp?ID=<%=orderID%>"><img src="../images/enforce.gif" width="16" height="16"></a>
		    <%}else{%>已执行<%}%></td>
		</tr>
<%
	try{
		if(!rs.next()){break;}
		}catch(Exception e){}
}
%>
      </table>
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="24" align="right">当前页数：[<%=Page%>/<%=maxPage%>]&nbsp;
	<%if(Page>1){%>
	<a href="ordermanage.jsp?Page=1">第一页</a>　<a href="ordermanage.jsp?Page=<%=Page-1%>">上一页</a>
	<%
	}
	if(Page<maxPage){
	%>
	　<a href="ordermanage.jsp?Page=<%=Page+1%>">下一页</a>　<a href="ordermanage.jsp?Page=<%=maxPage%>">最后一页&nbsp;</a>
	<%}
	%>	</td>
  </tr>
</table>
	 <!----> 
</td>
	  
	      <td width="182" valign="top"><table width="100%" height="431"  border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td width="199" valign="top" bgcolor="#FFFFFF"><jsp:include page="navigation.jsp"/></td>
      </tr>
    </table></td>	  
  </tr>
</table>
<jsp:include page="copyright.jsp"/>
</body>
</html>

