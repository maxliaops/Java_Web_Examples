<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
request.setAttribute("homepage",basePath);
%>
<html>
  <head>
    <base href="<%=basePath%>">
    <link href="css/style.css" type="text/css" rel="stylesheet">
	<script src="js/validate.JS" language="javascript" type="text/javascript"></script>
    <title>明日博客地带-用户注册</title>
  </head>
  <%@ taglib prefix="s" uri="/struts-tags"%>
  <body>
  <table width="800" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td height="65" align="center"><img src="images/f_top1.gif" width="800" height="173"></td>
    </tr>   
  </table>
   
  <table width="800" height="28" border="0" align="center" cellpadding="0" cellspacing="0" background="images/f_top2.gif">
    <tr>
      <td width="640">&nbsp;</td>
      <td width="160"><a href="index.jsp" class="a1">返回</a> | 注册&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
    </tr>
  </table>
  
  <table width="800" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
    <tr>
      <td height="316" align="center">
       <br>
	  <table width="740" border="1" cellpadding="1" cellspacing="1" bordercolor="#CCCCCC" bgcolor="F9F9F9">
	  <s:form action="userInfo_addUserInfo">
        <tr >
          <td width="73" height="30" bgcolor="F9F9F9">用户名</td>
          <td width="288" height="30" align="left" bgcolor="#FFFFFF"><s:textfield name="account"/><s:fielderror><s:param value="%{'account'}"/></s:fielderror></td>
          <td width="82" height="30">真实姓名</td>
          <td width="303" height="30" align="left" bgcolor="#FFFFFF"><s:textfield name ="realname"/><s:fielderror><s:param value="%{'realname'}"/></s:fielderror></td>
        </tr>
        <tr >
          <td height="30" bgcolor="F9F9F9">密码</td>
          <td height="30" align="left" bgcolor="#FFFFFF"><s:password name ="password"/><s:fielderror><s:param value="%{'password'}"/></s:fielderror></td>
          <td height="30">密码确认</td>
          <td height="30" align="left" bgcolor="#FFFFFF"><s:password name ="repassword"/><s:fielderror><s:param value="%{'repassword'}"/></s:fielderror></td>
        </tr>    
        <tr >
          <td height="30" bgcolor="F9F9F9">个人信箱</td>
          <td height="30" align="left" bgcolor="#FFFFFF"><s:textfield name ="email"/><s:fielderror><s:param value="%{'email'}"/></s:fielderror></td>
          <td height="30">联系QQ</td>
          <td height="30" align="left" bgcolor="#FFFFFF"><s:textfield name ="qq"/><s:fielderror><s:param value="%{'qq'}"/></s:fielderror></td>
        </tr>
        <tr >
          <td height="30" bgcolor="F9F9F9">家庭地址</td>
          <td height="30" align="left" bgcolor="#FFFFFF"><s:textfield name ="address"/><s:fielderror><s:param value="%{'address'}"/></s:fielderror></td>
          <td height="30">性别</td>
          <td height="30" align="left" bgcolor="#FFFFFF"><s:radio name="sex" list="{'男','女' }" value="%{'男'}" cssClass="button"/></td>
        </tr>
        <tr >
          <td height="30" bgcolor="F9F9F9">职业</td>
          <td height="30" align="left" bgcolor="#FFFFFF"><s:textfield name ="profession"/><s:fielderror><s:param value="%{'profession'}"/></s:fielderror></td>
          <td height="30">联系电话</td>
          <td height="30" align="left" bgcolor="#FFFFFF"><s:textfield name ="tel"/><s:fielderror><s:param value="%{'tel'}"/></s:fielderror></td>
        </tr>    
        <tr>
          <td height="101" bgcolor="F9F9F9">人物头像</td>
          <td height="101" colspan="3" align="left" bgcolor="#FFFFFF">
		  
		    <table border="0" align="center" cellpadding="0" cellspacing="0">
            <tr align="center">
              <td height="72"><img src="images/headgif/1.gif" width="60" height="60">
			   <br><br>
		        <input name="headgif" type="radio" value="images/headgif/1.gif" checked class="button"></td>
              <td><img src="images/headgif/2.gif" width="60" height="60">
			   <br> <br>
		        <input type="radio" name="headgif" value="images/headgif/2.gif"  class="button"></td>
              <td><img src="images/headgif/3.gif" width="60" height="60">
			   <br> <br>
		        <input type="radio" name="headgif" value="images/headgif/3.gif"  class="button"></td>
              <td><img src="images/headgif/4.gif" width="60" height="60">
			   <br> <br>
		        <input type="radio" name="headgif" value="images/headgif/4.gif"  class="button"></td>
              <td><img src="images/headgif/5.gif" width="60" height="60">
			   <br> <br>
		        <input type="radio" name="headgif" value="images/headgif/5.gif"  class="button"></td>
              <td><img src="images/headgif/6.gif" width="60" height="60">
			   <br> <br>
		        <input type="radio" name="headgif" value="images/headgif/6.gif"  class="button"></td>
              <td><img src="images/headgif/7.gif" width="60" height="60">
			   <br> <br>
		        <input type="radio" name="headgif" value="images/headgif/7.gif"  class="button"></td>
			  <td><img src="images/headgif/8.gif" width="60" height="60">
			  <br> <br>
		        <input type="radio" name="headgif" value="images/headgif/8.gif"  class="button"></td>
			  <td><img src="images/headgif/9.gif" width="60" height="60">
			  <br> <br>
		        <input type="radio" name="headgif" value="images/headgif/9.gif"  class="button"></td>
            </tr>
            <tr align="center">
              <td width="74" height="19"><img src="images/headgif/10.gif" width="60" height="60">
			   <br> <br>
		        <input type="radio" name="headgif" value="images/headgif/10.gif" class="button"></td>
              <td width="74"><img src="images/headgif/11.gif" width="60" height="60">
			   <br> <br>
		        <input type="radio" name="headgif" value="images/headgif/11.gif" class="button"></td>
              <td width="74"><img src="images/headgif/12.gif" width="60" height="60">
			   <br> <br>
		        <input type="radio" name="headgif" value="images/headgif/12.gif" class="button"></td>
              <td width="74"><img src="images/headgif/13.gif" width="60" height="60">
			   <br> <br>
		        <input type="radio" name="headgif" value="images/headgif/13.gif" class="button"></td>
              <td width="74"><img src="images/headgif/14.gif" width="60" height="60">
			   <br> <br>
		        <input type="radio" name="headgif" value="images/headgif/14.gif" class="button"></td>
              <td width="74"><img src="images/headgif/15.gif" width="60" height="60">
			   <br> <br>
		        <input type="radio" name="headgif" value="images/headgif/15.gif" class="button"></td>
              <td width="74"><img src="images/headgif/16.gif" width="60" height="60">
			   <br> <br>
		        <input type="radio" name="headgif" value="images/headgif/16.gif" class="button"></td>
			  <td width="74"><img src="images/headgif/17.gif" width="60" height="60">
			   <br> <br>
		        <input type="radio" name="headgif" value="images/headgif/17.gif" class="button"></td>
			  <td width="74">&nbsp;</td>
            </tr>
          </table>		  </td>
        </tr>
        <tr >
          <td height="30" bgcolor="F9F9F9">格言</td>
          <td height="30" colspan="3" align="left" bgcolor="#FFFFFF"><s:textarea name="self" cols="100"></s:textarea></td>
        </tr>
	    <tr>
          <td height="30" bgcolor="F9F9F9">校验码</td>
          <td height="30" colspan="3" align="left" bgcolor="#FFFFFF"><s:textfield name ="code"/><s:fielderror><s:param value="%{'code'}"/></s:fielderror></td>
        </tr>
		 <tr >
          <td height="30" bgcolor="#FFFFFF">&nbsp;&nbsp;</td>
          <td height="30" colspan="3" align="left" bgcolor="#FFFFFF"><a href="javascript:refreshImg('validateCodeImg');"><img src="image.jsp" name="validateCodeImg" border=0 id="validateCodeImg" /></a></td>
        </tr>
        <tr bgcolor="#FFFFFF" >
          <td height="30" colspan="4" align="center"><s:submit value=" 添加 "/><s:hidden name="homepage" value="%{#request.homepage}"/></td>
        </tr>
        </s:form>
      </table>
      <s:fielderror><s:param value="%{'reepassword'}"/></s:fielderror>
      <br>
	  
	  </td>
    </tr>
  </table>
  <table width="800" height="80" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
    <tr align="center">
      <td>
	  <hr width="780" color="#000000" size="2">
	  <br>       
      <font color="979797">吉林省明日科技有限公司   &nbsp;&nbsp;热线电话：</font><font color="#8E335F">0431-84948981 &nbsp;84948981</font>
	  
	  
	  </td>
    </tr>
  </table>
  </body>
</html>
