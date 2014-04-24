<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
	String account = session.getAttribute("account").toString();
	
	
%>
<s:set name="account" value="%{account}"/>
<s:set name="userInfo" value="%{#request.userInfo}"/>
<title><s:property value="#account"/>的博客后台管理-用户修改</title>
</head>
<body>
<jsp:include page="manager_top.jsp" flush="true"/>
<table width="900" height="39" border="0" align="center" cellpadding="0" cellspacing="0" background="images/b_b_top1.gif">
  <tr>
    <td width="249">&nbsp;&nbsp;<font color="#FFFFFF"><b>当前登录用户：${session.account}</b></font></td>
    <td width="651">博客信息修改</td>
  </tr>
</table>
<table width="900" border="1" align="center" cellpadding="0" cellspacing="0" bordercolor="EBF1FD">
  <tr>
    <td width="194" height="339" valign="top" bgcolor="EBF1FD"><jsp:include page="manager_left.jsp" flush="true"/></td>
    <td align="center" valign="top" bgcolor="#FFFFFF"><br>    <br>
      <table border="1" cellpadding="1" cellspacing="1" bordercolor="#FFFFFF" bgcolor="EBF1FD">
     <s:form action="userInfo_user_update">
        <tr align="center">
          <td width="82" height="30">用&nbsp;户&nbsp;名</td>
          <td width="190" height="30" align="left" bgcolor="#FFFFFF"><input type="text" name="account" value =<%=account%> readonly="true">
         </td>
          <td width="75" height="30">真实姓名</td>
          <td width="223" height="30" align="left" bgcolor="#FFFFFF"><s:textfield name ="realname" value="%{#userInfo.realname}"/><s:fielderror><s:param value="%{'realname'}"/></s:fielderror></td>
        </tr>          
        <tr align="center">
          <td height="30">个人信箱</td>
          <td height="30" align="left" bgcolor="#FFFFFF"><s:textfield name ="email" value="%{#userInfo.email}"/><s:fielderror><s:param value="%{'email'}"/></s:fielderror></td>
          <td height="30">联系QQ</td>
          <td height="30" align="left" bgcolor="#FFFFFF"><s:textfield name ="qq" value="%{#userInfo.qq}"/><s:fielderror><s:param value="%{'qq'}"/></s:fielderror></td>
        </tr>
        <tr align="center">
          <td height="30">家庭地址</td>
          <td height="30" align="left" bgcolor="#FFFFFF"><s:textfield name ="address" value="%{#userInfo.address}"/><s:fielderror><s:param value="%{'address'}"/></s:fielderror></td>
          <td height="30">性&nbsp;&nbsp;&nbsp;&nbsp;别</td>
          <td height="30" align="left" bgcolor="#FFFFFF"><s:radio name="sex" list="{'男','女' }" value="%{#userInfo.sex}" cssClass="button"/></td>
        </tr>
        <tr align="center">
          <td height="30">职&nbsp;&nbsp;&nbsp;业</td>
          <td height="30" align="left" bgcolor="#FFFFFF"><s:textfield name ="profession" value="%{#userInfo.profession}"/><s:fielderror><s:param value="%{'profession'}"/></s:fielderror></td>
          <td height="30">联系电话</td>
          <td height="30" align="left" bgcolor="#FFFFFF"><s:textfield name ="tel" value="%{#userInfo.tel}"/><s:fielderror><s:param value="%{'tel'}"/></s:fielderror></td>
        </tr>    
        <tr align="center">
          <td height="101">人物头像</td>
          <td height="101" colspan="3" align="left" bgcolor="#FFFFFF">
		  
		    <table width="491" border="0" align="center" cellpadding="0" cellspacing="0">
		  <tr align="center">
              <td width="81" height="19"><img src="images/headgif/13.gif" width="60" height="60">
			   <br> 
			   <br>
		        <input type="radio" name="headgif" value="<s:property value="#userInfo.headgif"/>" checked class="button"></td>
              <td width="81">&nbsp;</td>
              <td width="81">&nbsp;</td>
              <td width="81">&nbsp;</td>
              <td width="81">&nbsp;</td>
              <td width="86">&nbsp;</td>
              </tr>
		  
		  
            <tr align="center">
              <td><img src="images/headgif/1.gif" width="60" height="60">
			   <br>
			   <br>
		        <input name="headgif" type="radio" value="images/headgif/1.gif"  class="button"></td>
              <td><img src="images/headgif/2.gif" width="60" height="60">
			   <br> 
			   <br>
		        <input type="radio" name="headgif" value="images/headgif/2.gif"  class="button"></td>
              <td><img src="images/headgif/3.gif" width="60" height="60">
			   <br> 
			   <br>
		        <input type="radio" name="headgif" value="images/headgif/3.gif"  class="button"></td>
              <td><img src="images/headgif/4.gif" width="60" height="60">
			   <br> 
			   <br>
		        <input type="radio" name="headgif" value="images/headgif/4.gif"  class="button"></td>
              <td><img src="images/headgif/5.gif" width="60" height="60">
			   <br> 
			   <br>
		        <input type="radio" name="headgif" value="images/headgif/5.gif"  class="button"></td>
              <td><img src="images/headgif/6.gif" width="60" height="60">
			   <br> 
			   <br>
		        <input type="radio" name="headgif" value="images/headgif/6.gif"  class="button"></td>
              </tr>
            <tr align="center">
              <td width="81" height="19"><img src="images/headgif/7.gif" width="60" height="60">
			   <br> 
			   <br>
		        <input type="radio" name="headgif" value="images/headgif/10.gif" class="button"></td>
              <td width="81"><img src="images/headgif/8.gif" width="60" height="60">
			   <br> 
			   <br>
		        <input type="radio" name="headgif" value="images/headgif/11.gif" class="button"></td>
              <td width="81"><img src="images/headgif/9.gif" width="60" height="60">
			   <br> 
			   <br>
		        <input type="radio" name="headgif" value="images/headgif/12.gif" class="button"></td>
              <td width="81"><img src="images/headgif/10.gif" width="60" height="60">
			   <br> 
			   <br>
		        <input type="radio" name="headgif" value="images/headgif/13.gif" class="button"></td>
              <td width="81"><img src="images/headgif/11.gif" width="60" height="60">
			   <br> 
			   <br>
		        <input type="radio" name="headgif" value="images/headgif/14.gif" class="button"></td>
              <td width="86"><img src="images/headgif/12.gif" width="60" height="60">
			   <br> 
			   <br>
		        <input type="radio" name="headgif" value="images/headgif/15.gif" class="button"></td>
              </tr>
			      <tr align="center">
              <td width="81" height="19"><img src="images/headgif/13.gif" width="60" height="60">
			   <br> 
			   <br>
		        <input type="radio" name="headgif" value="images/headgif/10.gif" class="button"></td>
              <td width="81"><img src="images/headgif/14.gif" width="60" height="60">
			   <br> 
			   <br>
		        <input type="radio" name="headgif" value="images/headgif/11.gif" class="button"></td>
              <td width="81"><img src="images/headgif/15.gif" width="60" height="60">
			   <br> 
			   <br>
		        <input type="radio" name="headgif" value="images/headgif/12.gif" class="button"></td>
              <td width="81"><img src="images/headgif/16.gif" width="60" height="60">
			   <br> 
			   <br>
		        <input type="radio" name="headgif" value="images/headgif/13.gif" class="button"></td>
              <td width="81"><img src="images/headgif/17.gif" width="60" height="60">
			   <br> 
			   <br>
		        <input type="radio" name="headgif" value="images/headgif/14.gif" class="button"></td>
              <td width="86">&nbsp;</td>
              </tr>
          </table>		  </td>
        </tr>
        <tr align="center">
          <td height="30">格&nbsp;&nbsp;&nbsp;言</td>
          <td height="30" colspan="3" align="left" bgcolor="#FFFFFF"><s:textarea name="self" cols="90" value="%{#userInfo.self}"></s:textarea></td>
        </tr>
	    <tr align="center">
          <td height="30">校&nbsp;验&nbsp;码</td>
          <td height="30" colspan="3" align="left" bgcolor="#FFFFFF"><s:textfield name ="code"/><s:fielderror><s:param value="%{'code'}"/></s:fielderror></td>
        </tr>
		 <tr align="center">
          <td height="30">&nbsp;&nbsp;</td>
          <td height="30" colspan="3" align="left" bgcolor="EBF1FD"><a href="javascript:refreshImg('validateCodeImg');"><img src="image.jsp" name="validateCodeImg" border=0 id="validateCodeImg" /></a></td>
        </tr>
        <tr align="center">
          <td height="30" colspan="4"><s:submit value=" 修改 "/></td>
        </tr>
        </s:form>
    </table>
    
    
    <br>    </td>
  </tr>
</table>
<jsp:include flush="true" page="manager_down.jsp"/>
</body>
</html>
