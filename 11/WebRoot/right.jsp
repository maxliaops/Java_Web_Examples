<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" %>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<jsp:useBean id="conn" scope="page" class="com.tools.ConnDB"/>
<%
ResultSet rs_bbs=conn.executeQuery("select top 5 * from tb_bbs order by INTime desc");
ResultSet rs_sort=conn.executeQuery("select GoodsID,GoodsName, sum(number) as sumNum from V_order_detail group by GoodsName,GoodsID order by sumNum desc");
%>
      <table width="186"  border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
        <tr>
          <td height="42"><img src="images/shop_22.gif" width="186" height="42"></td>
        </tr>
        <tr>
          <td height="97" align="center" valign="top" background="images/rightLine_center.gif"><table width="88%"  border="0" cellspacing="0" cellpadding="0">
            <%
			int ID_bbs=0;
			String title="";
			while(rs_bbs.next()){
			  ID_bbs=rs_bbs.getInt(1);
			  title=rs_bbs.getString(2);
%>
			<tr>
			  <td width="6"><img src="images/start.GIF" width="9" height="7" /></td>
              <td height="24">&nbsp;<a href="bbs_detail.jsp?ID=<%=ID_bbs%>"><%=title%></a></td>
              
			</tr>
<%			}%>
          </table></td>
        </tr>
        <tr>
          <td height="2" align="center" valign="top"><img src="images/rightLine_bottom.gif" width="186" height="2" /></td>
        </tr>
      </table>
      <table width="186" height="151"  border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td height="40"><img src="images/shop_33.gif" width="186" height="40" /></td>
        </tr>
        <tr>
          <td align="center" valign="top" background="images/rightLine_center.gif"><table width="88%"  border="0" cellspacing="0" cellpadding="0">
            <%
			int ID_sort=0;
			String goodsname="";
			while(rs_sort.next()){
			  ID_sort=rs_sort.getInt(1);
			  goodsname=rs_sort.getString(2);
%>
			<tr>
			  <td width="7" class="tableBorder_B_dashed"><img src="images/triangle.GIF" width="6" height="9" /></td>
              <td height="25" class="tableBorder_B_dashed">&nbsp;<a href="goods_detail.jsp?ID=<%=ID_sort%>"><%=goodsname%></a></td>
              
			</tr>
<%}%>
          </table>
            <table width="100%"  border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td height="25" align="right"><a href="SellSort.jsp"><img src="images/index_more.gif" width="34" height="11" border="0" /></a>&nbsp;&nbsp;</td>
              </tr>
          </table></td>
        </tr>
        <tr>
          <td height="2" align="center" valign="top"><img src="images/rightLine_bottom.gif" width="186" height="2" /></td>
        </tr>
      </table>
      <table width="186" height="151"  border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td height="39"><img src="images/friendLink.GIF" width="186" height="39" /></td>
        </tr>
        <tr>
          <td align="center" valign="top" background="images/rightLine_center.gif"><table width="100%" height="104" border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td height="52" align="center"><img src="images/ad1.gif" width="170" height="42" /></td>
            </tr>
            <tr>
              <td height="52" align="center"><img src="images/ad2.gif" width="170" height="42" /></td>
            </tr>
            <tr>
              <td height="52" align="center"><img src="images/ad3.gif" width="170" height="42" /></td>
            </tr>
          </table></td>
        </tr>
        <tr>
          <td height="2" align="center" valign="top"><img src="images/rightLine_bottom.gif" width="186" height="2" /></td>
        </tr>
      </table>
      <img src="images/tel.GIF" width="187" height="69" />