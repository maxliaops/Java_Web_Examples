<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="com.bwm.db.Condb"%> 
<% request.setCharacterEncoding("gb2312"); %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>修改个人信息</title>
<style type="text/css">
<!--
.style1 {color: #CC9933}
-->
</style>
</head>
<link href="../css/style.css" rel="stylesheet">
<script language="JavaScript">
function CheckDate(INDate)
{ if(INDate=="")
    {return true;}
	subYY=INDate.substr(0,4)
	//转换月份
	if(INDate.indexOf('-',0)!=-1){	separate="-"}
	else{
		if(INDate.indexOf('/',0)!=-1){separate="/"}
		else {return true;}}
		area=INDate.indexOf(separate,0)
		subMM=INDate.substr(area+1,INDate.indexOf(separate,area+1)-(area+1))
		if(subMM.length<2){subMM="0"+subMM}
	//转换日
	area=INDate.lastIndexOf(separate)
	subDD=INDate.substr(area+1,INDate.length-area-1)
	if(eval(subDD)<10){subDD="0"+eval(subDD)}
	NewDate=subYY+"-"+subMM+"-"+subDD
	if(NewDate.length!=10){return true;}
    if(NewDate.substr(4,1)!="-"){return true;}
    if(NewDate.substr(7,1)!="-"){return true;}
	if(NewDate.substr(5,2)>"12"){return true;}
	if(NewDate.substr(8,2)>"31"){return true;}
   return false;}
</script>
<script language="javascript">
<!--
	function check(){
		if(form1.Username.value==""){
			alert("用户不能为空");
			form1.Username.focus();
			return false;
		}
		if(form1.Password.value==""){
			alert("密码不设为空值");
			form1.Password.focus();
			return false;
		}
		if(form1.Password.value!=form1.Password1.value){
			alert("两次密码输入不一致");
			return false;
		}
		if(form1.Office.value==""){
			alert("请输入你所在的科室");
			form1.Office.focus();
			return false;
		}
		if(isNaN(form1.Age.value)){
			alert("年龄是数值型请不要非法输入");
			return false;
		}
		if(form1.Age.value>70){
			alert("我的天哪都超过70了还研究呢");
			return false;
		}
		if(form1.Datetime.value==""){
				alert("请输入你参加工作的时间");
				return false;
			}else {
				if(CheckDate(form1.Datetime.value)){
				window.alert("日期类型不正确请按yyyy-mm-dd格式输入");
				return false;
				}
			}
	}
-->
</script>
<%
	Condb con=new Condb();
	String sql="select * from tb_Person where Username='"+session.getAttribute("name")+"' and Password='"+session.getAttribute("password")+"'";
	ResultSet rs=con.executeQuery(sql);
	while(rs.next()){
	String rs2=rs.getString(2);
	String rs4=rs.getString(4);
	String rs5=rs.getString(5);
	String rs6=rs.getString(6);
	String rs7=rs.getString(7);
	String rs8=rs.getString(8);
	String rs9=rs.getString(9);
	if(rs6==null||rs7==null||rs8==null||rs9==null)
	{
		rs6="";rs7="";rs8="";rs9="";
	}
%>
<body>
<br>
<table width="328" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#ECFBFF" class="tableBorder">
<form action="putin.jsp" method="post" name="form1">
  <tr align="center" bgcolor="#F7F3EF">
    <td height="26" colspan="3"><center class="style1">
      <font size="4" face="黑体">修改个人信息</font>
    </center></td>
  </tr>
  <tr>
    <td width="31" height="24">&nbsp;</td>
    <td width="98" height="24">用户名:</td>
    <td width="216" height="24"><input name="Username" type="text" class="txt_grey" value="<%=rs2%>" size="28"></td>
  </tr>
  <tr>
    <td height="24">&nbsp;</td>
    <td height="24">新密码:</td>
    <td height="24"><input name="Password" type="password" class="txt_grey" size="28"></td>
  </tr>
  <tr>
    <td height="24">&nbsp;</td>
    <td height="24">确认密码:</td>
    <td height="24"><input name="Password1" type="password" class="txt_grey" size="28"></td>
  </tr>
  <tr>
    <td height="24">&nbsp;</td>
    <td height="24">科室:</td>
    <td height="24"><input name="Office" type="text" class="txt_grey" value="<%=rs4%>" size="28"></td>
  </tr>
  <tr>
    <td height="24">&nbsp;</td>
    <td height="24">真实姓名:</td>
    <td height="24"><input name="Name" type="text" class="txt_grey" value="<%=rs5%>" size="28"></td>
  </tr>
  <tr>
    <td height="24">&nbsp;</td>
    <td height="24">年龄:</td>
    <td height="24"><input name="Age" type="text" class="txt_grey" value="<%=rs6%>" size="28"></td>
  </tr>
  <tr>
    <td height="24">&nbsp;</td>
    <td height="24">职务:</td>
    <td height="24"><input name="Business" type="text" class="txt_grey" value="<%=rs7%>" size="28"></td>
  </tr>
  <tr>
    <td height="24">&nbsp;</td>
    <td height="24">职称:</td>
    <td height="24"><input name="Post" type="text" class="txt_grey" value="<%=rs8%>" size="28"></td>
  </tr>
  <tr>
    <td height="24">&nbsp;</td>
    <td height="24">工作时间:</td>
    <td height="24"><input name="Datetime" type="text" class="txt_grey" value="<%=rs9%>" size="28"></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td height="24">简历:</td>
    <td height="24"><textarea name="Bio" cols="26" rows="4" class="txt_grey"></textarea></td>
  </tr>
  <tr align="center" bgcolor="#F7F3EF">
    <td height="24" colspan="3"><input name="Submit" type="submit" class="btn_grey" value="提交" onClick="return check()">
    <input name="Submit2" type="reset" class="btn_grey" value="重置"></td>
  </tr>
 </form>
</table>
<%
}
	con.close();
%>
</body>
</html>
