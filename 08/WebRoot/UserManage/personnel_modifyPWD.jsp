<%@ page language="java" pageEncoding="gb2312"%>
<%@ page import="java.util.*"%>
<%@page import="com.hiernate.persistence.*"%>
<jsp:directive.page import="com.hiernate.util.HibernateUtil"/>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<head>
	<html:base />
	<title>修改员工信息</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link href="../CSS/style.css" rel="stylesheet" type="text/css">
</head>
<body>
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
}
.style1 {color: #C60001}
.style2 {color: #669999}
.STYLE4 {
	font-size: 9pt;
	color: #FFFFFF;
}
.STYLE6 {
	font-size: 9pt;
	color: #000000;
}
-->
</style>
<script language="javascript">
function Mycheck()
{
if (form1.username.value=="")
{ alert("请输入员工姓名！");form1.username.focus();return;}
if (form1.PWD.value=="")
{ alert("请输入原密码！");form1.PWD.focus();return;}
if (form1.PWD.value!=form1.hPWD.value)
{ alert("您输入原密码不正确，请重新输入！");form1.PWD.value="";
form1.PWD.focus();return;}
if (form1.NewPWD.value=="")
{ alert("请输入新密码！");form1.NewPWD.focus();return;}
if (form1.PWDOK.value=="")
{ alert("确认新密码！");form1.PWDOK.focus();return;}
if (form1.NewPWD.value!=form1.PWDOK.value)
{alert("您两次输入的新密码不一致，请重新输入！");form1.NewPWD.value="";
form1.PWDOK.value="";form1.NewPWD.focus();return;}
if (form1.tel.value=="")
{ alert("请输入员工的联系电话！");form1.tel.focus();return;}
if(form1.email.value!="" && (form1.email.value.indexOf('@',0)==-1||
 form1.email.value.indexOf('.',0)==-1))
{alert("您输入的E-mail地址不对！");form1.email.focus();return;}
if (form1.address.value=="")
{ alert("请输入员工的住址！");form1.address.focus();return;}
form1.submit();
}
</script>

<body>
<table width="460" height="403" border="0" cellpadding="-2" cellspacing="-2" background="../Images/noword.jpg">
  <tr>
    <td width="817" height="349" valign="top"><table width="100%" height="102"  border="0" cellpadding="-2" cellspacing="-2">
      <tr>
        <td height="102"><table width="423" height="94" border="0">
          <tr><br><br>
            <td height="15">&nbsp;&nbsp;&nbsp;&nbsp;<span class="STYLE6">&nbsp;修改个人信息</span></td>
          </tr>
          <tr>
            <td height="26">&nbsp;</td>
          </tr>
        </table></td>
      </tr>
    </table>      
    <%
        String strid = request.getParameter("ID");
        session.setAttribute("ids",strid);
        List listUser = HibernateUtil.findUserId(Integer.parseInt(strid));
        if(!listUser.isEmpty()&& listUser.size()>0){
        	for(int i=0 ;i<listUser.size();i++){
        		User user = (User)listUser.get(i);
        	
    %>
      <form ACTION="personnel_updateCenter.jsp" METHOD="POST" name="form1">
        <table width="95%" height="177"  border="0" align="center" cellpadding="-2" cellspacing="-2">
          <tr>
            <td colspan="4" class="STYLE6">&nbsp;&nbsp;用户名：<%=user.getUserName()%></td>
          </tr>
		  <tr>
            <td width="14%" height="27"><div align="center" class="STYLE6">姓名：</div></td>
            <td width="31%"><input name="name" type="text" class="Sytle_text" id="username" value="<%=user.getName()%>" size="18"></td>
            <td width="15%" class="STYLE6">原密码：</td>
            <td width="40%"><input name="PWD" type="password" class="Sytle_text" id="PWD">
            <input name="hPWD" type="hidden" id="hPWD" value="<%=user.getPwd()%>"></td>
          </tr>
          <tr>
            <td height="27" valign="top"><div align="center" class="STYLE6">性别：</div></td>
            <td><span class="style1">
              <select name="sex" id="select">
                 <%
               String strSex = user.getSex();
                
                 String[] sex={"男","女"};
                 for(int k=0;k<sex.length;k++){
        	 if(strSex.equalsIgnoreCase(sex[k]))
        		{out.println("<option value='"+sex[k]+"' selected='selected'>"+sex[k]+"</option>");}
        	 else
            	{out.println("<option value='"+sex[k]+"'>"+sex[k]+"</option>");}
                }
              %>
            </span> </td>
            <td class="STYLE6">新密码：</td>
            <td><input name="NewPWD" type="password" class="Sytle_text" id="NewPWD"></td>
          </tr>
          <tr>
            <td height="27" valign="top"><div align="center" class="STYLE6">电话：</div></td>
            <td><input name="tel" type="text" class="Sytle_text" id="tel" value="<%=user.getTel()%>" size="18"></td>
            <td class="STYLE6">确认密码：</td>
            <td><input name="PWDOK" type="password" class="Sytle_text" id="PWDOK"></td>
          </tr>
          <tr>
            <td height="27" valign="top" class="style1"><div align="center" class="STYLE6">E-mail：</div></td>
            <td colspan="3"><input name="email" type="text" class="Style_subject" id="email" value="<%=user.getEmail()%>"></td>
          </tr>
          <tr>
            <td height="27" valign="top" class="style1"><div align="center" class="STYLE6">地址：</div></td>
            <td colspan="3"><input name="address" type="text" class="Style_subject" id="address" value="<%=user.getAddress()%>"></td>
          </tr>
          <%}} %>
          <tr>
            <td colspan="4"><div align="center">
                <input name="Button" type="button" class="btn_grey" value="修改" onClick="Mycheck()">
                <input name="Submit2" type="reset" class="btn_grey" value="重置">
                <input name="myclose" type="button" class="btn_grey" id="myclose" value="关闭" onClick="javascrip:window.close()">
            </div></td>
          </tr>
        </table>
      </form></td>
  </tr>
</table>

</body>




