<%@ page language="java" contentType="text/html; charset=gb2312"%>
<%@ taglib prefix="s2" uri="/struts-tags" %>

<html>
<head><title>查看信息列表</title></head>
<body>
    <center>        
        <!-- 列表显示付费信息 -->
        <s2:set name="onepayforlist" value="#request.onepayforlist"/>        
        <table border="0" width="670" cellspacing="0" cellpadding="0" style="margin-top:5">
            <s2:if test="#onepayforlist==null||#onepayforlist.size()==0">
                <tr height="30"><td align="center">★★★ 缴费后，您发布信息就可在这里显示！★★★</td></tr>
            </s2:if>
            <s2:else>
                <tr height="30"><td style="text-indent:5" valign="bottom"><font color="#004790"><b>■推荐<s2:property value="#session.typeMap[#onepayforlist[0].infoType]"/></b>『缴费专区』</font></td></tr>
                <s2:iterator status="onepayforStatus" value="onepayforlist">
                     <s2:if test="#onepayforStatus.odd">
                         <tr><td align="center" style="border:1 solid" bgcolor="#F0F0F0">
                     </s2:if>
                     <s2:else>
                         <tr><td align="center" style="border:1 solid" bgcolor="white">
                     </s2:else>
                             <table border="0" width="655" cellpadding="3" style="word-break:break-all">
                                 <tr height="30">
                                     <td colspan="2">【<s2:property value="#session.typeMap[infoType]"/>】</td>
                                     <td align="right">发布时间：『<s2:property value="infoDate"/>』&nbsp;</td>
                                 </tr>
                                 <tr height="80"><td colspan="3"><s2:property value="infoContent"/></td></tr>
                                 <tr height="30" align="center">
                                     <td>联系电话：<s2:property value="infoPhone"/></td>
                                     <td>联 系 人：<s2:property value="infoLinkman"/></td>
                                     <td>E-mail：<s2:property value="infoEmail"/></td>
                                 </tr>                                 
                             </table>
                         </td>
                     </tr>
                     <tr height="1"><td></td></tr>
                </s2:iterator>
            </s2:else>
        </table>
        <!-- 列表显示免费信息 -->
        <s2:set name="onefreelist" value="#request.onefreelist"/>
        <table border="0" width="670" cellspacing="0" cellpadding="0" style="margin-top:5" rules="rows">
            <s2:if test="#onefreelist==null||#onefreelist.size()==0">
                <tr height="30"><td align="center">★★★ 在这里显示免费发布的信息！★★★</td></tr>
            </s2:if>
            <s2:else>
                <tr height="30"><td style="text-indent:5" valign="bottom"><font color="#004790"><b>■最新<s2:property value="#session.typeMap[#onefreelist[0].infoType]"/></b>『免费专区』</font></td></tr>
                <s2:iterator status="onefreeStatus" value="onefreelist">
                     <s2:if test="#onefreeStatus.odd">
                         <tr><td align="center" style="border:1 solid" bgcolor="#F0F0F0">
                     </s2:if>
                     <s2:else>
                         <tr><td align="center" style="border:1 solid" bgcolor="white">
                     </s2:else>
                             <table border="0" width="655" cellpadding="3" style="word-break:break-all">
                                 <tr height="30">
                                     <td colspan="2">【<s2:property value="#session.typeMap[infoType]"/>】</td>
                                     <td align="right">发布时间：『<s2:property value="infoDate"/>』&nbsp;</td>
                                 </tr>
                                 <tr height="80"><td colspan="3"><s2:property value="infoContent"/></td></tr>
                                 <tr height="30" align="center">
                                     <td>联系电话：<s2:property value="infoPhone"/></td>
                                     <td>联系人：<s2:property value="infoLinkman"/></td>
                                     <td>E-mail：<s2:property value="infoEmail"/></td>
                                 </tr>
                             </table>
                         </td>
                     </tr>
                     <tr height="1"><td></td></tr>
                </s2:iterator>
                <tr height="30"><td align="center"><jsp:include page="/pages/page.jsp"/></td></tr>                
            </s2:else>
        </table>
        <br>
    </center>
</body>
</html>