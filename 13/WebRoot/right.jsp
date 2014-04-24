<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<table width="194" height="245" border="0" cellpadding="0" cellspacing="0" background="images/8.jpg">
      <tr>
        <td>
		
		<br><br><br>
		

		
 <c:if  test="${empty sessionScope.userInfo}">	
	<form name="userInfo" method="post" action="userInfoServlet?info=checkUser" onSubmit="return checkEmpty(userInfo)">
	  <table width="166" height="168" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td width="56" height="30"><font color="1BB6C7">用户名：</font></td>
          <td width="110"><input name="username" type="text" size="15" title="请输入用户名" class="input1"></td>
        </tr>
        <tr>
          <td height="30"><font color="1BB6C7">密&nbsp;&nbsp;码：</font></td>
          <td><input name="password" type="password" size="15" title="请输入密码" class="input1"></td>
        </tr>
        <tr>
          <td height="30"><font color="1BB6C7">验证码：</font></td>
          <td><input name="code" type="text" size="15" title="请输入校验码" class="input1"></td>
        </tr>
        <tr>
          <td height="30">&nbsp;</td>
          <td><a href="#" onClick="reload()"><img border=0 src="image.jsp" name="checkCode"></a></td>
        </tr>
        <tr>
          <td height="30" colspan="2" align="center">
		   <input type="image" name="Submit"  src="images/land.gif" class="cannelBorder">
            &nbsp;&nbsp;
			<a href="user_save.jsp"><img src="images/register.gif" border="0"></a>
		</td>
        </tr>
      </table>
	</form>
	
	</c:if>

<c:if  test="${!empty sessionScope.userInfo}">
	
 <table border="0" align="center" cellpadding="0" cellspacing="0">
  <tr align="center">
    <td height="50"><font color="1BB6C7">${sessionScope.userInfo.username}已经成功登录！</font></td>
  </tr>
  <tr align="center">
    <td height="50"><a href="userInfoServlet?info=cannleUser" class="a2">单击此链接退出</a></td>
  </tr>
</table>
</c:if>
		</td>
      </tr>
    </table>
	<br><br>
	


