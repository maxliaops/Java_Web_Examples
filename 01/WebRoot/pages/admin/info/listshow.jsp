<%@ page language="java" contentType="text/html; charset=gb2312"%>
<%@ taglib prefix="s2" uri="/struts-tags" %>

<html>
<head>
    <title>后台-查看信息列表</title>
    <script type="text/javascript" src="<s2:url value='js/DeleteCheck.js'/>"></script>
</head>
<body>
    <center>
        <table border="0" width="650" cellspacing="0"  cellpadding="0">
            <s2:set name="listshow" value="#request.adminlistshow"/>
            <s2:if test="#listshow==null||#listshow.size()==0">
                <tr height="1"><td></td></tr>
                <tr height="200" bgcolor="#F9F9F9"><td colspan="8" align="center" style="border:1 solid"><font color="red"><b>★★对不起，未找到符合条件的信息！★★</b></font></td></tr>
            </s2:if>
            <s2:else>
                <tr height="30">
                    <td style="text-indent:8">审核[<s2:property value="#session.typeMap[#listshow[0].infoType]"/>]</td>
                    <td><s2:fielderror/>&nbsp;</td>
                </tr>
                <tr>
                    <td colspan="2" align="center" style="border:1 solid">
                        <table border="0" width="100%" cellspacing="0" cellpadding="0">
                            <tr align="center" height="30" bgcolor="#F0F0F0">
                                <td width="7%"><b>序号</b></td>
                                <td width="8%"><b>信息ID</b></td>
                                <td width="35%"><b>信息标题</b></td>
                                <td width="20%"><b>发布时间</b></td>
                                <td width="8%"><b>付费</b></td>
                                <td width="8%"><b>审核</b></td>
                                <td width="14%" colspan="2"><b>操作</b></td>
                            </tr>
                            <s2:iterator status="status" value="listshow">
                                <s2:if test="#status.odd">
                                    <tr height="30"></s2:if>
                                <s2:else>
                                    <tr height="30" bgcolor="#F9F9F9"></s2:else>
                                        <td align="center"><b><s2:property value="#status.index+1"/></b></td>
                                        <td style="text-indent:10"><s2:property value="id"/></td>
                                        <td style="text-indent:5"><a href="admin_CheckShow.action?checkID=<s2:property value='id'/>"><s2:property value="getSubInfoTitle(17)"/></a></td>
                                        <td align="center"><s2:property value="infoDate"/></td>
                                        <td align="center"><s2:if test="infoPayfor==1">是</s2:if><s2:else>否</s2:else></td>
                                        <td align="center"><s2:if test="infoState==1"><font color="red">是</font></s2:if><s2:else><b><font color="blue">否</font></b></s2:else></td>
                                        <td align="center"><a href="admin_CheckShow.action?checkID=<s2:property value='id'/>">√审核</a></td>
                                        <td align="center"><a href="admin_Delete.action?deleteID=<s2:property value='id'/>" onclick="return really()">×删除</a></td>
                                    </tr>
                            </s2:iterator>
                        </table>
                    </td>
                </tr>
                <tr height="8"><td></td></tr>
                <tr><td align="center" colspan="2"><jsp:include page="/pages/page.jsp"/></td></tr>
            </s2:else>
        </table>
    </center>
</body>
</html>