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
  		<form action="listStuRegSerach.htm" name="form1" method="post">
			<br>
  		    <div align="center">
				<tr>
					<td width="154">查询字段:					
					  <select name="select1">					  
					    <option value="stuId">学生编号</option>
					    <option value="djrq">入学日期</option>
					    <option value="lqfs">录取分数</option>
				      </select>
				      </td>
				      <td width="154">运算符:					
					  <select name="select2">					  
					    <option value="DY">大于</option>
					    <option value="XY">小于</option>
					    <option value="DEY">等于</option>
					    <option value="LIKE">相似</option>
				      </select>
				      </td>
					  <td width="190"><input type="text" width="185" name="strvalue" value="" /></td>
					  <td width="113"><input type="submit" name="query" value="查询"></td>
				</tr>
			</div>
	
		</form>   
		<table width="600" border="1" align="center" cellpadding="0" cellspacing="0">	
			<tr>
	     		<c:forEach var="name" items="${tname}">				
					<td height="28" align="center">
						<div align="center">
						    <c:out value="${name}" />
						</div>
				    </td>
    			</c:forEach>
			</tr>
		</table>
</body>
  
</html>
