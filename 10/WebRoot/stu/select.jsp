<%@ page language="java" pageEncoding="GBK"%>

<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html:html lang="true">
  <head>
    <title>查看已选课程</title>
	<link rel="stylesheet" type="text/css" href="images/style.css">
  </head>
  
  <body>
    <table width="845" cellspacing="0" align="center">
  <tr>
    <td height="124" colspan="2" background="images/topU.gif">&nbsp;</td>
  </tr>
  <tr>
    <td width="150" height="500" align="left" valign="top" bgcolor="#E4F0D8">
	  <jsp:include page="left.jsp"/></td>
    <td align="left" valign="top">
			<table cellspacing="0" width="600px" align="center">
			<tr>
				<td height="20" colspan="2"></td>
			</tr>
			<tr>
				<td width="14" background="images/jiantou.jpg">&nbsp;</td>
				<td width="585"><span class="STYLE2">当前位置：</span>查询可选课程</td>
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
				<td height="30" align="center" class="td0">&nbsp;</td>
				<td align="center" class="td0"><strong>课程名称</strong></td>
				<td align="center" class="td0"><strong>授课教师</strong></td>
				<td align="center" class="td0"><strong>学分</strong></td>
				<td align="center" class="td0"><strong>上课时间</strong></td>
				<td align="center" class="td0"><strong>上课地点</strong></td>
			</tr>
			<logic:iterate id="list" name="list"> 
				<tr>
				  <td height="30" class="td1"><input type="checkbox" name="courseId" value="${list[1].id}"></td>
				  <td align="center" class="td1"><html:link page="/stuUser.do?method=courseInfo&id=${list[1].id}&path=select">${list[1].name}</html:link></td>
					<td align="center" class="td1">${list[1].teacherName}</td>
					<td valign="middle" class="td1">${list[1].credit }</td>
					<td valign="middle" class="td1">${list[1].schooltime}</td>
					<td valign="middle" class="td1">${list[1].addr}</td>
				</tr> 
			</logic:iterate>
			<tr>
				<td height="12" colspan="6"></td>
			</tr>
			<tr>
				<td height="30" colspan="6" align="center">
					${list[0]==null?"当前没有课程可供选择":"
					<input type='submit' value='选择新课程'/>"}
			    </td>
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
