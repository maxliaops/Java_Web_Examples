<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<% request.setCharacterEncoding("gb2312");%>
<html>
<head>
<title>华奥汽车销售集团网站</title>
</head>
<jsp:useBean id="data" scope="session" class="cars.Bean1" />
<link rel="stylesheet" href="Css/style.css">
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
	type=request.getParameter("type");
	java.util.Date today=new java.util.Date();
	years=today.getYear();
	month1=Integer.parseInt(request.getParameter("month1"));
	day1=Integer.parseInt(request.getParameter("day1"));
	month2=Integer.parseInt(request.getParameter("month2"));
	day2=Integer.parseInt(request.getParameter("day2"));
	java.sql.Date start=new java.sql.Date(years,month1,day1);
	java.sql.Date end=new java.sql.Date(years,month2,day2);
	java.sql.Date nows=new java.sql.Date(years,today.getMonth(),today.getDate());
	sql="insert into tb_Tenancy values('"+name+"','"+pwd+"','"+linkman+"','"+phone+"','"+fax+"','"+email+"','"+hander+"','"+address+"','"+numbers+"','"+cars+type+"','"+start+"','"+end+"','"+nows+"','未受理')";
	i=data.getint(sql);
	if(i>0){
%>
<script language="javascript">
	alert("完成在线预定，请静待我们与您联系！");
	window.close();
</script>
<%	}
}%>
<body topmargin="0" leftmargin="0">
<table width="504" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#efefef">
  <form name="form2" method="post" action="Destine.jsp">
    <tr>
      <td height="40" colspan="4" align="center"><div align="center" class="bottm" style="font-size: 18px;font-weight: bold;color: #FF0000;width:150; ">在 线 预 定</div></td>
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
      <td height="27" colspan="3"><input name="hander" type="text" class="wenbenkuang" id="hander"></td>
    </tr>
    <tr>
      <td height="27"><div align="right">传真：</div></td>
      <td height="27" colspan="3"><input name="fax" type="text" class="wenbenkuang" id="fax"></td>
    </tr>
    <tr>
      <td height="27"><div align="right">E-mail：</div></td>
      <td height="27" colspan="3"><input name="email" type="text" class="wenbenkuang" id="email" size="50"></td>
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
      <td height="27" colspan="2">&nbsp;<%=request.getParameter("type")%>        </td>
      <td height="25">&nbsp;</td>
    </tr>
    <tr>
      <td height="27"><div align="right">租车时间：</div></td>
      <td height="27" colspan="2"> 2005 年
          <select name="select" class="wenbenkuang">
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
        <select name="select3" class="wenbenkuang">
          <option value="1">1</option>
          <option value="2">2</option>
          <option value="3" selected>3</option>
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
          <select name="select2" class="wenbenkuang">
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
        <select name="select4" class="wenbenkuang">
          <option value="1">1</option>
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
          <option value="12" selected>12</option>
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
          <input name="Submit2" type="submit" class="buttons" value=" 提 交 预 定 ">
          <input name="Submit3" type="reset" class="buttons" value=" 重 置 ">
          <input name="Submit32" type="button" class="buttons" value=" 返 回 " onClick="javascript:window.close()">
      </div></td>
    </tr>
  </form>
</table>
</body>
</html>
