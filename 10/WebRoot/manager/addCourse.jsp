<%@ page language="java" pageEncoding="GBK"%>

<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html:html lang="true">
<head>
	<link rel="stylesheet" type="text/css" href="images/css.css">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312"></head>

<body>
	<table width="90%" align="center" cellspacing="0">
		<tr>
			<td height="20" colspan="4">&nbsp;</td>
		</tr>
		<tr>
			<td width="25" valign="middle">&nbsp;<img src="images/jiantou.jpg" width="15" height="17" /></td>
		    <td colspan="3" valign="middle"><span class="STYLE1">当前位置：</span>课程管理->添加新课程</td>
		</tr>
		<tr>
			<td height="20" colspan="4">&nbsp;</td>
		</tr>
		<tr>
			<td height="20">&nbsp;</td>
			<td width="65" height="20">&nbsp;</td>
			<td width="663" height="20">
	<html:form action="/course.do?method=insert">
		<table cellspacing="1" bgcolor="#c2d3b0">
			<tr>
				<td width="78" bgcolor="#FFFFFF" class="td0">选择专业：</td>
				<td width="355" bgcolor="#FFFFFF">&nbsp;
					<html:select property="specialtyId">
						<logic:iterate id="list" name="list">
							<html:option value="${list.id}">${list.enterYear}届${list.langthYear}年制${list.name}专业</html:option>	
						</logic:iterate>
					</html:select>
			  </td>
				<td width="137" bgcolor="#FFFFFF" class="STYLE2">&nbsp;请选择专业</td>
			</tr>
			<tr>
				<td bgcolor="#FFFFFF" class="td0">课程名称：</td>
				<td bgcolor="#FFFFFF">&nbsp;&nbsp;<html:text property="name" size="30" maxlength="30"/></td>
				<td bgcolor="#FFFFFF" class="STYLE2">&nbsp;输入课程名称</td>
			</tr>
			<tr>
				<td bgcolor="#FFFFFF" class="td0">上课时间：</td>
				<td bgcolor="#FFFFFF">&nbsp;&nbsp;<html:text property="schooltime"/></td>
				<td bgcolor="#FFFFFF" class="STYLE2">&nbsp;输入上课时间</td>
			</tr>
			<tr>
				<td bgcolor="#FFFFFF" class="td0">上课地点：</td>
				<td bgcolor="#FFFFFF">&nbsp;&nbsp;<html:text property="addr" size="30" maxlength="30"/></td>
				<td bgcolor="#FFFFFF" class="STYLE2">&nbsp;输入上课地点</td>
			</tr>
			<tr>
				<td bgcolor="#FFFFFF" class="td0">课程学分：</td>
				<td bgcolor="#FFFFFF">&nbsp;&nbsp;<html:text property="credit"/></td>
				<td bgcolor="#FFFFFF" class="STYLE2">&nbsp;输入课程学分</td>
			</tr>
			<tr>
				<td bgcolor="#FFFFFF" class="td0">课程介绍：</td>
				<td bgcolor="#FFFFFF">&nbsp;&nbsp;<html:textarea property="courseInfo" rows="3" cols="50"></html:textarea></td>
				<td bgcolor="#FFFFFF" class="STYLE2">&nbsp;输入课程介绍</td>
			</tr>
			<tr>
				<td bgcolor="#FFFFFF" class="td0">授课教师：</td>
				<td bgcolor="#FFFFFF">&nbsp;&nbsp;<html:text property="teacherName"/></td>
				<td bgcolor="#FFFFFF" class="STYLE2">&nbsp;输入讲教师姓名</td>
			</tr>
			<tr>
				<td bgcolor="#FFFFFF" class="td0">教师介绍：</td>
				<td bgcolor="#FFFFFF">&nbsp;&nbsp;<html:textarea property="teacherInfo" rows="3" cols="50"></html:textarea></td>
				<td bgcolor="#FFFFFF" class="STYLE2">&nbsp;输入授课教师简介</td>
			</tr> 
			<tr>
				<td height="24" colspan="3" align="center" bgcolor="#FFFFFF">
					<html:submit value="确定"/>&nbsp;&nbsp;&nbsp;&nbsp;<html:reset value="重置"/>
			  </td>
			</tr>
	  </table>
	</html:form>
		  </td>
			<td width="192" height="20">&nbsp;</td>
		</tr>
	</table>
	<br>

</body>
</html:html>
