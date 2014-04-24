<%@ page contentType="text/html; charset=GBK" %>
<%@ page import="com.model.*" %>
<%@ page import="com.core.*" %>
<%@ page import="java.util.*" %>
<%if (!Crazyadept.UserIsOK(session,FinalConstants.STATUS_ADMIN)) return;%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<title>add_soft</title>
</head>
<link href="../css/admin.css" rel="stylesheet" type="text/css">
<script src="../js/validate.js"></script>
<body>
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="1" class="tableNew">
  <tr align="center">
    <td colspan="3" class="TableTitle1" >添加新软件</td>
  </tr>
  <form action="up_modify_soft.jsp" method="post" enctype="multipart/form-data" name="forms">
    <tr align="center">
      <td width="23%" bgcolor="#FFFFFF">软件名称</td>
      <td width="37%" align="left" bgcolor="#FFFFFF"> <input name="name" type="text"> </td>
      <td width="40%" rowspan="8" align="center" bgcolor="#FFFFFF"><a onClick="javascript:window.open('up_soft.jsp','Menuhead','location=no,scrollbars=no,menubars=no,toolbars=no,resizable=yes,left=200,top=200,width=400,height=210');"> <img src="../images/ico/select.gif" name="ico"  border="0" width=64 height=64 >
        <input type="hidden" name="iid"  >
      </a></td>
    </tr>
    <tr align="center">
      <td bgcolor="#FFFFFF">软件版本</td>
      <td align="left" bgcolor="#FFFFFF"> <input name="edition" type="text"> </td>
    </tr>
    <tr align="center">
      <td bgcolor="#FFFFFF">软件类别</td>
      <td align="left" bgcolor="#FFFFFF"><select name="sid">
          <%
Collection coll=BasetableFactory.getInstance().ListSsort("");
if(coll==null||coll.size()<=0){
    out.print("<option>无软件类别</option>");
}else{
    Iterator it=coll.iterator();
    while(it.hasNext()){
        Ssort s=(Ssort)it.next();
        out.print("<option value="+s.getSid()+">"+s.getName()+"</option>)");
        }
}%>
      </select></td>
    </tr>
    <tr align="center">
      <td bgcolor="#FFFFFF">正式版本</td>
      <td align="left" bgcolor="#FFFFFF"><input name="regular" type="radio" class="noborder" value="1" >
        是
        <input name="regular" type="radio" class="noborder" value="0" checked>
      否</td>
    </tr>
    <tr align="center">
      <td bgcolor="#FFFFFF">软件价格</td>
      <td align="left" bgcolor="#FFFFFF"><input name="price" type="text"  onBlur="return pricenum()">
      (元)</td>
    </tr>
    <tr align="center">
      <td bgcolor="#FFFFFF">运行环境</td>
      <td align="left" bgcolor="#FFFFFF"><input name="environment" type="text"></td>
    </tr>
    <tr align="center">
      <td bgcolor="#FFFFFF">推荐指数</td>
      <td align="left" bgcolor="#FFFFFF"><select name="commend">
          <option value="1">1</option>
          <option value="2">2</option>
          <option value="3" selected>3</option>
          <option value="4">4</option>
          <option value="5">5</option>
      </select></td>
    </tr>
    <tr align="center">
      <td bgcolor="#FFFFFF">程序大小</td>
      <td align="left" bgcolor="#FFFFFF"><input name="filesize" type="text" onBlur="return filesizes()">
      (MB)</td>
    </tr>
    <tr align="center">
      <td bgcolor="#FFFFFF">上传软件</td>
      <td colspan="2" align="left" bgcolor="#FFFFFF"><input type="file" name="file"> 注意：不能大于50MB</td>
    </tr>
    <tr align="center">
      <td bgcolor="#FFFFFF">软件介绍</td>
      <td colspan="2" align="left" bgcolor="#FFFFFF"><textarea name="introduce" cols="50" rows="5"></textarea></td>
    </tr>
    <tr align="center">
      <td bgcolor="#FFFFFF">其他说明</td>
      <td colspan="2" align="left" bgcolor="#FFFFFF"><textarea name="resume" cols="50" rows="5"></textarea></td>
    </tr>
    <tr align="center">
      <td height="27" colspan="3" bgcolor="#FFFFFF"> <input type="hidden" name="action" value="add">
        <input type="hidden" name="uid" value="<%=(((User)session.getAttribute("user")).getUid())%>">
        <input name="Submit" type="submit" class="btn_grey" onClick="return softs()" value="提交">
&nbsp;&nbsp;
      <input name="Submit2" type="reset" class="btn_grey" value="重置"> </td>
    </tr>
  </form>
</table>
<table width="80%"  border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="50" colspan="5" align="right"><a href="#" onClick="Jscript:history.back()">返回</a></td>
  </tr>
</table>
</body>
</html>
