<%@ page language="java" pageEncoding="GBK"%>

<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html:html lang="true">
  <head>
    <title>课程详细信息</title>
	<link rel="stylesheet" type="text/css" href="images/style.css">
  </head>
  <body>
    <table width="845" border="0" cellspacing="0" align="center">
  <tr>
    <td height="124" colspan="2" background="images/topU.gif">&nbsp;</td>
  </tr>
  <tr>
    <td width="145" height="500" align="left" valign="top" bgcolor="#E4F0D8">
	  <jsp:include page="left.jsp"/></td>
    <td align="left" valign="top">
			<table cellspacing="0" align="center" width="600">
			<tr>
				<td height="20" colspan="2"></td>
			</tr>
			<tr>
				<td width="14" background="images/jiantou.jpg">&nbsp;</td>
				<td width="585"><span class="STYLE2">当前位置：</span>课程详细信息</td>
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
    <html:form action="/stuUser.do?method=selectting">
      <table width="500" align="center" cellspacing="0">
			<tr>
				<td height="30" align="right" class="td0">课程名称：</td>
				<td class="td0">&nbsp;</td>
				<td class="td0">&nbsp;</td>
				<td class="td0">${course.name}</td>
			</tr>
			<tr>
				<td height="30" align="right" class="td1">课程学分：</td>
				<td class="td1">&nbsp;</td>
				<td class="td2">&nbsp;</td>
				<td class="td1">${course.credit}</td>
			</tr>
			<tr>
				<td height="30" align="right" class="td1">上课时间：</td>
				<td class="td1">&nbsp;</td>
				<td class="td2">&nbsp;</td>
				<td class="td1">${course.schooltime}</td>
			</tr>
			<tr>
				<td height="30" align="right" class="td1">上课地点：</td>
				<td class="td1">&nbsp;</td>
				<td class="td2">&nbsp;</td>
				<td class="td1">${course.addr}</td>
			</tr>
			<tr>
				<td height="30" align="right" class="td1">课程简介：</td>
				<td class="td1">&nbsp;</td>
				<td class="td2">&nbsp;</td>
				<td class="td1">${course.courseInfo}</td>
			</tr>
			<tr>
				<td height="30" align="right" class="td1">授课教师：</td>
				<td class="td1">&nbsp;</td>
				<td class="td2">&nbsp;</td>
				<td class="td1">${course.teacherName}</td>
			</tr>
			<tr>
				<td height="30" align="right" class="td1">教师简介：</td>
				<td class="td1">&nbsp;</td>
				<td class="td2">&nbsp;</td>
				<td class="td1">${course.teacherInfo}</td>
			</tr>
			<tr>
			  <td height="30" align="center">&nbsp;</td>
			  <td height="24" colspan="2" align="center"><html:link page="/stuUser.do?method=${path}">返回</html:link></td>
			  <td height="24" align="center">&nbsp;</td>
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
