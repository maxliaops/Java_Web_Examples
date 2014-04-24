<%@ page language="java"  pageEncoding="gb2312"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix = "fmt"%>
<c:if test="${sessionScope.loginUser==null}">
	<script language="javascript">
		alert("您未登录或连线超时，请登录系统");
		window.location.href="Content.jsp";		
	</script>  
</c:if>
<html> 
<link href="css/style.css" rel="stylesheet">  
<script src="js/checkform.js"></script>
  <body>
  <tr>
			 <td height="44" colspan="6">
				&nbsp;
			 </td>
		   </tr>
  		<form action="gradeSourceList.htm" name="form1" method="post" onsubmit="return sorucenjtj(form1)">
  			
			<br>
  		    <div align="center">
				<tr>
					<td width="154">年级名称:			
					  <select name="selectmc">		  
					   				
					    <c:forEach var="gr" items="${map['grname']}">					    	
		                	<option value="${gr.grCode}" <c:if test="${gr.grCode == map['oldmc']}"> selected = "yes"</c:if>>${gr.grName}</option>                	
		                </c:forEach> 
				      </select>			      
			      </td>				      
					  <td>考试类别：</td>
					  <input type="text" name="typeexam" value="${map['examType'] }"/>
					  <td>考试日期：</td>
					  <input type="text" name="dateexam" value="${map['examDate'] }"/>
					  <td width="113"><input type="submit" name="query" value="查询"></td>
				</tr>
			</div>
			<br>	
			<center>
			  <strong><font color="#0066CC" size="+1"></font></strong>
			</center>
		</form> 
		<table width="90%" border="1" align="center" cellpadding="0" cellspacing="0">	
			<tr>
	     		<c:forEach var="name" items="${map['tname']}">				
					<td height="28" align="center">
						<div align="center">
						    <c:out value="${name}" />
						</div>
				    </td>
    			</c:forEach>    			
			</tr>
			<c:forEach var = "row" items="${map['cdata']}">	
			 <tr>
			 	<c:forEach var="data" items="${row}" >	
			    <td height="28" align="center">
			    	<div align="center">
			    		<c:out value="${data}"/>
					</div>
			    </td>			    
    		  </c:forEach>			 
			 </tr>   			   		
			</c:forEach>	
		</table>
		<center>${map.message }</center>
	</body>  
</html>
