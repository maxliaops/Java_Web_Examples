<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<c:if test="${sessionScope.loginUser==null}">
	<script language="javascript">
		alert("您未登录或连线超时，请登录系统");
		window.location.href="Content.jsp";		
	</script>  
</c:if>

<script src="js/checkform.js"></script>  
  <link href="css/style.css" rel="stylesheet">	
	<body>
	<tr>
			 <td height="44" colspan="6">
				&nbsp;
			 </td>
		   </tr>
		<form method="POST" action="stuInfoInsert.htm?ctname=dsi" name="myform" onSubmit="return stuinfovalid(myform)">
			<p align="center">
    <p>&nbsp;</p>		
<table width="600" height="266" border="0" align="center" cellpadding="0" cellspacing="0">
				<tr>
				<td>
				 <font color="red">学生班级</font>				 </td>
				 <td>
				 <select name="select" onChange="window.location.href='createStuid.htm?id='+this.value ">
			        <option>请选择班级</option>
			        <c:forEach var="cs" items="${messages['classinfo']}">
			        	<option value="${cs.classid}" ${cs.classid eq messages.classid?'selected':'' }>${cs.classmc}</option>
			        </c:forEach>
	               </select>				
	             </td>
				</tr>
				<tr>
				
					<td width="94">学生编号</td>
					<td width="188">
						<input type="text" name="stuId" value="${messages['newstuid']}" width="188" readonly="readonly">					</td>
					<td width="96">学生姓名</td>
					<td width="196">
						<input type="text" name="name"width="188">					</td>
				</tr>
				<tr>
					<td>学生性别</td>
					<td>
					<input name="sex" type="radio" value="男" checked="yes">男
					
					 <input name="sex" type="radio" value="女">女					</td>
					<td>学生年龄</td>
					<td>
						<input type="text" name="age"width="188">					</td>
				</tr>
				<tr>
					<td>身份证号</td>
					<td>
						<input type="text" name="sfzhm"width="188">					</td>
					<td>出生日期</td>
					<td>
						<input type="text" name="csrq"width="188">					</td>
				</tr>
				<tr>
					<td>家庭地址</td>
					<td>
						<input type="text" name="jtdz"width="188">					</td>
					<td>家庭电话</td>
					<td>
						<input type="text" name="jtdh"width="188">					</td>
				</tr>
				<tr>
				<td colspan="3">政治面貌
                  <select name="zzmm">
                    <option value="党员">党员</option>
                    <option value="团员">团员</option>
                  </select>
                
                   健康状况		  
                   <select name="jkzk">
                    <option value="优">优</option>
                    <option value="良">良</option>
                  </select></td>
				   <td> 				     
		             <div align="left">
		               <input type="submit" name="save" value="提交" >		               
		               &nbsp;&nbsp;&nbsp;
		               <input type="reset" name="add" value="重置" >
                     </div>
                   </td>
				</tr>
		  </table>
		</form>
		 <div align="center"><font color="red" size="4">${messages['msg']}</font></div>
		 
	</body>
</html>
