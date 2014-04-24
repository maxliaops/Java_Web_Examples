<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<jsp:useBean id="conn" scope="page" class="com.tools.ConnDB"/><%
String username=(String)session.getAttribute("username");
ResultSet rs_sale=conn.executeQuery("select top 3 ID,GoodsName,price,nowprice,picture,introduce from tb_goods where sale=1 order by INTime desc");
int sale_ID=0;
String s_goodsname="";
float s_price=0;
float s_nowprice=0;
String s_introduce="";
String s_picture="";
ResultSet rs_new=conn.executeQuery("select top 4 ID,GoodsName,nowprice,picture from tb_goods where newGoods=1 order by INTime desc");
int new_ID=0;
String new_goodsname="";
float new_nowprice=0;
String new_picture="";
%>
<html>
<head>
<title>MR网络购物中心</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="CSS/style.css" rel="stylesheet">
</head>
<body>
<jsp:include page="navigation.jsp"/>
<jsp:include page="login_u.jsp"/>
<jsp:include page="ad.jsp"/>
<table width="788" height="348" border="0" align="center" cellpadding="0" cellspacing="0">
<tr>
  <td width="5" valign="top" bgcolor="#F0F0F0"></td>
  <td width="193" valign="top" bgcolor="#F0F0F0"><jsp:include page="search.jsp"/>
    <jsp:include page="goodsType.jsp"/></td>
  <td width="397" valign="top" bgcolor="#FFFFFF">
  <!--新品上市-->
  <table width="382"  border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td height="49" colspan="2"><img src="images/shop_28.gif" width="382" height="49" border="0" usemap="#Map"></td>
    </tr>
    <tr align="center" valign="top">
    <td height="134" colspan="2" valign="top">
    <table width="100%" height="162"  border="1" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF" bordercolordark="#FFFFFF" bordercolorlight="CFCFCF">
         <%int s=0;
				  while (rs_new.next()){
					new_ID=rs_new.getInt(1);
					new_goodsname=rs_new.getString(2);
					new_nowprice=rs_new.getFloat(3);
					new_picture=rs_new.getString(4);
				  	if(s%2==0){
				  %>
        <tr>
          <td align="center"><table width="0" border="0" cellpadding="0" cellspacing="0">
              <tr>
                <td height="95" align="center"><img src="images/goods/<%=new_picture%>" width="120" height="80"></td>
              </tr>
              <tr>
                <td height="22" align="center"><a href="goods_detail.jsp?ID=<%=new_ID%>" class="word_green">⊙ <%=new_goodsname%></a></td>
              </tr>
              <tr>
                <td height="20" align="center">产品价格：<%=new_nowprice%></td>
              </tr>
              <tr>
                <td height="22" align="center"><a href="goods_detail.jsp?ID=<%=new_ID%>"><img src="images/btn_detail.GIF" width="52" height="20"></a>
                  <%if (username!=null && username!=""){%>
                  &nbsp; <a href="cart_add.jsp?goodsID=<%=new_ID%>"><img src="images/btn_buy.GIF" width="52" height="20"></a>
                  <%}%>
                </td>
              </tr>
            </table></td>
          <%}else{%>
          <td align="center"><table width="0" border="0" cellpadding="0" cellspacing="0">
              <tr>
                <td height="95" align="center"><img src="images/goods/<%=new_picture%>" width="120" height="80"></td>
              </tr>
              <tr>
                <td height="22" align="center"><a href="goods_detail.jsp?ID=<%=new_ID%>" class="word_green">⊙ <%=new_goodsname%></a></td>
              </tr>
              <tr>
                <td height="20" align="center">产品价格：<%=new_nowprice%></td>
              </tr>
              <tr>
                <td height="22" align="center"><a href="goods_detail.jsp?ID=<%=new_ID%>"><img src="images/btn_detail.GIF" width="52" height="20"></a>
                  <%if (username!=null && username!=""){%>
                  &nbsp; <a href="cart_add.jsp?goodsID=<%=new_ID%>"><img src="images/btn_buy.GIF" width="52" height="20"></a>
                  <%}%>
                </td>
              </tr>
            </table></td>
        </tr>
        <%}
		  s++;
		  }%>
      </table>
  
  </td></tr></table>
    <!--特价商品-->
    <table width="382" height="76"  border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td height="46"><img src="images/shop_18.gif" width="382" height="46" border="0" usemap="#Map2"></td>
      </tr>
      <tr>
        <td><table width="100%"  border="1" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF" bordercolordark="#FFFFFF" bordercolorlight="#CFCFCF" style="padding:5px">
            <%	while (rs_sale.next()){
					sale_ID=rs_sale.getInt(1);
					s_goodsname=rs_sale.getString(2);
					s_price=rs_sale.getFloat(3);
					s_nowprice=rs_sale.getFloat(4);
					s_picture=rs_sale.getString(5);
					s_introduce=rs_sale.getString(6);
					if(s_introduce.length()>20){
					  s_introduce=s_introduce.substring(0,20)+"...";
					}
					%>
            <tr>
              <td width="37%" height="95" align="center"><img src="images/goods/<%=s_picture%>" width="96" height="61"></td>
              <td width="63%" align="center" class="word_orange" style="line-height:1.5"><table width="98%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td height="22">&nbsp;&nbsp;名称：<span class="word_orange"><%=s_goodsname%></span></td>
                </tr>
                <tr>
                  <td height="22" style="padding-left:10px;">原价：<span style="text-decoration:line-through; "><%=s_price%></span>(元)</td>
                </tr>
                <tr>
                  <td height="22">&nbsp;&nbsp;现价：<%=s_nowprice%>(元)</td>
                </tr>
                <tr>
                  <td height="22">&nbsp;&nbsp;<span class="word_gray"><%=s_introduce%></span></td>
                </tr>
                <tr>
                  <td height="22"><span class="word_orange" style="line-height:1.5"><a href="goods_detail.jsp?ID=<%=sale_ID%>">&nbsp;&nbsp;<img src="images/btn_detail.GIF" width="52" height="20"></a>
                      <%if (username!=null && username!=""){%>
&nbsp; <a href="cart_add.jsp?goodsID=<%=sale_ID%>"><img src="images/btn_buy.GIF" width="52" height="20"></a>
<%}%>
                  </span></td>
                </tr>
              </table>                
                </td>
            </tr>
            
            <%}%>
          </table></td>
      </tr>
    </table>
    </td>
    
    <td valign="top" bgcolor="#FFFFFF"><jsp:include page="right.jsp"/></td>
      <td width="7" valign="top" bgcolor="#FFFFFF"></td>
    </tr>
  </table>
  <jsp:include page="copyright.jsp"/>
  <map name="Map">
    <area shape="rect" coords="337,27,377,44" href="NewGoods.jsp">
  </map>
  <map name="Map2">
    <area shape="rect" coords="332,24,380,41" href="sale.jsp">
  </map>
</body>
</html>
<%conn.close();%>
