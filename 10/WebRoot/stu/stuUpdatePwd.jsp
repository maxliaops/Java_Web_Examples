<%@ page language="java" pageEncoding="GBK"%>

<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html:html lang="true">
  <head>
    <title>welcome.jsp</title>
	<link rel="stylesheet" type="text/css" href="images/style.css">
  </head>
  <body>
    <table width="845" cellspacing="0" align="center">
  <tr>
    <td height="124" colspan="2" background="images/topU.gif">&nbsp;</td>
  </tr>
  <tr>
    <td width="150" height="500" bgcolor="#E4F0D8">
		<jsp:include page="left.jsp"/>	</td>
    <td align="left" valign="top">
			<table cellspacing="0" width="600px" align="center">
              <tr>
                <td height="20" colspan="2"></td>
              </tr>
              <tr>
                <td width="14" background="images/jiantou.jpg">&nbsp;</td>
                <td width="585"><span class="STYLE2">当前位置：</span>修改密码</td>
              </tr>
              <tr>
                <td height="8" colspan="2"></td>
              </tr>
              <tr>
                <td height="3" colspan="2" bgcolor="#b1de69"></td>
              </tr>
              <tr>
                <td height="20" colspan="2"></td>
              </tr>
            </table>
		
	<html:form action="/updatePwd.do?&type=u">
			<table width="500" align="center" cellspacing="1" bgcolor="#c2d3b0">
				<tr>
					<td height="30" colspan="3" align="center" bgcolor="#FAFCF7" class="STYLE2">${error}</td>
				</tr>
				<tr>
					<td height="30" align="right" bgcolor="#f8fcf3">登录帐号：</td>
					<td bgcolor="#FAFCF7">&nbsp;
				  <html:text property="loginName" value="${loginName}" readonly="true"/></td>
					<td bgcolor="#FAFCF7">&nbsp;登录帐号不可以修改</td>
				</tr>
				<tr>
					<td height="30" align="right" bgcolor="#f8fcf3">旧密码：</td>
					<td bgcolor="#FAFCF7">&nbsp;
				  <html:password property="pwd"/></td>
					<td bgcolor="#FAFCF7">&nbsp;原始密码</td>
				</tr>
				<tr>
					<td height="30" align="right" bgcolor="#f8fcf3">新密码：</td>
					<td bgcolor="#FAFCF7">&nbsp;
				  <html:password property="pwd1"/></td>
					<td bgcolor="#FAFCF7">&nbsp;新密码</td>
				</tr>
				<tr>
					<td height="30" align="right" bgcolor="#f8fcf3">确认密码：</td>
					<td bgcolor="#FAFCF7">&nbsp;
				  <input type="password" name="pwd2"/></td>
					<td bgcolor="#FAFCF7">&nbsp;确认新密码</td>
				</tr>
				<tr>
					<td height="30" align="right" bgcolor="#f8fcf3">验证邮箱：</td>
					<td bgcolor="#FAFCF7">&nbsp;
				  <html:text property="mail"/></td>
					<td bgcolor="#FAFCF7">&nbsp;注册邮箱</td>
				</tr>
				<tr>
					<td height="30" colspan="3" align="center" bgcolor="#FAFCF7">
						<html:submit value="修改"/>&nbsp;&nbsp;&nbsp;&nbsp;
				  <html:reset value="重置"/>	</td>
				</tr>
		  </table>
		</html:form>
	</td>
  </tr>
  <tr>
  	<td height="85" colspan="2" align="center" background="images/bottomU.gif">&nbsp;</td>
  </tr>
</table>
  </body>
</html:html>
