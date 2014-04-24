<%@ page language="java" pageEncoding="gb2312"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<script language="javascript">
	function openHref(main,child){					
		parent.topMenuFrame.location.href=main;
		parent.mainFrame.location.href=child;
	}
</script>
<html xmlns="http://www.w3.org/1999/xhtml">
        <head>
                <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
                <title>Centered Sliding Doors Navigation at exploding-boy.com</title>
                <link href="css/main.css" rel="stylesheet">
        </head>
        <body>
                <div id="navigation">
                        <ul>
                        <c:if test="${sessionScope.loginUser!=null}">
                                <!-- CSS Tabs -->
                              
<li <c:if test="${param.action=='Doc'}"> id="current" </c:if>><a name="Doc"
href="#" onClick="openHref('DocMain.jsp?action=Doc','classinfoList.htm?name=cs2')"><span>学生基本信息</span></a></li>

<li <c:if test="${param.action=='Reg'}"> id="current" </c:if>><a 
href="#" onClick="openHref('DocMain.jsp?action=Reg','studentReg.htm')"><span>学生入校登记</span></a></li>

<li <c:if test="${param.action=='Modi'}"> id="current" </c:if>>
<a href="#" onClick="openHref('DocMain.jsp?action=Modi','listStuModi.htm')"><span>学生信息维护</span></a></li>

<li <c:if test="${param.action=='RegList'}"> id="current" </c:if>>
<a href="#" onClick="openHref('DocMain.jsp?action=RegList','studentRegList.htm')"><span>学生登记查询</span></a></li>

<li <c:if test="${param.action=='regTea'}"> id="current" </c:if>>
<a href="#" onClick="openHref('DocMain.jsp?action=regTea','regTeacherInfo.htm')"><span>教师基本信息</span></a></li>

<li <c:if test="${param.action=='serviceTea'}"> id="current" </c:if>>
<a href="#" onClick="openHref('DocMain.jsp?action=serviceTea','serviceTeacherInfo.htm')"><span>教师信息维护</span></a></li>

						</c:if>
						<c:if test="${sessionScope.loginUser==null}">
                        	<li><a href="Content.jsp" target="mainFrame"><span>您未登录或连线超时，请登录系统。</span></a></li>
                        </c:if>
                        </ul>
                </div>
        </body>
</html>