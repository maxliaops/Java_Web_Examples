<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<%@taglib prefix="s" uri="/struts-tags" %>
<table width="900" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="104" background="images/f_down1.gif">
    <br>
    <table width="289" border="0" align="center" cellpadding="0" cellspacing="0">
      <s:form action="info_f_addInfo">
      <tr>
        <td align="center"> 给我留言(如果没有登录，则显示“匿名”留言) </td>
      </tr>
      <tr>
        <td align="center"><s:textarea name="info_content" cols="40" rows="5"/></td>
      </tr>
      <tr>
        <td height="22" align="center">
        <s:submit value=" 留言 "/>
        <s:hidden name="info_account" value="%{#session.userInfo.account}"/>
        <s:hidden name="info_sign" value="%{'0'}"/>
        <s:if test="%{#session.account!=null}">
        <s:hidden name="info_fromAccount" value="%{#session.account}"/>
        </s:if>
        </td>
      </tr>
      </s:form>
    </table>
    <br>    </td>
  </tr>
</table>
<table width="900" height="80" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr align="center">
    <td><img src="images/f_down2.gif" width="900" height="85"></td>
  </tr>
</table>
