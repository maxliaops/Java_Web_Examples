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
		if(confirm("是否删除" + name + "学科的信息？")){
			window.location.href ='/school/delCode.htm?code=' + id + '&&name=sb';
		}
	}
	function check(){
		if(document.form1.code.value==''||isNaN(document.form1.code.value)){
			alert("学科代码不能为空，请进行输入!!!");
			document.form1.code.focus();
			return false;
		}
		if(document.form1.subject.value==''){
			alert("学科名称不允许为空，请进行输入!!!");
			document.form1.subject.focus();
			return false;
		}
	}
</script>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">

<title>学生年级代码设置</title>
</head>
<body onload="document.form1.code.focus();">   
<table width="90%" border="0" cellpadding="0" cellspacing="0">
			<tr>
				<td height="40" align="center">
					<div align="center">
						<p>
							
						</p>
					</div>
				</td>
			</tr>
		</table>
<form method="POST" action="/school/sysformcode.htm?objname=SystemCourseCode" name="form1" onsubmit="return check()">
      <table width="299" border="1" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td width="94" height="33"><div align="center">学科代码</div></td>
          <td width="90"><div align="center">
              <input name="code" type="text" size="26">
          </div></td>
        </tr>
        <tr>
          <td height="35"><div align="center">学科名称</div></td>
          <td><input name="subject" type="text" size="26"></td>
        </tr>
        <tr>
			<td colspan="2">
              <div align="right">
                <input type="reset" name="reset" value="重置" onclick="document.form1.code.focus();">
                <input type="submit" name="Submit" value="提交">
        </div>        </tr>
      </table>
</form>	
	<div align="center"> <font color="BLUE" >------------------学科信息维护-------------------</font></div>
	<br >
	<table width="299" border="1" align="center" ellpadding="0" cellspacing="0" bordercolor="#ffffff" bordercolorlight="#CCCCCC" bordercolordark="#ffffff">
			<tr align="center">
			  <td>学科代码</td>
			  <td>学科名称</td>	
			  <td colspan="2">用户操作</td>
			</tr>
			<c:forEach  items="${listObject}" var="sp" >
				<tr>
					<td height="20" align="center">
						${sp.code}
				    </td>
					<td height="20" align="center">						
							${sp.subject}						
					</td>
					<td width="52" height="18" align="center" class="button_03">
					  <a class="hand" onclick="form1.code.value='${sp.code}';form1.subject.value='${sp.subject}';document.form1.subject.focus();">修改</a>
					</td>
				   <td height="18" align="center" class="button_03">
				    <a class="hand" onclick="window.location.href('delCode.htm?code=${sp.code}&&name=sb')">删除</a>
				   </td>																
				</tr>
			</c:forEach>
        </table>
	<p align="center"><font color="red" size="4">${msgError}</font></p> 
</body>
</html>
