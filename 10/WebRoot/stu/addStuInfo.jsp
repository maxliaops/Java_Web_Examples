<%@ page language="java" pageEncoding="GBK"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic"%>
<html> 
	<head>
		<title>添写基础信息</title>
		<link rel="stylesheet" type="text/css" href="images/style.css">
<style type="text/css"> 
.STYLE3 {color: #FF0000}
</style>
<script type="text/javascript"> 
			function checkInput(){ 
				if(document.stuUserForm.stuName.value==null||document.stuUserForm.stuName.value==""){
					alert("姓名不能为空！");
					document.stuUserForm.stuName.focus();
					return false;
				}
				if(document.stuUserForm.stuNo.value==null||document.stuUserForm.stuNo.value==""){
					alert("学号不能为空！");
					document.stuUserForm.stuNo.focus();
					return false;
				}
				if(document.stuUserForm.birthday.value==null||document.stuUserForm.birthday.value==""){
					alert("出生日期不能为空！");
					document.stuUserForm.birthday.focus();
					return false;
				}
				if(document.stuUserForm.homeAddr.value==null||document.stuUserForm.homeAddr.value==""){
					alert("家庭住址不能为空！");
					document.stuUserForm.homeAddr.focus();
					return false;  
				}
				if(document.stuUserForm.addr.value==null||document.stuUserForm.addr.value==""){
					alert("现住址不能为空！");
					document.stuUserForm.addr.focus();
					return false; 
				}
				if(document.stuUserForm.tel.value==null||document.stuUserForm.tel.value==""){
					alert("联系电话不能为空！");
					document.stuUserForm.tel.focus();
					return false;
				} 
				return true;
			}
		</script> 
</head>
	<body>
	<table width="845" align="center" cellspacing="0" bgcolor="#f6f9f2">
		<tr>
			<td background="images/topU.gif" height="124"></td>
		</tr>
		<tr>
		  <td>
			<table cellspacing="0" width="600px" align="center">
			<tr>
				<td height="20" colspan="2"></td> 
			</tr> 
			<tr>
				<td width="13" background="images/jiantou.jpg">&nbsp;</td>
				<td width="585"><span class="STYLE2">当前位置：</span>添写学生基本信息</td>
			</tr>
			<tr> 
				<td height="8" colspan="2"></td>
			</tr>

			<tr>
				<td height="3" colspan="2" bgcolor="#b1de69"></td>
			</tr>
			<tr> 
				<td height="40" colspan="2" valign="middle">
				<p class="STYLE3">
					注意：学生身份确认：请认真并如实填写以下信息，下面的信息将用来确认学生身份，<br>
					如果填写虚假信息造成无法正常选课，后果自负！</p></td>
			</tr>  
		</table>
				<html:form action="/stuUser.do?method=insert"  onsubmit="return checkInput()" >
			<table width="500" align="center" cellspacing="1" bgcolor="#c2d3b0">
				<tr>
					<td width="64" height="24" align="right" bgcolor="#f8fcf3">姓名：</td> 
					<td width="313" bgcolor="#F6F9F2">&nbsp;<html:text property="stuName" /> 
						<html:hidden property="id" value="${id}"/>
				  </td>
					<td width="111" bgcolor="#F6F9F2">&nbsp;输入学生姓名</td> 
				</tr>
				<tr>
					<td height="24" align="right" bgcolor="#f8fcf3">学号：</td>
				  <td bgcolor="#F6F9F2">&nbsp;<html:text property="stuNo"/></td>
					<td bgcolor="#F6F9F2">&nbsp;输入学生证号码</td>
				</tr>
				<tr>
					<td height="24" align="right" bgcolor="#f8fcf3">专业：</td>
					<td bgcolor="#F6F9F2">&nbsp;<html:select property="specialtyId"> 
							<logic:iterate id="list" name="list">
								<html:option value="${list.id}">${list.enterYear}届${list.langthYear}年制${list.name}专业</html:option>								</logic:iterate>
						</html:select>
				  </td>
					<td bgcolor="#F6F9F2">&nbsp;选择专业</td>
				</tr>
				<tr>
					<td height="24" align="right" bgcolor="#f8fcf3">性别：</td>
					<td bgcolor="#F6F9F2">&nbsp;<html:radio property="stuSex" value="男">男</html:radio>
						<html:radio property="stuSex" value="女">女</html:radio>
				  <td bgcolor="#F6F9F2">&nbsp;选择性别</td>
				</tr>
				<tr>
					<td height="24" align="right" bgcolor="#f8fcf3">生日：</td>
				  <td bgcolor="#F6F9F2">&nbsp;<html:text property="birthday"/></td>
					<td bgcolor="#F6F9F2">&nbsp;输入出生日期</td>
				</tr> 
				<tr>
					<td height="24" align="right" bgcolor="#f8fcf3">家庭地址：</td>
				  <td bgcolor="#F6F9F2">&nbsp;<html:text property="homeAddr"/></td>
					<td bgcolor="#F6F9F2">&nbsp;输入家庭住址</td>
				</tr>
				<tr>
					<td height="24" align="right" bgcolor="#f8fcf3">现住址：</td>
				  <td bgcolor="#F6F9F2">&nbsp;<html:text property="addr"/></td>
					<td bgcolor="#F6F9F2">&nbsp;输入当前居住地址</td>
				</tr>
				<tr>
					<td height="24" align="right" bgcolor="#f8fcf3">联系电话：</td>
				  <td bgcolor="#F6F9F2">&nbsp;<html:text property="tel"/></td>
					<td bgcolor="#F6F9F2">&nbsp;输入联系电话</td>
				</tr>  
				<tr>
				  <td height="24" colspan="3" align="center" bgcolor="#F6F9F2"><html:submit value="确定"/>&nbsp;&nbsp;&nbsp;&nbsp;
				  <html:reset value="重置"/></td>
				</tr>   
			</table> 
		</html:form> 
		  </td>
		</tr>
		<tr>
			<td background="images/bottomU.gif" height="85"></td>
		</tr>
	</table>
	</body>
</html>

