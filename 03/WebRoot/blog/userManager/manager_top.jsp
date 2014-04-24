<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<%@ taglib prefix="s" uri="/struts-tags"%>
<link href="css/style.css" type="text/css" rel="stylesheet">
<script src="js/validate.JS" language="javascript" type="text/javascript"></script>
<s:if test="%{#session.account==null}">
   <script language="javascript">alert('该用户未被激活！');history.go(-1);</script>
</s:if>
<table width="800" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="98"><img src="images/b_b_top.gif" width="900" height="96"></td>
  </tr>
</table>

