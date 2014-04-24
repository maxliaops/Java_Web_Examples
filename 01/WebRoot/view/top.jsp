<%@ page language="java" contentType="text/html; charset=GBK"%>
<%@ taglib prefix="s2" uri="/struts-tags" %>

<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=gbk">
  <title>页眉</title>
</head>
<body>
    <center>
        <table border="0" width="100%" cellspacing="0" cellpadding="0">
            <!-- 顶部菜单 -->
            <tr height="20">
                <td style="text-indent:10" valign="bottom">
                    <a href="info_Add.action?addType=linkTo" style="color:gray">[发布信息]</a>
                    <a href="log_isLogin.action" style="color:gray">[进入后台]</a>
                </td>
                <td align="right" valign="bottom">
                    <a href="#"  style="color:gray" onclick="this.style.behavior='url(#default#homepage)';this.setHomePage('http://localhost:8080/CityInfo');">设为主页 -</a>
                    <a href="javascript:window.external.AddFavorite('http://localhost:8080/CityInfo','都市供求信息网')" style="color:gray">收藏本页 -</a>
                    <a href="mailto:123@***.com.cn" style="color:gray">联系我们</a>
                    &nbsp;
                </td>
            </tr>
            <!-- 导航菜单 -->
            <tr height="56">
                <td align="center" width="220" background="images/logo.gif"></td>
                <td align="right" background="images/menu.gif">
                    <s2:set name="types" value="#session.typeMap"/>
                    <s2:if test="#types==null||#types.size()==0">没有信息类别可显示！</s2:if>
                    <s2:else>
                        <table border="0" width="600">
                            <tr align="center">
                                <td width="100"><a href="goindex.action" style="color:white">首&nbsp;&nbsp;&nbsp;&nbsp;页</a></font></td>
                                <s2:iterator status="typesStatus" value="types">
                                    <td width="100"><a href="info_ListShow.action?infoType=<s2:property value='key'/>" style="color:white"><s2:property value="value"/></a></td>
                                    <s2:if test="#typesStatus.index==4"></tr><tr align="center"></s2:if>
                                </s2:iterator>
                            </tr>                      
                        </table>
                    </s2:else>
                </td>
            </tr>
        </table>
        <table border="0" width="100%" height="90" cellspacing="0" cellpadding="0" style="margin-top:1">
            <tr><td align="center"><img src="images/pcard1.jpg"></td></tr>
        </table>
    </center>
</body>
</html>