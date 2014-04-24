<%@ page language="java" pageEncoding="gb2312"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<script language="javascript">
	function openHref(main,child){					
		parent.topMenuFrame.location.href=main;
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
					<li <c:if test="${param.action=='sp'}"> id="current" </c:if>>
						<a href="lCode.htm?name=sp" target="mainFrame"
						onClick="openHref('SysMain.jsp?action=sp')"><span>专业代码维护</span>
						</a>
					</li>
					<li <c:if test="${param.action=='gb'}"> id="current" </c:if>>
						<a href="lCode.htm?name=gr" target="mainFrame"
						onClick="openHref('SysMain.jsp?action=gb')"><span>年级代码维护</span>
						</a>
					</li>
					<li <c:if test="${param.action=='cb'}"> id="current" </c:if>>
						<a href="lCode.htm?name=cl" target="mainFrame"
						onClick="openHref('SysMain.jsp?action=cb')"><span>班级代码维护</span>
						</a>
					</li>
					<li <c:if test="${param.action=='sb'}"> id="current" </c:if>>
						<a href="lCode.htm?name=sb" target="mainFrame"
						onClick="openHref('SysMain.jsp?action=sb')"><span>学科代码维护</span>
						</a>
					</li>
				</c:if>
				<c:if test="${sessionScope.loginUser==null}">
					<li>
						<a href="Content.jsp" target="mainFrame"><span>您未登录或连线超时，请登录系统。</span>
						</a>
					</li>
				</c:if>
			</ul>
		</div>
	</body>
</html>
