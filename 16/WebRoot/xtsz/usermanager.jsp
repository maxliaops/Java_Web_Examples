<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" %>
<% request.setCharacterEncoding("gb2312"); %>
<%@ page import="java.io.*,java.sql.*"%>
<jsp:useBean id="rst" scope="page" class="com.mingri.dbconn.DBResult"/>
<jsp:useBean id="trans" scope="page" class="com.mingri.chinese.ToChinese"/>
<html>
  <title>用户基本设置</title>
  <link href="../CSS/style.css" rel="stylesheet" type="text/css">
  <meta http-equiv="Content-Type" content="text/html;charset=gb2312">
  <head>
  	<script language="javascript" >
		function check(){
			var pwd = document.getElementById("pwd");
			var newpwd1 = document.getElementById("newpwd1");
			var newpwd2 = document.getElementById("newpwd2");
		  if(pwd.value==""){
		    alert("请输入密码");
		    document.getElementById("pwd").focus();
		    return false;
		  }
		  if(newpwd1.value==""){
		    alert("请输入新密码");
		   document.getElementById("newpwd1").focus();
		    return false;
		  }
		  if(newpwd2.value==""){
		    alert("请再次输入新密码");
		    document.getElementById("newpwd2").focus();
		    return false;
		  }
		  if(newpwd1.value!=newpwd2.value){
		    alert("两次新密码输入不一致,请从新输入");
		    document.getElementById("newpwd1").value="";
		    document.getElementById("newpwd2").value="";
		    document.getElementById("newpwd1").focus();
		    return false ;
		  }
			return true;
		}
		function modify()
		{
			if(check()){
				 document.getElementById("modify_form").action="usermodify.jsp";
				 document.getElementById("modify_form").method="post";
				 document.getElementById("modify_form").submit();
			}
		}
		function reset()
		{
		   document.getElementById("modify_form").reset();
		}
</script>
  </head>
  <body>
<%
    request.setCharacterEncoding("gb2312");//对字符串统一编码解决表单提交中的中文乱玛问题
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
    &nbsp;<span  class="word_deepgrey"> 当前位置：系统设置 > </span>个人密码修改 &gt;&gt;&gt;</td>
  </tr>
    <tr><td valign="top" height="83">
    <form  id="modify_form"  method="post" action="usermodify.jsp">
    <table width="100%" height="163"  border="0" cellpadding="0" cellspacing="0">
	<tr><td  height="27"></td></tr>
      
        <tr>
        	<td height="25" align="center">
        		操作员姓名：
          		<input type="text" name="username"
             		value="<%=session.getAttribute("username")%>" readonly />
          	</td>
         </tr>
         <tr>
         	<td height="25" align="center">原&nbsp;&nbsp;密&nbsp;&nbsp;码：
          		<input type="password" name="password" id="pwd" />
          	</td>
         </tr>
         <tr>
         <td height="25" align="center">新&nbsp;&nbsp;密&nbsp;&nbsp;码：
          		<input type="password" name="newpw1" id="newpwd1" />
          </td>
          </tr>
          <tr>
          	<td height="25" align="center">确认新密码：
          		<input type="password" name="newpw2" id="newpwd2" />
          </td>
          </tr>
        <tr>
        	<td height="36" align="center">
          		<input type="button" class="btn_grey" value="确认修改" onClick="modify()">
            	<input type="reset" class="btn_grey" value="取消修改" onClick="reset()">
           		<a href="userexit.jsp">退出系统</a>
          	</td>
          </tr>
          
    </table>
    </form>
	</td></tr></table>
  </body>
</html>








