<%@ page contentType="text/html; charset=gb2312" import="java.sql.*"%>
<%@ page import="java.io.*" %>
<%@ page import="java.util.Date"%>
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
<jsp:useBean id="search" scope="page" class="cars.SearchTable" />
<jsp:useBean id="order" scope="page" class="cars.OrderHelp" />
<%!
	ResultSet rs;
	String sql;
	int i,max,years,month1,month2,day1,day2;
	String name,pwd,pwd2,linkman,phone,email,fax,address,hander,numbers,cars,type;
%>
<% if(request.getParameter("action")!=null){
	name=request.getParameter("name");
	pwd=request.getParameter("pwd");
	pwd2=request.getParameter("pwd2");
	linkman=request.getParameter("linkman");
	phone=request.getParameter("phone");
	hander=request.getParameter("hander");
	fax=request.getParameter("fax");
	email=request.getParameter("email");
	address=request.getParameter("address");
	numbers=request.getParameter("numbers");
	cars=request.getParameter("cars");
	java.util.Date today=new java.util.Date();
	years=today.getYear();
	month1=Integer.parseInt(request.getParameter("month1"));
	day1=Integer.parseInt(request.getParameter("day1"));
	month2=Integer.parseInt(request.getParameter("month2"));
	day2=Integer.parseInt(request.getParameter("day2"));
	java.sql.Date start=new java.sql.Date(years,month1,day1);
	java.sql.Date end=new java.sql.Date(years,month2,day2);
	java.sql.Date nows=new java.sql.Date(years,today.getMonth(),today.getDate());
	sql="insert into tb_Tenancy values('"+name+"','"+pwd+"','"+linkman+"','"+phone+"','"+fax+"','"+email+"','"+hander+"','"+address+"','"+numbers+"','"+cars+"','"+start+"','"+end+"','"+nows+"','未受理')";
	i=data.getint(sql);
	if(i>0){
%>
<script language="javascript">
	alert("完成在线预定，请静待我们与您联系！");
	location.href="Tenancy.jsp";
</script>
<%	}
}%>
<link rel="stylesheet" href="Css/style.css">
<SCRIPT src="Js/TextColor.js"></SCRIPT>
<script language="javascript">
	function check(){
	 var names=form2.name.value;
	 var pwd=form2.pwd.value;
	 var pwd2=form2.pwd.value;
	 var linkman=form2.linkman.value;
	 var phone=form2.phone.value;
	 var address=form2.address.value;
	 var numbers=form2.numbers.value;
	 var cars=form2.cars.value;
	 if(names==""){
	 	alert("请填写您的登录名称");
		form2.name.focus();
	}
	else if(pwd==""){
		alert("请填写您的登陆密码");
		form2.pwd.focus();
	}
	else if(pwd2==""){
		alert("请确认您的登陆密码");
		form2.pwd2.focus();
	}
	else if(linkman==""){
		alert("请填写确切的联系人姓名");
		form2.linkman.focus();
	}
	else if(phone==""){
		alert("请填写确切的联系电话");
		form2.phone.focus();
	}
	else if(address==""){
		alert("请填写确认的联系地址");
		form2.address.focus();
	}
	else if(numbers==""){
		alert("请填写您的身份证号码");
		form2.numbers.focus();
	}
	else if(isNaN(parseInt(numbers))){
		alert("请核对您的身份证号码");
		form2.number.focus();
	}
	else {
		form2.submit();
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
	menu.add(" 租&nbsp;&nbsp; 赁&nbsp;&nbsp; 流&nbsp;&nbsp; 程 ","");
	menu.add(" 在&nbsp;&nbsp; 线&nbsp;&nbsp; 预&nbsp;&nbsp; 订 ","在线预订");
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
	<% if(request.getParameter("type")==null||request.getParameter("type").equals("")){%>
				  <%order.setfile(application.getRealPath("/Text"),"Tenancy.txt");%>
				<%order.setsize(500,450);%>
  				<%order.setname("租赁中心"," 租 赁 帮 助 ");%>
				<%=order.gettable()%>
			  <%}else {%>
				<table width="580" height="500" border="1" cellpadding="0" cellspacing="0">
      <tr bgcolor="#FFCC99">
        <td height="20" colspan="2">&nbsp;<a href="Tenancy.jsp" style="color:#000000 ">租赁中心</a> --&gt;&gt;<%if(request.getParameter("type")==null||request.getParameter("type").equals("")){%> <%="租赁流程"%><%}else{%> <%=request.getParameter("type")%><%}%></td>
      </tr>
      <tr>
        <td colspan="2" valign="middle"><div align="center">

	  <table width="504" border="0" align="center" cellpadding="0" cellspacing="0">
            <form name="form2" method="post" action="Tenancy.jsp">
            <tr>
              <td height="40" colspan="4" align="center"><div align="center" class="bottm" style="font-size: 18px;font-weight: bold;color: #FF0000;width:150; ">在 线 预 订 </div></td>
              </tr>
            <tr>
              <td height="20" colspan="4"><input type="hidden" name="action" value="add"></td>
            </tr>
            <tr>
              <td width="146" height="27"><div align="right">客户名称：</div></td>
              <td height="27" colspan="3">
                <input name="name" type="text" class="wenbenkuang" id="name">
              </td>
              </tr>
            <tr>
              <td height="27"><div align="right">登录密码：</div></td>
              <td height="27" colspan="3"><input name="pwd" type="text" class="wenbenkuang" id="pwd"></td>
              </tr>
            <tr>
              <td height="27"><div align="right">确认密码：</div></td>
              <td height="27" colspan="3"><input name="pwd2" type="text" class="wenbenkuang" id="pwd2"></td>
              </tr>
            <tr>
              <td height="27"><div align="right">联系人：</div></td>
              <td height="27" colspan="3"><input name="linkman" type="text" class="wenbenkuang" id="linkman"></td>
              </tr>
            <tr>
              <td height="27"><div align="right">联系电话：</div></td>
              <td height="27" colspan="3"><input name="phone" type="text" class="wenbenkuang" id="phone"></td>
              </tr>
            <tr>
              <td height="27"><div align="right">手机号码：</div></td>
              <td height="27" colspan="3"><input name="hander" type="text" class="wenbenkuang" id="hander" value="-------"></td>
              </tr>
            <tr>
              <td height="27"><div align="right">传真：</div></td>
              <td height="27" colspan="3"><input name="fax" type="text" class="wenbenkuang" id="fax" value="---------------"></td>
              </tr>
            <tr>
              <td height="27"><div align="right">E-mail：</div></td>
              <td height="27" colspan="3"><input name="email" type="text" class="wenbenkuang" id="email" value="-----------------" size="50"></td>
              </tr>
            <tr>
              <td height="27"><div align="right">联系地址：</div></td>
              <td height="27" colspan="3"><input name="address" type="text" class="wenbenkuang" id="address" size="50"></td>
              </tr>
            <tr>
              <td height="27"><div align="right">身份证号码：</div></td>
              <td width="180" height="27"><input name="numbers" type="text" class="wenbenkuang" id="numbers2" size="30"></td>
              <td width="141" height="27">&nbsp;</td>
              <td width="37" height="25">&nbsp;</td>
            </tr>
            <tr>
              <td height="27"><div align="right">租车类型：</div></td>
              <td height="27" colspan="2"> 
			  <select name="cars" class="wenbenkuang" id="cars">
			<%	
			  rs=cross.getrs(4);
			  if(rs!=null){
			  	int i=0;
			  	while(rs.next()){
			  %>
			  <option value="<%=rs.getString("名称")%>"<%if(i==0){out.print("selected");}%><%i=i+1;%>><%=rs.getString("名称")%></option>
			  <%}}%>
			  </select>
         </td>
              <td height="25">&nbsp;</td>
            </tr>
            <tr>
              <td height="27"><div align="right">租车时间：</div></td>
              <td height="27" colspan="2"> 2005 年
                  <select name="month1" class="wenbenkuang" id="month1">
                    <option value="1" selected>1</option>
                    <option value="2">2</option>
                    <option value="3">3</option>
                    <option value="4">4</option>
                    <option value="5">5</option>
                    <option value="6">6</option>
                    <option value="7">7</option>
                    <option value="8">8</option>
                    <option value="9">9</option>
                    <option value="10">10</option>
                    <option value="11">11</option>
                    <option value="12">12</option>
				  </select>
					  月
					  <select name="day1" type="text" class="wenbenkuang" id="day1">
					    <option value="1" selected>1</option>
					    <option value="2">2</option>
					    <option value="3">3</option>
					    <option value="4">4</option>
					    <option value="5">5</option>
					    <option value="6">6</option>
					    <option value="7">7</option>
					    <option value="8">8</option>
					    <option value="9">9</option>
					    <option value="10">10</option>
					    <option value="11">11</option>
					    <option value="12">12</option>
					    <option value="13">13</option>
					    <option value="14">14</option>
					    <option value="15">15</option>
					    <option value="16">16</option>
					    <option value="17">17</option>
					    <option value="18">18</option>
					    <option value="19">19</option>
					    <option value="20">20</option>
					    <option value="21">21</option>
					    <option value="22">22</option>
					    <option value="23">23</option>
					    <option value="24">24</option>
					    <option value="25">25</option>
					    <option value="26">26</option>
					    <option value="27">27</option>
					    <option value="28">28</option>
					    <option value="29">29</option>
					    <option value="30">30</option>
					    <option value="31">31</option>
					  </select>
					日 </td>
              <td height="25">&nbsp;</td>
            </tr>
            <tr>
              <td height="27">&nbsp;</td>
              <td height="27" colspan="2">2005 年
                <select name="month2" type="text" class="wenbenkuang" id="month2">
                  <option value="1">1</option>
                  <option value="2" selected>2</option>
                  <option value="3">3</option>
                  <option value="4">4</option>
                  <option value="5">5</option>
                  <option value="6">6</option>
                  <option value="7">7</option>
                  <option value="8">8</option>
                  <option value="9">9</option>
                  <option value="10">10</option>
                  <option value="11">11</option>
                  <option value="12">12</option>
                </select>
				月
				<select name="day2" type="text" class="wenbenkuang" id="day2">
									    <option value="1" selected>1</option>
					    <option value="2">2</option>
					    <option value="3">3</option>
					    <option value="4">4</option>
					    <option value="5">5</option>
					    <option value="6">6</option>
					    <option value="7">7</option>
					    <option value="8">8</option>
					    <option value="9">9</option>
					    <option value="10">10</option>
					    <option value="11">11</option>
					    <option value="12">12</option>
					    <option value="13">13</option>
					    <option value="14">14</option>
					    <option value="15">15</option>
					    <option value="16">16</option>
					    <option value="17">17</option>
					    <option value="18">18</option>
					    <option value="19">19</option>
					    <option value="20">20</option>
					    <option value="21">21</option>
					    <option value="22">22</option>
					    <option value="23">23</option>
					    <option value="24">24</option>
					    <option value="25">25</option>
					    <option value="26">26</option>
					    <option value="27">27</option>
					    <option value="28">28</option>
					    <option value="29">29</option>
					    <option value="30">30</option>
					    <option value="31">31</option>
				</select>
				日 </td>
              <td height="25">&nbsp;</td>
            </tr>
            <tr>
              <td height="15">&nbsp;</td>
              <td height="15">&nbsp;</td>
              <td height="15">&nbsp;</td>
              <td height="15">&nbsp;</td>
            </tr>
            <tr valign="top">
              <td height="30" colspan="4"><div align="center">
                <input name="Submit2" type="button" class="buttons" value=" 提 交 预 定 " onClick="check()">
                <input name="Submit3" type="reset" class="buttons" value=" 重 置 ">
              </div></td>
              </tr>  </form>
          </table>
        </div></td>
      </tr>
    </table>
		<% }%>
	</td>
  </tr>
</table>
<%@ include file="Bottom.jsp" %>
</body>
</html>
