<%@ page language="java" pageEncoding="GBK"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
 
<html> 
	<head>
		<title>高校选课系统首页</title>
	<meta http-equiv="Content-Type" content="text/html; charset=gb2312"><style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
.STYLE1 {color: #FF0000}
.STYLE3 {color: #FF0000; font-size: 9pt; }
.STYLE7 {font-size: 9pt}
-->
    </style></head>
	<body>
		<html:form action="/userLogin.do">
			<table width="449" height="238" align="center" background="images/index.jpg">
				<tr>
					<td colspan="3" height="76" >&nbsp;</td>
				</tr>
				<tr class="STYLE1">
				  <td height="22" colspan="3" align="center"><span class="STYLE3">${error}</span></td>
			  </tr>
				<tr>
					<td width="59" height="23">&nbsp;</td>
					<td width="55"><span class="STYLE7">用户名：</span></td>
					<td width="319"><html:text property="loginName" value="mr"/></td>
				</tr>
				<tr>
					<td height="24">&nbsp;</td>
					<td><span class="STYLE7">密&nbsp;码：</span></td>
					<td><html:password property="pwd" value="mrsoft"/></td>
				</tr> 
				<tr> 
					<td colspan="3" class="STYLE7" align="center">
						<html:submit value="登录"/>
						<html:reset value="重置"/>
						<html:link href="reg.jsp">新用户注册</html:link>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					</td>
				</tr>
				<tr>
					<td height="45" colspan="3">&nbsp;</td>
				</tr>
		  </table>
		</html:form>
	</body>
</html>

