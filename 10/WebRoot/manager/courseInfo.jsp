<%@ page language="java" pageEncoding="GBK"%>

<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html:html lang="true">
  <head>
	<link rel="stylesheet" type="text/css" href="images/css.css">
  </head>
  <body>
  	<table width="955px" align="center" cellspacing="0">
		<tr>
			<td height="20" colspan="2">&nbsp;</td>
		</tr>
		<tr>
			<td width="31" valign="middle">&nbsp;<img src="images/jiantou.jpg" width="15" height="17" /></td>
		    <td width="918" valign="middle"><span class="STYLE1">当前位置：</span>课程管理-&gt;课程详细信息</td>
		</tr>
		<tr>
			<td height="20" colspan="2">&nbsp;</td>
		</tr>
		<tr>
			<td colspan="2">
	 		<table width="700" align="center" cellspacing="0">
			<tr>
				<td colspan="6" class="td0">专业信息</td>
			</tr>
    		<tr>
    			<td width="65" class="td1">起始年份：</td>	
				<td width="189" align="left" class="td2">&nbsp;${specialty.enterYear} 年</td>
				<td width="69" class="td1">专业名称：</td>
				<td width="127" align="left" class="td2">&nbsp;${specialty.name}</td>
				<td width="41" class="td1">学制：</td>
				<td width="195" align="left" class="td2">&nbsp;${specialty.langthYear} 年</td>			
			</tr>
			</table>
			</td>
		</tr>
		<tr>
			<td height="20" colspan="2">&nbsp;</td>
		</tr>
		<tr>
			<td align="center" colspan="2">
			<table width="700" align="center" cellspacing="0">
				<tr>
					<td colspan="4" class="td0">课程信息</td>
				</tr>
				<tr>
					<td width="100" class="td1">课程名称：</td>
					<td width="200" class="td2">&nbsp;${course.name}</td>
					<td width="100"  class="td1">课程学分：</td>
					<td class="td2">&nbsp;${course.credit} 分</td>
				</tr>
				<tr>
					<td width="100"  class="td1">上课时间：</td>
					<td width="200" class="td2">&nbsp;${course.schooltime}</td>
					<td width="100"  class="td1">上课地点：</td>
					<td class="td2">&nbsp;${course.addr}</td>
				</tr>
				<tr>
					<td class="td1" width="100">课程介绍：</td>
					<td colspan="3" class="td2">&nbsp;${course.courseInfo}</td>
				</tr>
				<tr>
					<td colspan="4" class="td0">授课教师信息</td>
				</tr>
				<tr>
					<td width="100" class="td1">教师姓名：</td>
					<td colspan="3" class="td2">&nbsp;${course.teacherName}</td>
				</tr>
				<tr>
					<td width="100" class="td1">教师简介：</td>
					<td colspan="3" class="td2">&nbsp;${course.teacherInfo}</td>
				</tr>
    			<tr>
    				<td width="100" class="td1">课程是否可选：</td>
					<td width="200" class="td2">&nbsp;是</td>
			    	<logic:equal name="course"  value="false" property="isFinish">
    					<td colspan="2" class="td1"></td>
    				</logic:equal>
    				<logic:equal name="course"  value="true" property="isFinish">
    					<td width="100" class="td1">设置为不可选：</td>
    					<td width="100" class="td1">
				  			<html:link page="/course.do?method=updateIsFinish&id=${course.id}">设置为不可选</html:link>
				  		</td>
    				</logic:equal>
    			</tr>
    		</table>
	  		</td>
		</tr>
	</table>	
  </body>
</html:html>
