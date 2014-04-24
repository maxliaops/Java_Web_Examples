<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<c:if test="${sessionScope.loginUser==null}">
	<script language="javascript">
		alert("您未登录或连线超时，请登录系统");
		window.location.href="Content.jsp";		
	</script>  
</c:if>
<link href="css/style.css" rel="stylesheet">
<script language="javascript">
	function deal(id,name){
		if(confirm("是否删除班级名称为" + name + "的信息？")){
			window.location.href ='/school/delCode.htm?code=' + id + '&&name=cl';
		}
	}
	function check(){		
		if(document.form1.selectsp.value==''){
			alert('请选择专业名称！！！');
			document.form1.selectsp.focus();
			return false;			
		}
		if(document.form1.selectgr.value==''){
			alert('请选择年级名称！！！');
			document.form1.selectsp.focus();
			return false;			
		}
		if(document.form1.classname.value==''){
			alert('班级名称不允许为空，请输入！！！');
			document.form1.classname.focus();
			return false;			
		}
	}
</script>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">

</head>

<body>   
<table width="90%" border="0" align="center" cellpadding="0" cellspacing="0">
			<tr>
				<td height="40" align="center">
					<div align="center">
						<p>
							
						</p>
					</div>
				</td>
			</tr>
		</table>	
	<form method="POST" action="/school/sysformclass.htm" name="form1" onsubmit="return check();">
		<INPUT type="hidden" name="hiddspcode"/>
		<INPUT type="hidden" name="hiddgrcode"/>
        <table width="427" border="1" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td height="33"><div align="center">专业名称</div></td>
          <td>            
            <select name="selectsp" onchange="document.form1.hiddspcode.value=this.value">
            <OPTION>请选择专业名称</OPTION>
            	<c:forEach var="spl" items="${messages['spec']}">
                	<option value="${spl.spCode}">${spl.name}</option>                	
                </c:forEach> 
            </select>
          </td>       
          <td width="53" height="33"><div align="center">年级名称</div></td>		  
          <td width="138">
            <select name="selectgr" onchange="document.form1.hiddgrcode.value=this.value">
            	<OPTION>请选择年级名称</OPTION>
                <c:forEach var="grl" items="${messages['grade']}">
                	<option value="${grl.grCode}">${grl.grName}</option>                	
                </c:forEach> 
            </select>
          </td>
       <tr>
         <td width="64" height="26"><div align="center">班级名称</div></td>
          <td width="144"><div align="left">
            <input name="classname" type="text">
         </div></td>
       
			<td colspan="2">
              <div align="right">
              <input type="reset" name="reset" value="重置">
              <input type="submit" name="Submit" value="提交">
              </div></td>
        </tr>
      </table>
	</form>	
	<div align="center"> <font color="BLUE" >------------------班级信息维护-------------------</font></div>
	<br >
	<table width="431" border="1" align="center" ellpadding="0" cellspacing="0" bordercolor="#ffffff" bordercolorlight="#CCCCCC" bordercolordark="#ffffff">
			<tr>
			  <td width="75"><div align="center">班级代码</div></td>
			  <td width="62"><p align="center">班级名称</p>
		      </td>
			  <td width="78" height="31"><div align="center">年级名称</div></td>
				<td width="90"><div align="center">专业名称</div></td>	
				<td width="104"><div align="center">用户操作</div></td>
			</tr>
			<c:forEach  items="${messages['classinfo']}" var="cs" >
				<tr>
				  <td align="center">${cs.classid}</td>
				  <td align="center">${cs.classmc}</td>
	  			 <td height="20" align="center">${cs.spname}</td>
    				<td height="20" align="center">${cs.grname}</td>					
					<td height="18" align="center" class="button_03">		  
		               <a class="hand" onclick="window.location.href('delCode.htm?code=${cs.classid}&&name=cl')">删除</a>	                   
	                </td>												
				</tr>
			</c:forEach>		
   </table>
   <p align="center"><font color="red" size="4">${messages['msgError']}</font></p> 	
</body>
</html>
