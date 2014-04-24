<%@ page language="java" pageEncoding="gb2312"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<head>
	<html:base />
	<title>index.jsp</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
    <link rel="stylesheet" type="text/css" href="CSS/style.css">
	</head>
<body>
<script language="javascript">
 function mycheck(){
 if (form1.UserName.value=="")
 {alert("请输入用户名！");form1.UserName.focus();return;}
 if(form1.PWD.value=="")
 {alert("请输入密码！");form1.PWD.focus();return;}
 if(form1.yanzheng.value=="")
 {alert("请输入验证码!");form1.yanzheng.focus();return;}
 if(form1.yanzheng.value != form1.verifycode2.value)
 {alert("请输入正确的验证码!!");form1.yanzheng.focus();return;}
 form1.submit();
 }
 </script>
 <style>
   body {
	   margin-left: 0px;
	   background-image: url(Images/bhj.jpg);
  }
   .style2 {color: #990000}
   .input2 {
 	 font-size: 12px;
	 border: 3px double #A8D0EE;
	 color: #344898;
  }
   .submit1 {
	  border: 3px double #416C9C;
	  height: 22px;
	  width: 45px;
	  background-color: #F2F2F2;
	  font-size: 12px;
	  padding-top: 1px;
	  background-image: url(bt.gif);
	  cursor: hand;
 }
    .STYLE12 {font-family: Georgia, "Times New Roman", Times, serif}
    .STYLE13 {color: #316BD6; }
    .STYLE15 {color: #fdsere; font-size: 9pt; }

 </style>
<body>
	<br>
	<br>
	<br>
	<br>
	<table width="559" height="423" border="0" align="center"
		cellpadding="0" cellspacing="0"  background="Images/dfff.jpg">
	 <tr>
		<td width="559">
	<form name="form1" method="POST" action="findUserAction.do?method=finUser"><!-- 提交的action根据struts-config.xml文件对应method后为FindUserAction的方法名 -->
		<table width="410" height="198" border="0" align="right"
			cellpadding="0" cellspacing="0">
	<tr>
		<td height="2" colspan="2"></td>
	</tr>
    <tr>
		<td height="2" colspan="2" valign="top"></td>
	</tr>
	<tr>
	<br><br><br><br><br><br><br><br><br><br><br>
	    <td width="54" height="22" valign="bottom">
		<span class="STYLE15" >用户名：</span>
		</td>
		<td width="356" valign="bottom">
	       <input name="UserName"  type="text" class="input2" onKeyDown="if(event.keyCode==13){form1.PWD.focus();}"
									onMouseOver="this.style.background='#F0DAF3';"
									onMouseOut="this.style.background='#FFFFFF'"><!-- 设置用户名文本框,并设置了鼠标经过是样式 -->
		</td>
	</tr>
	<tr>
		<td height="4" colspan="2" valign="bottom"></td>
	</tr>
	<tr>
		<td height="31" colspan="2" valign="top" class="STYLE15">
					密&nbsp;&nbsp;码：
			<input name="PWD" type="password"  class="input2" align="bottom"
									onKeyDown="if(event.keyCode==13){form1.yanzheng.focus();}"
									onMouseOver="this.style.background='#F0DAF3';"
									onMouseOut="this.style.background='#FFFFFF'"><!-- 设置密码文本框 -->
		</td>
	</tr>
	<tr>
	    <td height="31" colspan="2" valign="top" class="STYLE15" ondragstart="return false" onselectstart="return false">
								  验证码：
			<input name="yanzheng" type="text" class="input2"
						            onKeyDown="if(event.keyCode==13){form1.Submit.focus();}"
									size="8" align="bottom"
									onMouseOver="this.style.background='#F0DAF3';"
									onMouseOut="this.style.background='#FFFFFF'">
									<!-- 设置验证码文本框，并设置鼠标经过的样式 -->
									<%   
                                    int intmethod = (int)( (((Math.random())*11))-1); 
                                    int intmethod2 = (int)( (((Math.random())*11))-1); 
                                    int intmethod3 = (int)( (((Math.random())*11))-1); 
                                    int intmethod4 = (int)( (((Math.random())*11))-1); 
                                    String intsum = intmethod+""+intmethod2+intmethod3+intmethod4; 
                                    //将得到的随机数进行连接
                                   %>
          <input type="hidden" name="verifycode2" value="<%=intsum%>"> <!-- 设置隐藏域,用来做验证比较-->
				<span class="STYLE12"><font size="+3" color="#FF0000"><img src=Images/num/<%=intmethod %>.gif> <img src=Images/num/<%=intmethod2 %>.gif>
				    <!-- 将图片名称与得到的随机数相同的图片显示在页面上  -->
					<img src=Images/num/<%=intmethod3%>.gif> <img src=Images/num/<%=intmethod4 %>.gif></font></span>
			</td>
		</tr>
	<tr>
		<td colspan="2" valign="top">&nbsp; &nbsp; &nbsp; &nbsp;
			<input name="Submit" type="button" class="submit1" value="登录" onClick="mycheck()"> &nbsp;
			<input name="Submit2" type="reset" class="submit1" value="重置"> <!-- 设置提交与重置按钮-->
		</td>
  </tr>
    </table>
	</form>
   </td>
  </tr>
 </table>
</body>




