<%@ page language="java" pageEncoding="GBK"%>

<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html:html lang="true">
  <head>
	<link rel="stylesheet" type="text/css" href="../images/css.css">
    <style type="text/css">
<!--
.STYLE5 {font-size: 9pt}
-->
    </style>
  </head>
  
  <body>
  	  	<table width="955px" align="center" cellspacing="0">
		<tr>
			<td height="20" colspan="4">&nbsp;</td>
		</tr>
		<tr>
			<td width="25" valign="middle">&nbsp;<img src="../images/jiantou.jpg" width="15" height="17" /></td>
		    <td colspan="3" valign="middle"><span class="STYLE1">当前位置：</span>专业管理-&gt;添加新专业</td>
		</tr>
		<tr>
			<td height="20" colspan="4">&nbsp;</td>
		</tr>
		<tr>
			<td>&nbsp;			</td>
		    <td width="61">&nbsp;</td>
		    <td width="605" align="left">
				<html:form action="/specialty.do?method=insert">
					<table border="0" align="center" cellpadding="0" cellspacing="1"
						bgcolor="#c2d3b0">
						<tr>
							<td width="20%" height="24" bgcolor="#FFFFFF" class="td0">
								&nbsp;入学年份：&nbsp;
							</td>
							<td width="43%" bgcolor="#FFFFFF">
								&nbsp;
								<html:select property="enterYear">
									<html:option value="2005">2005届</html:option>
									<html:option value="2006">2006届</html:option>
									<html:option value="2007">2007届</html:option>
									<html:option value="2008">2008届</html:option>
									<html:option value="2009">2009届</html:option>
									<html:option value="2010">2010届</html:option>
								</html:select>
							</td>
							<td width="37%" bgcolor="#FFFFFF" class="STYLE2">
								&nbsp;请选择新专业的入学年份&nbsp;
							</td>
						</tr>
						<tr>
							<td height="24" bgcolor="#FFFFFF" class="td0">
								&nbsp;专业名称：&nbsp;
							</td>
							<td bgcolor="#FFFFFF">
								&nbsp;
								<html:text property="name" />
							</td>
							<td bgcolor="#FFFFFF" class="STYLE2">
								&nbsp;请输入新专业名称&nbsp;
							</td>
						</tr>
						<tr>
							<td height="24" bgcolor="#FFFFFF" class="td0">
								&nbsp;学制：&nbsp;
							</td>
							<td bgcolor="#FFFFFF">
								&nbsp;
								<html:select property="langthYear">
									<html:option value="2">2年</html:option>
									<html:option value="3">3年</html:option>
									<html:option value="4">4年</html:option>
									<html:option value="5">5年</html:option>
								</html:select>
							</td>
							<td bgcolor="#FFFFFF" class="STYLE2">
								&nbsp;请选择新专业的学制&nbsp;
							</td>
						</tr>
						<tr>
							<td height="24" colspan="3" align="center" bgcolor="#FFFFFF">
								<html:submit value="确定" />
							</td>
						</tr>
					</table>
				</html:form>
			</td>
		    <td width="124">&nbsp;</td>
		</tr>
  </table>
  </body>
</html:html>
