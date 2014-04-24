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
<li <c:if test="${param.action=='oh'}"> id="current" </c:if>>
<a href="addUser.htm" target="mainFrame"
onClick="openHref('UserManager.jsp?action=oh')"><span>用户添加</span></a></li>
<li <c:if test="${param.action=='us'}"> id="current" </c:if>>
<a href="userSearch.htm" target="mainFrame"
onClick="openHref('UserManager.jsp?action=us')"><span>用户查询</span></a></li>
						</c:if>
						<c:if test="${sessionScope.loginUser==null}">
                        	<li><a href="Content.jsp" target="mainFrame"><span>您未登录或连线超时，请登录系统。</span></a></li>
                        </c:if>
                        </ul>
                </div>
        </body>
</html>