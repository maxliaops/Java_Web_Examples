<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:if test="${sessionScope.loginUser==null}">
	<script language="javascript">
		alert("您未登录或连线超时，请登录系统");
		window.location.href="Content.jsp";		
	</script>  
</c:if>
<script language="javascript">
	function deal(){
		if(confirm("是否进行学生信息数据存盘操作？")){
			form1.submit();	
			//window.history(-1);		
		}
	}
</script>
<html>
<link href="css/style.css" rel="stylesheet">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
	<head>
		<title>学生基本信息登录情况</title>
	</head>
	<body>
	<tr>
			 <td height="44" colspan="6">
				&nbsp;
			 </td>
		   </tr>
		<form method="POST" action="stuInfoInsert.htm?ctname=dsim" name="form1">
		&nbsp;

<table width="600" height="266" border="0" align="center" cellpadding="0" cellspacing="0">
				
				<tr>
				
					<td width="94" ><font color="red">学生编号</font></td>
					<td width="188">
						<input type="text" name="stuId" value="${messages.stuId}" width="188" readonly="readonly"></td>
					<td width="96">学生姓名</td>
					<td width="196">
						<input type="text" name="name"width="188" value="${messages.name}"></td>
				</tr>
				<tr>
					<td>学生性别</td>
					<td>
					
					<input name="sex" type="radio" value="男" <c:if test="${messages.sex=='男' }"> checked="yes"</c:if>>男					
					 <input name="sex" type="radio" value="女" <c:if test="${messages.sex=='女' }"> checked="yes"</c:if>>女</td>
					<td>学生年龄</td>
					<td>
						<input type="text" name="age"width="188" value="${messages.age}"></td>
						
				</tr>
				<tr>
					<td>身份证号</td>
					<td>
						<input type="text" name="sfzhm"width="188" value="${messages.sfzhm}"></td>
					<td>出生日期</td>
					<td>
						<input type="text" name="csrq"width="188" value="${messages.csrq}"></td>
				</tr>
				<tr>
					<td>家庭地址</td>
					<td>
						<input type="text" name="jtdz"width="188" value="${messages.jtdz}">					</td>
					<td>家庭电话</td>
					<td>
						<input type="text" name="jtdh"width="188" value="${messages.jtdh}">					</td>
				</tr>
				<tr>
				<td colspan="3">政治面貌
                  <select name="zzmm">
                    <option value="党员" <c:if test="${messages.zzmm=='党员' }"> selected="yes"</c:if>>党员</option>
                    <option value="团员" <c:if test="${messages.zzmm=='团员' }">selected="yes"</c:if>>团员</option>
                  </select>
                
                   健康状况		  
                   <select name="jkzk">
                    <option value="优" <c:if test="${messages.jkzk=='优' }"> selected="yes"</c:if>>优</option>
                    <option value="良" <c:if test="${messages.jkzk=='良' }"> selected="yes"</c:if>>良</option>
                  </select></td>
				   <td> 				     
		             <div align="center">
		               <input type="reset" name="add" value="重置" />		               	               
		               <input type="button" name="save" value="提交" onClick="form1.submit();"/>
		             
                     </div>                   
                    </td>
				</tr>
		  </table>
		
			
		</form>
		 <div align="center" class="style1" >${msg}</div>