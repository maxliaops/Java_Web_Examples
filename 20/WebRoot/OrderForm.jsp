<%@ page contentType="text/html; charset=gb2312" import="java.sql.*"%>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<% request.setCharacterEncoding("gb2312");%>
<html>
<head>
<title>华奥汽车销售集团网站在线订单</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<jsp:useBean id="data" scope="session" class="cars.Bean1" />
<link rel="stylesheet" href="Css/style.css">
<%!
 String sql;
 ResultSet rs;
 int i;
 %>
<% if(request.getParameter("orderform")!=null){
	String names=request.getParameter("names");
	int counts=Integer.parseInt(request.getParameter("counts"));
	String color=request.getParameter("color");
	String payment=request.getParameter("payment");
	String enterprise=request.getParameter("enterprise");
	String address=request.getParameter("address");
	String area=request.getParameter("area");
	String dealer=request.getParameter("dealer");
	String linkman=request.getParameter("linkman");
	String phone=request.getParameter("phone");
	String fax=request.getParameter("fax");
	String email=request.getParameter("email");
	String phost=request.getParameter("phone");
	String remark=request.getParameter("remark");
	java.util.Date today=new java.util.Date();
	java.sql.Date now=new java.sql.Date(today.getYear(),today.getMonth(),today.getDate());
	sql="insert into tb_OrderForm(name,counts,color,payment,EnterpriseName,Address,"+
	"Area,Dealer,Linkman,Phone,Fax,Email,PhoneNumber,Remark,IssueDate,Whether) values('"+names+"',"+counts+",'"+color+"','"+payment+"','"+enterprise+"','"+address+"','"+area+"','"+dealer+"','"+linkman+"','"+phone+"','"+fax+"','"+email+"','"+phost+"','"+remark+"','"+now+"','未受理')";
	System.out.println(sql);
	i=data.getint(sql);
	if(i>0){
%>
<script language="javascript">
alert("订单已经接收");
window.close();
</script>
<%}
return;
}%>
<script language="javascript">
	function more(){
	 var names=orderform.dealer.value;
	 var id=0;
	 switch(names){
	 <% sql="select * from tb_Enterprise where Style='连锁销售'";
		rs=data.getrs(sql);
		if(rs!=null){
	while(rs.next()){
              %>
          case "<%=rs.getString("Name")%>":
		  	id=<%=rs.getInt("ID")%>;
			break;
            <%}}%>
		default:
		 break;
		}
		window.open("Enterprise_Particular.jsp?id="+id,"","width=380,height=235,toolbar=no,location=no,status=no,menubar=no");
	}
	function check2(){
		var names=orderform.names.value;
		var counts=orderform.counts.value;
		var address=orderform.address.value;
		var area=orderform.area.value;
		var linkman=orderform.linkman.value;
		var phone=orderform.phone.value;
		if(names==""){
			alert("请输入您要订购的车辆的品牌和型号");
			orderform.names.focus();
		}
		else if(counts==""){
			alert("请输入您要购买的数量");
			orderform.counts.focus();
		}
		else if(address==""){
			alert("请输入您的联系地址");
			orderform.address.focus();
		}
		else if(area==""){
			alert("请输入您的住宅所在的省市区域");
			orderform.area.focus();
		}
		else if(linkman==""){
			alert("请输入具体的联系人姓名");
			orderform.linkman.focus();
		}
		else if(phone==""){
			alert("请输入具体的联系电话");
			orderform.phone.focus();
		}
		else{
	 		orderform.submit();
		}
	}
</script>
<body leftmargin="0" topmargin="0">
<table width="500" height="560" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#A7B5CE" class="table">
  <tr>
    <td valign="top"><table width="480" height="500" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td height="40" align="center"><div align="center" class="bottm" style="font-size: 16px;color: #FF0000;font-weight: bold;width:130;">在 线 订 购 单</div></td>
        </tr><form name="orderform" method="post" action="OrderForm.jsp?orderform=add">
      <tr>
        <td valign="top">
		<table width="480" height="510" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td height="30"><div align="right">订购车型：</div></td>
            <td height="30" colspan="3"><input type="hidden" name="names" value="<%=new String (request.getParameter("action").getBytes("ISO-8859-1"),"GBK")%>"><%=new String (request.getParameter("action").getBytes("ISO-8859-1"),"GBK")%></td>
            </tr>
          <tr valign="bottom">
            <td width="90" height="30"><div align="right">订购数量：</div></td>
            <td width="152" height="30">
              <input name="counts" type="text" class="wenbenkuang" id="counts" value="" size="10" maxlength="2">
              辆</td>
            <td width="80" height="30"><div align="right">付款方式：</div></td>
            <td width="158" height="30">
              <select name="payment" class="wenbenkuang" id="select4">
                <option value="现金" selected>现金</option>
                <option value="电汇">电汇</option>
                <option value="支票">支票</option>
                <option value="其他">其他</option>
              </select>
            </td>
          </tr>
          <tr valign="bottom">
            <td width="90" height="30"><div align="right">可选颜色：</div></td>
            <td height="30" colspan="3"><div align="left">
                <input type="radio" name="color" value="红">
                红
                <input name="color" type="radio" value="黑" checked>
                黑
                <input type="radio" name="color" value="蓝">
                蓝
                <input type="radio" name="color" value="白">
                白
                <input type="radio" name="color" value="绿">
                绿
                <input type="radio" name="color" value="黄">
                黄
                <input type="radio" name="color" value="银">
                银
                <input type="radio" name="color" value="灰">
                灰 </div></td>
          </tr>
          <tr valign="bottom">
            <td width="90" height="30"><div align="right">公司名称：</div></td>
            <td height="30" colspan="3"><input name="enterprise" type="text" class="wenbenkuang" id="enterprise23" value="---------" size="60">
                <div align="right"></div></td>
          </tr>
          <tr valign="bottom">
            <td width="90" height="30"><div align="right">详细地址：</div></td>
            <td height="30" colspan="3"><input name="address" type="text" class="wenbenkuang" id="address23" size="60">
                <div align="right"></div></td>
          </tr>
          <tr valign="bottom">
            <td width="90" height="30"><div align="right">所在地区：</div></td>
            <td height="30" colspan="3"><div align="right">
                <table width="380" height="30" border="0" align="left" cellpadding="0" cellspacing="0">
                  <tr valign="bottom">
                    <td><input name="area" type="text" class="wenbenkuang" id="area23" size="50"></td>
                  </tr>
                </table>
            </div></td>
          </tr>
          <tr valign="bottom">
            <td width="90" height="30"><div align="right">经销商名称：</div></td>
            <td height="30" colspan="3"><div align="right">
                <table width="380" height="30" border="0" align="left" cellpadding="0" cellspacing="0">
                  <tr valign="bottom">
                    <td width="285"><select name="dealer" class="wenbenkuang" id="dealer">
                        <% sql="select * from tb_Enterprise where Style='连锁销售'";
					rs=data.getrs(sql);
					if(rs!=null){
						while(rs.next()){
                                        %>
                        <option value="<%=rs.getString("Name")%>"><%=rs.getString("Name")%></option>
                        <%}}
									  data.close();
									  rs.close();
									  %>
                      </select>
                    </td>
                    <td width="95"><input name="Submit" type="button" class="buttons" value="  详细资料  " onClick="more()"></td>
                  </tr>
                </table>
            </div></td>
          </tr>
          <tr valign="bottom">
            <td width="90" height="30"><div align="right">联系人：</div></td>
            <td height="30"><input name="linkman" type="text" class="wenbenkuang" id="linkman23" size="20"></td>
            <td height="30"><div align="right">联系电话：</div></td>
            <td height="30"><input name="phone" type="text" class="wenbenkuang" id="phone23" size="20"></td>
          </tr>
          <tr valign="bottom">
            <td width="90" height="30"><div align="right">传真：</div></td>
            <td height="30"><input name="fax" type="text" class="wenbenkuang" id="fax23" value="--------" size="20"></td>
            <td height="30"><div align="right">E-mail：</div></td>
            <td height="30"><input name="email" type="text" class="wenbenkuang" id="email23" value="------" size="20"></td>
          </tr>
          <tr valign="bottom">
            <td width="90" height="30"><div align="right">邮政编码：</div></td>
            <td height="30"><input name="phost" type="text" class="wenbenkuang" id="phost23" value="-----------" size="20"></td>
            <td height="30">&nbsp;</td>
            <td height="30">&nbsp;</td>
          </tr>
          <tr valign="bottom">
            <td width="90" height="30"><div align="right">备注信息：</div></td>
            <td height="90" colspan="3" rowspan="3">
              <textarea name="remark" cols="60" rows="5" class="wenbenkuang" id="remark">---------
</textarea>
            </td>
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
                <input name="Submit2" type="button" class="buttons" value="  订  购  " onClick="check2()">
                <input name="Submit" type="reset" class="buttons" value="  重  置  ">
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
</html>
