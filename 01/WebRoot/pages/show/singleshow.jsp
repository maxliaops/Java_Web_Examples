<%@ page language="java" contentType="text/html; charset=gb2312"%>
<%@ taglib prefix="s2" uri="/struts-tags" %>
<%
  String path = request.getContextPath();
  String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
  <title>都市信息网-查看详细内容</title>
  <base href="<%=basePath%>">
  <link type="text/css" rel="stylesheet" href="<s2:url value='css/style.css'/>">
</head>
<body>
    <center>
        <table width="670" border="0" cellspacing="0" cellpadding="0" style="margin-top:5">
            <tr height="30"><td style="text-indent:5" valign="bottom"><font color="#004790"><b>■查看详细信息</b></font></td></tr>            
            <tr height="1"><td></td></tr>
            <tr bgcolor="#FAFCF5">
                <td style="border:1 solid">
                    <table border="0" width="100%" cellspacing="0" cellpadding="2">
                        <s2:if test="infoSingle==null">
                            <tr height="100"><td align="center" colspan="2" style="border:1 solid">★★★ 查看信息详细内容出错！★★★</td></tr>
                        </s2:if>
                        <s2:else>
                            <tr height="40">
                                <td width="20%" style="text-indent:20">信息类别：</td>
                                <td><s2:property value="#session.typeMap[infoSingle.infoType]"/></td>
                            </tr>
                            <tr height="40">
                                <td style="text-indent:20">发布时间：</td>
                                <td><s2:property value="infoSingle.infoDate"/></td>
                            </tr>
                            <tr height="40">
                                <td style="text-indent:20">信息标题：</td>
                                <td><s2:property value="infoSingle.infoTitle"/></td>
                            </tr>
                            <tr height="40"><td colspan="2" style="text-indent:20">信息内容：</td></tr>
                            <tr>
                                <td colspan="2" align="center">
                                    <table border="1" width="630" cellspacing="0" cellpadding="10" rules="none" frame="below" style="word-break:break-all" bordercolor="lightgrey" bordercolorlight="lightgrey" bordercolordark="white">
                                        <tr height="200" bgcolor="white"><td colspan="3" valign="top" style="border:1 solid"><s2:property value="infoSingle.infoContent" escape="false"/></td></tr>
                                        <tr height="20" align="center">
                                            <td>联系电话：<s2:property value="infoSingle.infoPhone"/></td>
                                            <td>联系人：<s2:property value="infoSingle.infoLinkman"/></td>
                                            <td>E-mial：<s2:property value="infoSingle.infoEmail"/></td>
                                        </tr>
                                    </table>                      
                                </td>
                            </tr>
                            <tr height="63"><td align="center" colspan="2"><a href="javascript:window.history.back(-1)">返回</a></td></tr>                              
                        </s2:else>
                    </table>
                </td>
            </tr>
        </table>
        <br>
    </center>
</body>
</html>