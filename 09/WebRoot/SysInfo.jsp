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
                                <!-- CSS Tabs -->
<li <c:if test="${param.action=='copyright'}"> id="current" </c:if>>
<a href="copyright.htm" target="mainFrame" 
onClick="openHref('SysInfo.jsp?action=copyright')">
<span>版权声明</span></a></li>

<li <c:if test="${param.action=='technic'}"> id="current" </c:if>>
<a href="technic.htm" target="mainFrame"
onClick="openHref('SysInfo.jsp?action=technic')">
<span>技术支持</span></a></li>
                        </ul>
                </div>
        </body>
</html>