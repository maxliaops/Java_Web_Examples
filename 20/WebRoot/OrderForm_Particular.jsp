<%@ page contentType="text/html; charset=gb2312" import="java.sql.*"%>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<% request.setCharacterEncoding("gb2312");%>
<html>
<head>
<title>华奥汽车销售集团网站在线订单</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<jsp:useBean id="data" scope="page" class="cars.Bean1" />
<link rel="stylesheet" href="Css/style.css">
<%!
 String sql;
 ResultSet rs;
 int i;
 %>
 <%
 if(request.getParameter("Submit")!=null){
	sql="delete tb_OrderForm where ID="+request.getParameter("id");
	int j=data.getint(sql);
	data.close();
%>
<script language="javascript">
	alert("订单数据删除成功");
	opener.location.reload();
	window.close();
</script>
<%
}
%>
 <%
 if(request.getParameter("Submit2")!=null){
	sql="update tb_OrderForm set Whether='受理' where ID="+request.getParameter("id");
	int j=data.getint(sql);
	data.close();
%>
<script language="javascript">
	alert("订单受理成功");
	opener.location.reload();
	window.close();
</script>
<%
}
%>
<%
sql="select * from tb_OrderForm where ID="+request.getParameter("id");
rs=data.getrs(sql);
rs.beforeFirst();
if(rs!=null&&rs.next()){
%>
<body leftmargin="0" topmargin="0">
<table width="500" height="560" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#A7B5CE" class="table">
  <tr>
    <td valign="top"><table width="480" height="500" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td height="40" align="center"><div align="center" class="bottm" style="font-size: 16px;color: #FF0000;font-weight: bold;width:180;">车 辆 订 单 受 理</div></td>
        </tr><form name="orderform" method="post" action="OrderForm_Particular.jsp">
      <tr>
        <td valign="top">
		<table width="480" height="510" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td height="30"><div align="right">订购车型：</div></td>
            <td height="30" colspan="3"><input type="hidden" name="id" value="<%=request.getParameter("id")%>">
              <%=rs.getString("Name")%></td>
            </tr>
          <tr valign="bottom">
            <td width="90" height="30"><div align="right">订购数量：</div></td>
            <td width="152" height="30"><%=rs.getInt("Counts")%> </td>
            <td width="80" height="30"><div align="right">付款方式：</div></td>
            <td width="158" height="30"><%=rs.getString("Payment")%>
            </td>
          </tr>
          <tr valign="bottom">
            <td width="90" height="30"><div align="right">可选颜色：</div></td>
            <td height="30" colspan="3"><div align="left"><%=rs.getString("Color")%>
                </div></td>
            </tr>
          <tr valign="bottom">
            <td width="90" height="30"><div align="right">公司名称：</div></td>
            <td height="30" colspan="3">              <div align="left"><%=rs.getString("EnterpriseName")%></div></td></tr>
          <tr valign="bottom">
            <td width="90" height="30"><div align="right">详细地址：</div></td>
            <td height="30" colspan="3">              <div align="left"><%=rs.getString("Address")%></div></td></tr>
          <tr valign="bottom">
            <td width="90" height="30"><div align="right">所在地区：</div></td>
            <td height="30" colspan="3"><div align="right">
              <table width="380" height="30" border="0" align="left" cellpadding="0" cellspacing="0">
                <tr valign="bottom">
                  <td> <%=rs.getString("Omit")%>省  <%=rs.getString("City")%>市 <%=rs.getString("Area")%> 县</td>
                  </tr>
              </table>
            </div></td>
            </tr>
          <tr valign="bottom">
            <td width="90" height="30"><div align="right">经销商名称：</div></td>
            <td height="30" colspan="3"><div align="right">
              <table width="380" height="30" border="0" align="left" cellpadding="0" cellspacing="0">
                <tr valign="bottom">
                  <td>&nbsp;<%=rs.getString("Dealer")%>
      </td>
                  </tr>
              </table>
            </div></td>
            </tr>
          <tr valign="bottom">
            <td width="90" height="30"><div align="right">联系人：</div></td>
            <td height="30">&nbsp;<%=rs.getString("Linkman")%></td>
            <td height="30"><div align="right">联系电话：</div></td>
            <td height="30">&nbsp;<%=rs.getString("Phone")%></td>
          </tr>
          <tr valign="bottom">
            <td width="90" height="30"><div align="right">传真：</div></td>
            <td height="30">&nbsp;<%=rs.getString("Fax")%></td>
            <td height="30"><div align="right">E-mail：</div></td>
            <td height="30">&nbsp;<%=rs.getString("Email")%></td>
          </tr>
          <tr valign="bottom">
            <td width="90" height="30"><div align="right">邮政编码：</div></td>
            <td height="30"><%=rs.getString("PhoneNumber")%>&nbsp;</td>
            <td height="30">&nbsp;</td>
            <td height="30">&nbsp;</td>
          </tr>
          <tr valign="bottom">
            <td width="90" height="30"><div align="right">备注信息：</div></td>
            <td height="90" colspan="3" rowspan="3">
              <textarea name="remark" cols="60" rows="5" class="wenbenkuang" id="remark" readonly><%=rs.getString("Remark")%></textarea>            </td>
            </tr>
          <tr valign="bottom">
            <td height="30">&nbsp;</td>
            </tr>
          <tr valign="bottom">
            <td height="30">&nbsp;</td>
            </tr>
          <tr valign="bottom">
            <td height="30" colspan="4">
              <div align="center">
                <input name="Submit2" type="submit" class="buttons" value="  受  理  ">
                <input name="Submit" type="submit" class="buttons" value="  删  除  ">
                  <input name="Submit3" type="button" class="buttons" value="  返  回  " onClick="javascript:window.close()">
              </div></td>
            </tr>
          <tr valign="bottom">
            <td height="30" colspan="4"><div align="center" style="color: #FF0000 ">吉林省长春市华奥汽车销售集团公司 24小时客户服务热线：xxxx-xxxxxxx</div></td>
          </tr>
        </table></td>
      </tr></form>
    </table></td>
  </tr>
</table>
</body>
<%}%>
</html>
