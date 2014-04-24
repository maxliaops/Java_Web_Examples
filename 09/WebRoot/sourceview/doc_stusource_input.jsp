<%@ page language="java" import="java.util.*" pageEncoding="GB2312"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<c:if test="${sessionScope.loginUser==null}">
	<script language="javascript">
		alert("您未登录或连线超时，请登录系统");
		window.location.href="Content.jsp";		
	</script>  
</c:if>
<html>
<script type="text/javascript" src="js/checkform.js"></script>

<link href="css/style.css" rel="stylesheet">
	<body onLoad="myform.stuId.focus();">
	     <tr>
			<td height="44" colspan="6">
				&nbsp;
			</td>
		</tr>
		<form name="myform" method="post" action="CjReg.htm" onsubmit="return stusourcevalid(myform)">
			<table width="59%" height="99" border="0" align="center">				
				<tr>
				  <td width="17%">学生编号</td>
				  <td >
				   <input type="text" name="stuId" onchange="window.location.href='regCjInfo.htm?stuId='+this.value" 
							value="${stuInfo.stuId }">
				 </td>
				  <td width="14%">学生姓名</td>
				  <td>
				   <input type="text" name="stuName" value="${stuInfo.name}">
				 </td>
			  </tr>
				 <tr>
				<td width="17%">考试类别</td>
				<td width="33%">
				   <input type="text" name="examType" value="">					
				 </td>
				<td width="14%">考试日期</td>
				<td width="36%">
					<input type="text" name="examDate" value="">
				</td>
				</tr>
				<tr>
				   <td><div align="center">操作员</div></td>
			      <td width="33%">
				    <input type="text" name="czy" value="${sessionScope.loginUser.name}" readonly="readonly">
				  </td>
				  <td>&nbsp;</td>
				   <td>						
				     <div align="left">
				       <input type="submit" name="Submit" value="提交" >&nbsp;
				       <input type="reset" name="Submit2" value="重置">
		             </div>
		           </td>
				</tr>
		  </table>
			
			<table width="59%" border="1" align="center" cellpadding="0" cellspacing="0">
				
				<tr>
				  <td width="52%" height="35"><div align="center">考试科目</div></td>									
					<td width="48%"><div align="center">考试成绩</div></td>	
							
				</tr>	
				<hr size="2"/>
				<c:forEach var="list" items="${list}">
					<tr>
						<td><div align="center" width='40'>${list.subject} </div></td>
						<td>
							<div align="center">
							  <label>
							  <input type="hidden" name="code${list.code}" value="${list.code}"/>
							  <input type="text" name="grade${list.code}" size="40" value="0.00"/>
							  </label>
							</div>	
                        </td>
					</tr>
				</c:forEach>			
			</table>
		</form>
		<center><font color="red" size="4">${message}</font></center>
	</body>
</html>
