<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" %>
<% request.setCharacterEncoding("gb2312"); %>

<jsp:useBean id="rst" scope="page" class="com.mingri.dbconn.DBResult"/>
<jsp:useBean id="trans" scope="page" class="com.mingri.chinese.ToChinese"/>
<html>
  <title>操作员管理</title>
  <link href="../CSS/style.css" rel="stylesheet" type="text/css">
  <meta http-equiv="Content-Type" content="text/html;charset=gb2312">
  <body>
<%
   //防止非法用户绕过登录页面，直接进入系统内部
   boolean isLog=false;
   try{
     //获得用户是否登录的信息
     isLog=((String)session.getAttribute("isLog")).equals("1");
     }catch(Exception e){}
   if(!isLog){
     out.println("<script language='javascript'>alert('您还没有登录');"+
                  "parent.location.href='../index.jsp';</script>");
     }
%>
<table width="584" border="0" cellspacing="0" cellpadding="0">
<tr>
    <td height="27" colspan="6" bgcolor="#EEEEEE" class="tableBorder_gray">
    &nbsp;<span  class="word_deepgrey"> 当前位置：系统设置> </span>操作员管理 &gt;&gt;&gt;</td>
  </tr>
  <tr><td height="40"></td></tr>
    <tr><td valign="top" height="83">
    <table width="100%" height="112"  border="0" cellpadding="0" cellspacing="0">
      <form name="form1" method="post" action="updateUser.jsp">
        <tr><td align="center">操作员姓名：
          <input type="text" name="username">
          </td></tr><tr><td align="center">
          密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码：
          <input type="password" name="newpw1">
          </td></tr><tr><td align="center">
          确认新密码：
          <input type="password" name="newpw2">
         
        </td></tr>
      
        <tr><td align="center">
            <input name="submit1" type="button" class="btn_grey" value="确认注册" onClick="check()">
            &nbsp;
            <input type="reset" class="btn_grey" value="重新填写">
            <a href="userexit.jsp">退出系统</a>
          </td></tr></form>
	  </table>
		  </td></tr>
    </table>
  </body>
</html>
<script language="javascript">
function check()
{
  if(form1.username.value==""){
    alert("请输入用户名");form1.username.focus();return;
  }
  if(form1.newpw1.value==""){
    alert("请输入密码");form1.newpw1.focus();return;
  }
  if(form1.newpw2.value==""){
    alert("请再次输入密码");form1.newpw2.focus();return;
  }
  if(form1.newpw1.value!=form1.newpw2.value){
    alert("两次密码输入不一致,请从新输入");
    form1.newpw1.value="";
    form1.newpw2.value="";
    form1.newpw1.focus();
    return;
  }
  form1.submit();
}
</script>







