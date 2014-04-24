<%@ page language="java"  pageEncoding="gb2312"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:if test="${sessionScope.loginUser==null}">
	<script language="javascript">
		alert("您未登录或连线超时，请登录系统");
		window.location.href="Content.jsp";		
	</script>  
</c:if>
<html> 
<script src="js/checkform.js"></script>  
<link href="css/style.css" rel="stylesheet">  
  <body>
  <tr>
		 <td height="44" colspan="6">
			&nbsp;
		 </td>
		</tr>
  		<form action="listStuRegSerach.htm" name="form1" method="post" onsubmit="return checkRegList(form1)">
			&nbsp;
  		    <div align="center">
				<tr>
					<td width="154">查询字段:					
					  <select name="select1">					  
					    <option value="stuId" ${propName=='stuId'?'selected':'' }>学生编号</option>
					    <option value="djrq" ${propName=='djrq'?'selected':'' }>入学日期</option>
					    <option value="lqfs" ${propName=='lqfs'?'selected':'' }>录取分数</option>
				      </select>
				      </td>
				      <td width="154">运算符:					
					  <select name="select2">					  
					    <option value="DY" ${conName=='DY'?'selected':'' }>大于</option>
					    <option value="XY" ${conName=='XY'?'selected':'' }>小于</option>
					    <option value="DEY" ${conName=='DEY'?'selected':'' }>等于</option>
				      </select>
				      </td>
					  <td width="190"><input type="text" width="185" name="strvalue" value="${strValue }" /></td>
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
			    <td><div align="center">入学日期</div></td>
				<td><div align="center">录取分数</div></td>			   
				<td><div align="center">经办人</div></td>			   
			</tr>
			<c:forEach var="stuinf" items="${messages}">
				<tr>
					<td height="28" align="center">
						<div align="center">
						    <c:out value="${stuinf.docuStuInfo.stuId}" />
						</div>
				    </td>
                    <td height="28" align="center">
						<div align="center">
							<c:out value="${stuinf['docuStuInfo'].name}" />
						</div>
					 </td>
					<td height="28" align="center">
						<div align="center"> 
							<c:out value="${stuinf['docuStuInfo'].sfzhm}"/>
						</div>
					</td>
					<td height="28" align="center">
						<div align="center">
							<c:out value="${stuinf['docuStuInfo'].csrq}" />
						</div>
					</td>
					 <td height="28" align="center">
						<div align="center">
						    <c:out value="${stuinf.djrq}" />
						</div>
				     </td>
								
					<td height="28" align="center">
						<div align="center">
							<c:out value="${stuinf.lqfs}" />
						</div>
					</td>						
					<td height="28" align="center">
						<div align="center">
							<c:out value="${stuinf.jbr}" />
						</div>
					</td>			
				</tr>
			</c:forEach>
		</table>
		<p>&nbsp;</p>
		<center><font color="red" size="4">${msg}</font></center>
</body>
  
</html>
