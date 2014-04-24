<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" %>
<jsp:useBean id="connDB" scope="page" class="beans.connDB"/>
<jsp:useBean id="chStr" scope="page" class="beans.chStr"/>
<jsp:include page="safe.jsp"/>
<%
ResultSet rs=connDB.executeQuery("select * from tb_order");
int orderID=0;
String username="";
int bnumber=0;
String truename="";
String address="";
String postcode="";
String tel="";
String pay="";	
String carry="";
String email="";
float rebate=1;
String orderDate="";
String bz="";
int enforce=0;
%>
<html>
<head>
<title>网上图书超市</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="../CSS/style.css" rel="stylesheet">
<script src="../JS/check.jsp"></script>
</head>

<body>
<table width="100%"  border="0" cellspacing="0" cellpadding="0" background="../Images/bg.gif">
  <tr>
    <td>
<table width="777" height="609"  border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
  <tr>
    <td valign="top">
	<jsp:include page="Top.jsp"/>
	<table width="100%"  border="0" cellspacing="0" cellpadding="0" class="tableBorder_LTR">
      <tr>
        <td height="30" align="center" bgcolor="#eeeeee">≡≡≡ 订单管理 ≡≡≡</td>
      </tr>
    </table>
	<table width="100%" height="396"  border="0" cellpadding="0" cellspacing="0" class="tableBorder_LBR">
        <tr>
          <td width="26%" height="395" valign="top"><table width="100%"  border="0" cellspacing="-2" cellpadding="-2">
            <tr>
              <td width="55%" height="82" align="center" class="word_grey">&nbsp;<img src="../Images/reg.gif" width="84" height="54"></td>
              <td width="45%" align="left" class="word_grey">订单管理</td>
            </tr>
            <tr>
              <td height="112" colspan="2" valign="top" class="word_grey" style="line-height:200%;"><ul>
                <li>订单的执行：点击“执行”栏中的“执行”图标可以执行此订单。</li>
                <li>订单信息查看：可以查看订单的详细信息，但不可以修改订单信息。</li>
                </ul></td>
            </tr>
            <tr align="center">
              <td colspan="2" valign="middle" class="word_grey"></td>
            </tr>
          </table></td>
          <td width="5" valign="top" background="../Images/Cen_separate.gif"></td>
          <td width="73%" valign="top"><table width="100%" height="14"  border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td height="13" align="center">&nbsp;</td>
            </tr>
          </table>
            <table width="100%" height="48"  border="1" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF" bordercolordark="#CCCCCC" bordercolorlight="#FFFFFF">
                    <tr align="center">
                      <td width="8%" height="30">订单号</td>
                      <td width="8%">品种数</td>
                      <td width="11%">真实姓名</td>
                      <td width="13%">付款方式</td>
                      <td width="18%">运送方式</td>
                      <td width="6%">折扣</td>
                      <td width="25%">订书日期</td>
                      <td width="11%">执行</td>
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
		  <td><%if(enforce==0){%><a href="order_enforce.jsp?ID=<%=orderID%>"><img src="../Images/enforce.gif" width="16" height="16"></a><%}else{%>已执行<%}%></td>
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
    <td align="right">当前页数：[<%=Page%>/<%=maxPage%>]&nbsp;
	<%if(Page>1){%>
	<a href="orderManage.jsp?Page=1">第一页</a>　<a href="orderManage.jsp?Page=<%=Page-1%>">上一页</a>
	<%
	}
	if(Page<maxPage){
	%>
	　<a href="orderManage.jsp?Page=<%=Page+1%>">下一页</a>　<a href="orderManage.jsp?Page=<%=maxPage%>">最后一页&nbsp;</a>
	<%}
	%>
	</td>
  </tr>
</table>			</td>
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
