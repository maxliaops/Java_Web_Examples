<%@ page language="java" pageEncoding="GBK"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<table width="190" height="100%" cellspacing="0" bgcolor="#f6f9f2">
	<tr>
		<td height="30" align="center">
			<html:link page="/stuUser.do?method=welcome">查询基本信息</html:link>
	  </td>
	</tr>
	<tr>
		<td height="30" align="center">
			<html:link page="/stuUser.do?method=select">选择新课程</html:link>
	  </td> 
	</tr> 
	<tr>
		<td height="30" align="center">
			<html:link page="/stuUser.do?method=selected">查询已选课程</html:link>
	  </td>
	</tr>
	<tr>
		<td height="30" align="center">
			<html:link page="/stuP.do">修改登录密码</html:link>
	  </td>
	</tr>
	<tr>
		<td height="30" align="center">
			<html:link page="/stuUser.do?method=exit">退出系统</html:link>
	  </td>
	</tr>
	<tr>
		<td>&nbsp;</td>
	</tr>
</table>