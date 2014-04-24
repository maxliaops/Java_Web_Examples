<%@ page contentType="text/html; charset=gb2312" import="java.sql.*"%>
<%@ page import="java.io.*" %>
<% request.setCharacterEncoding("gb2312");%>
<html>
<head>
<title>华奥汽车销售集团网站</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<jsp:useBean id="data" scope="page" class="cars.Bean1" />
<jsp:useBean id="menu" scope="page" class="cars.PopMenu" />
<jsp:useBean id="news" scope="page" class="cars.NewsShow" />
<jsp:useBean id="cross" scope="page" class="cars.CrossTable" />
<jsp:useBean id="cus" scope="page" class="cars.CustomerTable" />
<jsp:useBean id="search" scope="page" class="cars.SearchTable" />
<jsp:useBean id="order" scope="page" class="cars.OrderHelp" />
<jsp:useBean id="filetext" scope="page" class="cars.FileText" />
<%!
	ResultSet rs;
	String sql;
	String rla="";
	int i;
%>

<% if(request.getParameter("order")!=null){
	String names1=request.getParameter("names");
	String pwd1=request.getParameter("password");
	String realname1=request.getParameter("realname");
	String address1=request.getParameter("address");
	String phone1=request.getParameter("phone");
	String email1=request.getParameter("email");
	String hander1=request.getParameter("hander");
	String carname1=request.getParameter("carname");
	String cartype1=request.getParameter("cartype");
	java.util.Date today1=new java.util.Date();
	java.sql.Date now1=new java.sql.Date(today1.getYear(),today1.getMonth(),today1.getDate());
	sql="insert into tb_Intent values('"+names1+"','"+pwd1+"','"+realname1+"','"+phone1+"','"+carname1+"','"+cartype1+"','"+email1+"','"+address1+"','"+hander1+"','未受理','"+now1+"')";
	int j=data.getint(sql);
	if(j>0){
%>
<script language="javascript">
alert("意向购车申请已经接收！我们将及时和您联系！");
location.href="SpeakFor.jsp";
</script>
<%}}%>
<%=filetext.getfiletext("连锁销售")%>
<link rel="stylesheet" href="Css/style.css">
<SCRIPT src="Js/TextColor.js"></SCRIPT>
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
	sql="insert into tb_OrderForm values('"+names+"',"+counts+",'"+color+"','"+payment+"','"+enterprise+"','"+address+"','"+area+"','"+dealer+"','"+linkman+"','"+phone+"','"+fax+"','"+email+"','"+phost+"','"+remark+"','"+now+"','未受理')";
	i=data.getint(sql);
	if(i>0){
%>
<script language="javascript">
alert("订单已经接收");
location.href="SpeakFor.jsp";
</script>
<%}}%>
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
	function check1(){
		var names=order.names.value;
		var pwd=order.password.value;
		var pwd2=order.password2.value;
		var realname=order.realname.value;
		var phone=order.phone.value;
		var carname=order.carname.value;
		var email=order.email.value;
		var address=order.address.value;
		if(names==""){
			alert("请输入登录名称");
			order.names.focus();
		}
		else if(pwd==""){
			alert("请输入登录密码");
			order.password.focus();
		}
		else if(pwd2==""){
			alert("请输入确认密码");
			order.password2.focus();
		}
		else if(pwd!=pwd2){
			alert("两次输入的密码不一致");
			order.password.focus();
		}
		else if(realname==""){
			alert("请填写您的真实姓名");
			order.realname.focus();
		}
		else if(phone==""){
			alert("请填写您的电话号码");
			order.phone.focus();
		}
		else if(carname==""){
			alert("请填写您感兴趣的车辆品牌");
			order.carname.focus();
		}
		else if(email==""){
			alert("请填写您的E-mail地址");
			order.email.focus();
		}
		else if(address==""){
			alert("请填写您的详细地址");
			order.address.focus();
		}
		else {
			order.submit();
		}
	}
</script>
<%@ include file="Top.jsp" %>
<table width="744" height="566" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#f9f9f9">
  <tr>
    <td width="164" height="566" valign="top"><table width="164" height="566" border="1" cellpadding="0" cellspacing="0">
      <tr>
        <td width="160" height="20" bgcolor="#FFCC99">&nbsp;中心导航</td>
      </tr>
      <tr>
        <td height="100" colspan="2" valign="top">
		<%
		menu.add("销 售 热 线","");
		menu.add("订 购 帮 助","订购帮助");
		menu.add("在 线 订 购","在线订购");
		menu.add("意 向 购 车","意向购车");
		%>
		<%=menu.table()%>
		<%menu.setnull();%>
		</td>
	</tr>
      <tr>
        <td height="20" bgcolor="#FFCC99">&nbsp;站内搜索</td>
      </tr>
      <tr>
        <td height="120"><%=search.getsearch()%></td>
      </tr>
      <tr>
        <td height="20" bgcolor="#FFCC99">&nbsp;<a href="#" style="color:#000000 ">新闻报道</a></td>
      </tr>
      <tr>
        <td valign="top"><%=news.getstring()%></td>
      </tr>
    </table>    </td>
    <td width="580" valign="top">
	<% if(request.getParameter("type")==null){%>
		<%=cus.gettable()%>
	<% }else {%>
	<% if(request.getParameter("type").equals("在线订购")){%>
	<table width="580" height="566" border="1" cellpadding="0" cellspacing="0">
      <tr bgcolor="#FFCC99">
        <td height="20">&nbsp;<a href="SpeakFor.jsp"  style="color:#000000 ">订购中心</a> --&gt;&gt; 在线订购 </td>
      </tr>
      <tr><td><table width="500" height="460" border="0" align="center" cellpadding="0" cellspacing="0" class="table">
            <tr>
              <td valign="top"><table width="480" height="460" border="0" align="center" cellpadding="0" cellspacing="0">
                  <tr>
                    <td height="40" align="center"><div align="center" class="bottm" style="font-size: 16px;color: #FF0000;font-weight: bold;width:130;">在 线 订 购 单</div></td>
                  </tr>
                  <form name="orderform" method="post" action="SpeakFor.jsp?orderform=orderform">
                    <tr>
                      <td valign="top">
                        <table width="480" height="460" border="0" cellpadding="0" cellspacing="0">
                          <tr>
                            <td height="30"><div align="right">订购车型：</div></td>
                            <td height="30" colspan="3"><select name="names" class="wenbenkuang" id="names">
			<%	
			  rs=cross.getrs();
			  if(rs!=null){
			  	int i=0;
			  	while(rs.next()){
			  %>
			  <option value="<%=rs.getString("品牌")%><%=rs.getString("型号")%>"<%if(i==0){out.print("selected");}%><%i=i+1;%>><%=rs.getString("品牌")%><%=rs.getString("型号")%></option>
			  <%}}%>
			  </select></td>
                          </tr>
                          <tr valign="bottom">
                            <td width="90" height="30"><div align="right">订购数量：</div></td>
                            <td width="152" height="30">
                              <input name="counts" type="text" class="wenbenkuang" id="counts" value="" size="10" maxlength="2">
                              辆</td>
                            <td width="80" height="30"><div align="right">付款方式：</div></td>
                            <td width="158" height="30">
                              <select name="payment" class="wenbenkuang" id="payment">
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
                            <td height="30" colspan="3"><input name="enterprise" type="text" class="wenbenkuang" id="enterprise" value=" " size="60">
                                <div align="right"></div></td>
                          </tr>
                          <tr valign="bottom">
                            <td width="90" height="30"><div align="right">详细地址：</div></td>
                            <td height="30" colspan="3"><input name="address" type="text" class="wenbenkuang" id="address" size="60">
                                <div align="right"></div></td>
                          </tr>
                          <tr valign="bottom">
                            <td width="90" height="30"><div align="right">所在地区：</div></td>
                            <td height="30" colspan="3"><div align="right">
                                <table width="380" height="30" border="0" align="left" cellpadding="0" cellspacing="0">
                                  <tr valign="bottom">
                                    <td><input name="area" type="text" class="wenbenkuang" id="area" size="50"></td>
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
                                    <td width="95"><input name="Submit32" type="button" class="buttons" value="  详细资料  " onClick="more()"></td>
                                  </tr>
                                </table>
                            </div></td>
                          </tr>
                          <tr valign="bottom">
                            <td width="90" height="30"><div align="right">联系人：</div></td>
                            <td height="30"><input name="linkman" type="text" class="wenbenkuang" id="linkman" size="20"></td>
                            <td height="30"><div align="right">联系电话：</div></td>
                            <td height="30"><input name="phone" type="text" class="wenbenkuang" id="phone" size="20"></td>
                          </tr>
                          <tr valign="bottom">
                            <td width="90" height="30"><div align="right">传真：</div></td>
                            <td height="30"><input name="fax" type="text" class="wenbenkuang" id="fax" value=" " size="20"></td>
                            <td height="30"><div align="right">E-mail：</div></td>
                            <td height="30"><input name="email" type="text" class="wenbenkuang" id="email" value=" " size="20"></td>
                          </tr>
                          <tr valign="bottom">
                            <td width="90" height="30"><div align="right">邮政编码：</div></td>
                            <td height="30"><input name="phost" type="text" class="wenbenkuang" id="phost" value=" " size="20"></td>
                            <td height="30">&nbsp;</td>
                            <td height="30">&nbsp;</td>
                          </tr>
                          <tr valign="bottom">
                            <td width="90" height="30"><div align="right">备注信息：</div></td>
                            <td height="90" colspan="3" rowspan="3">
                              <textarea name="remark" cols="60" rows="5" class="wenbenkuang" id="remark"> 
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
                            <td height="30" colspan="4">                              <div align="center">
                                <input name="Submit2" type="button" class="buttons" value="  订  购  " onClick="check2()">
                                <input name="Submit2" type="reset" class="buttons" value="  重  置  ">
</div></td>
                          </tr>
                      </table></td>
                    </tr>
                  </form>
              </table></td>
            </tr>
          </table></td>
      </tr>
    </table>
<%}%>
<% if(request.getParameter("type").equals("意向购车")){%>
<table width="580" height="566" border="1" cellpadding="0" cellspacing="0">
      <tr bgcolor="#FFCC99">
        <td height="20">&nbsp;<a href="SpeakFor.jsp"  style="color:#000000 ">订购中心</a> --&gt;&gt; 意向购车</td>
      </tr>
      <tr><td><table width="500" height="460" border="0" align="center" cellpadding="0" cellspacing="0" class="table">
            <tr>
              <td valign="middle"><table width="480" height="370" border="0" align="center" cellpadding="0" cellspacing="0">
                  <tr>
                    <td height="40" align="center"><div align="center" class="bottm" style="font-size: 16px;color: #FF0000;font-weight: bold;width:130;">意 向 购 车</div></td>
                  </tr>
                  <tr>
                    <td height="25" align="center">&nbsp;</td>
                  </tr>
                  <form name="order" method="post" action="SpeakFor.jsp?order=order">
                    <tr>
                      <td valign="top">
                        <table width="480" height="330" border="0" cellpadding="0" cellspacing="0">
                          <tr>
                            <td width="152" height="30"><div align="right">登录名称：</div></td>
                            <td width="328" height="30"><input name="names" type="text" class="wenbenkuang" id="names" size="20" value=""></td>
                          </tr>
                          <tr valign="bottom">
                            <td height="30"><div align="right">登录密码：</div></td>
                            <td height="30"><input name="password" type="text" class="wenbenkuang" id="password" size="20" value=""></td>
                          </tr>
                          <tr valign="bottom">
                            <td height="30"><div align="right">确认密码：</div></td>
                            <td height="30"><div align="left">
                              <input name="password2" type="text" class="wenbenkuang" id="password2" size="20" value="">
                              </div></td>
                          </tr>
                          <tr valign="bottom">
                            <td height="30"><div align="right">真实姓名：</div></td>
                            <td height="30"><input name="realname" type="text" class="wenbenkuang" id="realname" size="20" value=""></td>
                          </tr>
                          <tr valign="bottom">
                            <td height="30"><div align="right">联系电话：</div></td>
                            <td height="30">
                                <div align="left">
                                  <input name="phone" type="text" class="wenbenkuang" id="phone" size="20" value="">
                                </div></td>
                          </tr>
                          <tr valign="bottom">
                            <td height="30"><div align="right">感兴趣的品牌：</div></td>
                            <td height="30"><input name="carname" type="text"  class="wenbenkuang" id="carname" value="">
                            </td>
                          </tr>
                          <tr valign="bottom">
                            <td height="30"><div align="right">感兴趣的车型：</div></td>
                            <td height="30"><input name="cartype" type="text"  class="wenbenkuang" id="cartype" value="">
                            </td>
                          </tr>
                          <tr valign="bottom">
                            <td height="30"><div align="right">E-mail地址：</div></td>
                            <td height="30"><input name="email" type="text" class="wenbenkuang" id="email" size="45" value=""></td>
                          </tr>
                          <tr valign="bottom">
                            <td height="30"><div align="right">手机号码：</div></td>
                            <td height="30"><input name="hander" type="text" class="wenbenkuang" id="hander" size="30" value=""></td>
                          </tr>
                          <tr valign="bottom">
                            <td height="30"><div align="right">家庭住址：</div></td>
                            <td height="30"><input name="address" type="text" class="wenbenkuang" id="address" size="50" value=""></td>
                          </tr>
                          <tr valign="bottom">
                            <td height="30" colspan="2">                              <div align="center">
                                <input name="Submit22" type="button" class="buttons" value="  申  请  " onClick="check1()">
                                <input name="Submit22" type="reset" class="buttons" value="  重  置  ">
                            </div></td>
                          </tr>
                        </table></td>
                    </tr>
                  </form>
              </table></td>
            </tr>
          </table></td>
      </tr>
    </table>
<%}%>
<% if(request.getParameter("type").equals("订购帮助")){%>
  <%order.setfile(application.getRealPath("/Text"),"OrderHelp.dll");%>
  <%order.setsize(566,460);%>
  <%order.setname("订购中心"," 订 购 帮 助 ");%>
<%=order.gettable()%>
<%}%>
<% if(request.getParameter("type").equals("")){%>
		<%=cus.gettable()%>
<%}}%>
	</td>
  </tr>
</table>
<%@ include file="Bottom.jsp" %>
</body>
</html>
