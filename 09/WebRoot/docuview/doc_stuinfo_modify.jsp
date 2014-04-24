<%@ page language="java"  pageEncoding="gb2312"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:if test="${sessionScope.loginUser==null}">
	<script language="javascript">
		alert("您未登录或连线超时，请登录系统");
		window.location.href="Content.jsp";		
	</script>  
</c:if>
<html> 
<link href="css/style.css" rel="stylesheet">  
  <body>
        <tr>
		 <td height="44" colspan="6">
			&nbsp;
		 </td>
		</tr>
  		<form action="listStuModi.htm" name="form1" method="post">
			<br>
  		    <div align="center">
				<tr>
					<td width="154">查询条件:					
					  <select name="select">					  
					    <option value="stuId" ${selectStr=='stuId'?'selected':'' }>学生编号</option>
					    <option value="name" ${selectStr=='name'?'selected':'' }>学生姓名</option>
					    <option value="sfzhm" ${selectStr=='sfzhm'?'selected':'' }>身份证号</option>
				      </select></td>
					  <td width="190"><input type="text" width="185" name="strvalue" value="${conValue }" /></td>
					  <td width="113"><input type="submit" name="query" value="查询"></td>
				</tr>
			</div>
		
		</form>   
		<table width="600" border="1" align="center" cellpadding="0" cellspacing="0">
			<tr>
				<td><div align="center">学生编号</div></td>
				<td><div align="center">学生姓名</div></td>				
			    <td><div align="center">身份证号</div></td>
			    <td><div align="center">出生日期 </div></td>		    
			    <td><div align="center">家庭地址</div></td>
				<td><div align="center">用户选择 </div></td>			   
			</tr>

			<c:forEach var="stuinf" items="${messages}">
				<tr>
					<td height="28" align="center">
						<div align="center">
						    <c:out value="${stuinf.stuId}" />
						</div>
				    </td>
					<td height="28" align="center">
						<div align="center">
							<c:out value="${stuinf.name}" />
						</div>
					</td>
					<td height="28" align="center">
						<div align="center">
							<c:out value="${stuinf.sfzhm}" />
						</div>
					</td>
					<td height="28" align="center">
						<div align="center">
							<c:out value="${stuinf.csrq}" />
						</div>
					</td>				
					<td height="28" align="center">
						<div align="center">
							<c:out value="${stuinf.jtdz}" />
						</div>
					</td>
					<td width="52" height="18" align="center" class="button_03">	
						<a class="hand" onclick="window.location.href('listStuModiSave.htm?id=${stuinf.stuId}')">维护</a>
					</td>					
				</tr>
			</c:forEach>
		</table>
</body>
  
</html>
