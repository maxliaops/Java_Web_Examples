<%@ page contentType="text/html; charset=gb2312" import="java.sql.*"%>
<%@ page import="java.io.*" %>
<% request.setCharacterEncoding("gb2312");%>
<html>
<head>
<title>华奥汽车销售集团网站</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<jsp:useBean id="data" scope="session" class="cars.Bean1" />
<jsp:useBean id="menu" scope="session" class="cars.PopMenu" />
<jsp:useBean id="news" scope="page" class="cars.NewsShow" />
<jsp:useBean id="cross" scope="page" class="cars.CrossTable" />
<jsp:useBean id="search" scope="page" class="cars.SearchTable" />
<%!
	ResultSet rs;
	String sql;
	String sql1;
	int i,max;
%>
<% if(request.getParameter("order")!=null){
	String name=request.getParameter("names");
	String phone=request.getParameter("phone");
	String email=request.getParameter("email");
	String hander=request.getParameter("hander");
	String address=request.getParameter("address");
	String carname=request.getParameter("carname");
	String times=request.getParameter("times");
	String bad=request.getParameter("bad");
	String check=request.getParameter("check");
	String change=request.getParameter("change");
	java.util.Date today1=new java.util.Date();
	java.sql.Date now1=new java.sql.Date(today1.getYear(),today1.getMonth(),today1.getDate());
	sql="insert into tb_Permute values('"+name+"','"+phone+"','"+hander+"','"+email+"','"+address+"','"+carname+"','"+times+"','"+bad+"','"+check+"','"+change+"','"+now1+"','未受理')";
	int j=data.getint(sql);
	if(j>0){
%>
<script language="javascript">
alert("意向购车申请已经接收！我们将及时和您联系！");
location.href="Permute.jsp";
</script>
<%}}%>
<link rel="stylesheet" href="Css/style.css">
<SCRIPT src="Js/TextColor.js"></SCRIPT>
<script language="javascript">
	function check1(){
	 var names=order.names.value;
	 var phone=order.phone.value;
	 var hander=order.hander.value;
	 var address=order.address.value;
	 var carname=order.carname.value;
	 var times=order.times.value;
	 if(names==""){
	 	alert("请输入您的真实姓名");
		order.names.focus();
	 }
	 else if(phone==""){
	 	alert("请输入确切的联系电话");
		order.phone.focus();
	 }
	 else if(hander==""){
	 	alert("请输入您的手机号码");
		order.hander.focus();
	}
	else if(address==""){
		alert("请输入您具体的联系地址");
		order.address.focus();
	}
	else if(carname==""){
		alert("请输入您的车辆的品牌名称");
		order.carname.focus();
	}
	else if(times==""){
		alert("请输入您所拥有的车辆的购买时间");
		order.times.focus();
	}				
	 else{
	 	order.submit();
		}
	}
</script>
<%@ include file="Top.jsp" %>
<table width="744" height="500" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#f9f9f9">
  <tr>
    <td width="164" height="500" valign="top"><table width="164" height="500" border="1" cellpadding="0" cellspacing="0">
      <tr>
        <td width="160" height="20" bgcolor="#FFCC99">&nbsp;中心导航</td>
      </tr>
      <tr>
        <td height="100" valign="middle">
          <%
	menu.add(" 置&nbsp;&nbsp; 换&nbsp;&nbsp; 流&nbsp;&nbsp; 程 ","");
	menu.add(" 置&nbsp;&nbsp; 换&nbsp;&nbsp; 申&nbsp;&nbsp; 请 ","置换申请");
	%>
	<%=menu.table()%>
	<%menu.setnull();%>		  </td>
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
	<%if(request.getParameter("type")==null||request.getParameter("type").equals("")){%>
	<table width="580" height="500" border="1" cellpadding="0" cellspacing="0">
      <tr bgcolor="#FFCC99">
        <td height="20" colspan="2">&nbsp;<a href="Permute.jsp" style="color:#000000 ">置换中心</a> --&gt;&gt; 置换流程</td>
      </tr>
      <tr>
        <td colspan="2"><div align="center"><img src="Image/U260P33T2D75496F9DT20040806172620.jpg" width="450" height="232"></div></td>
      </tr>
    </table>
	<%}else{%>
	<table width="580" height="500" border="1" cellpadding="0" cellspacing="0">
      <tr bgcolor="#FFCC99">
        <td height="20" colspan="2">&nbsp;<a href="Permute.jsp" style="color:#000000 ">置换中心</a> --&gt;&gt; 置换申请</td>
      </tr>
      <tr>
        <td colspan="2"><div align="center">
          <table width="500" height="460" border="0" align="center" cellpadding="0" cellspacing="0" class="table">
            <tr>
              <td valign="middle"><table width="480" height="370" border="0" align="center" cellpadding="0" cellspacing="0">
                  <tr>
                    <td height="40" align="center"><div align="center" class="bottm" style="font-size: 16px;color: #FF0000;font-weight: bold;width:130;">置 换 申 请</div></td>
                  </tr>
                  <tr>
                    <td height="25" align="center">&nbsp;</td>
                  </tr>
                  <form name="order" method="post" action="Permute.jsp?order=order">
                    <tr>
                      <td valign="top">
                        <table width="480" border="0" cellpadding="0" cellspacing="0">
                          <tr>
                            <td width="152" height="28"><div align="right">真实姓名：</div></td>
                            <td width="328" height="28"><input name="names" type="text" class="wenbenkuang" id="names" size="20"></td>
                          </tr>
                          <tr valign="bottom">
                            <td height="28"><div align="right">联系电话：</div></td>
                            <td height="28"><input name="phone" type="text" class="wenbenkuang" id="phone" size="20"></td>
                          </tr>
                          <tr valign="bottom">
                            <td height="28"><div align="right">手机号码：</div></td>
                            <td height="28"><div align="left">
                                <input name="hander" type="text" class="wenbenkuang" id="hander" size="20">
                            </div></td>
                          </tr>
                          <tr valign="bottom">
                            <td height="28"><div align="right">E-mail：</div></td>
                            <td height="28"><input name="email" type="text" class="wenbenkuang" id="email" value="------------------" size="35"></td>
                          </tr>
                          <tr valign="bottom">
                            <td height="28"><div align="right">联系地址：</div></td>
                            <td height="28">
                              <div align="left">
                                <input name="address" type="text" class="wenbenkuang" id="address" size="40">
                            </div></td>
                          </tr>
                          <tr valign="bottom">
                            <td height="28"><div align="right">持有车辆名称：</div></td>
                            <td height="28"><input name="carname" type="text" class="wenbenkuang" id="carname" size="30"></td>
                          </tr>
                          <tr valign="bottom">
                            <td height="28"><div align="right">购买时间：</div></td>
                            <td height="28"><input name="times" type="text" class="wenbenkuang" id="times" size="20"></td>
                          </tr>
                          <tr valign="bottom">
                            <td height="28"><div align="right">是否有损：</div></td>
                            <td height="28"><input type="radio" name="bad" value="有损"> 
                              有损
                                <input name="bad" type="radio" value="无损" checked> 
                                无损</td>
                          </tr>
                          <tr valign="bottom">
                            <td height="28"><div align="right">是否已经过车检：</div></td>
                            <td height="28"><input name="check" type="radio" value="已经车检" checked>
                              已经车检
                              <input type="radio" name="check" value="没有车检">
                              没有车检</td>
                          </tr>
                          <tr valign="bottom">
                            <td height="28"><div align="right">欲置换车辆名称：</div></td>
                            <td height="28">
				<select name="change" class="wenbenkuang" id="change">
			<%	
			  rs=cross.getrs();
			  if(rs!=null){
			  	int j=0;
			  	while(rs.next()){
			  %>
			  <option value="<%=rs.getString("品牌")%><%=rs.getString("型号")%>" <%if(j==0){out.print("selected");}%><%j=j+1;%>><%=rs.getString("品牌")%><%=rs.getString("型号")%></option>
			  <%}}%>
			  </select></td>
                          </tr>
                          <tr valign="bottom">
                            <td height="28" colspan="2">
                              <div align="center">
                                <input name="Submit22" type="button" class="buttons" value="  申  请  " onClick="check1()">
                                <input name="Submit22" type="reset" class="buttons" value="  重  置  ">
                            </div></td>
                          </tr>
                      </table></td>
                    </tr>
                  </form>
              </table></td>
            </tr>
          </table>
        </div></td>
      </tr>
    </table>
	<%}%>
	</td>
  </tr>
</table>
<%@ include file="Bottom.jsp" %>
</body>
</html>
