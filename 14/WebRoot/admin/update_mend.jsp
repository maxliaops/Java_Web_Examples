<%@ page contentType="text/html; charset=GBK" %>
<%@ page import="com.model.Mend" %>
<%@ page import="com.model.Ssort" %>
<%@ page import="com.core.*" %>
<%@ page import="java.util.*" %>
<%if (!Crazyadept.UserIsOK(session,FinalConstants.STATUS_ADMIN)) return;%>
<html>
<head>
<title>update_soft</title>
</head>
<link href="../css/admin.css" rel="stylesheet" type="text/css">
<script src="../js/validate.js"></script>
<body>
<%
int uid=ParamUtils.getIntParameter(request,"mid");
BasetableFactory bf=BasetableFactory.getInstance();
Mend u=bf.SearchMend("WHERE mid="+uid);
session.removeAttribute("error");
if(u==null||u.getMid()==0){
        session.setAttribute("error","查找失败");
        response.sendRedirect("error.jsp");
}else{
%>
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="1" class="tableNew">
  <tr align="center">
    <td colspan="2" class="TableTitle1" >修改工具软件</td>
  </tr>
  <form action="modify_mend.jsp" method="post" name="forms">
    <tr align="center">
      <td width="23%" bgcolor="#FFFFFF">软件名称</td>
      <td align="left" bgcolor="#FFFFFF"><input name="name" type="text" value="<%=u.getName()%>" size="40"></td>
    </tr>
    <tr align="center">
      <td bgcolor="#FFFFFF">软件类别</td>
      <td align="left" bgcolor="#FFFFFF"><select name="sid">
          <%
Collection coll=bf.ListSsort("");
if(coll==null||coll.size()<=0){
    out.print("<option>无软件类别</option>");
}else{
    out.print("<option>—请选择—</option>");
    Iterator it=coll.iterator();
    while(it.hasNext()){
        Ssort s=(Ssort)it.next();
        out.print("<option value='"+s.getSid()+"' "+(s.getSid()==u.getSid()?"selected":"")+">"+s.getName()+"</option>)");
    }
}%>
      </select></td>
    </tr>
    <tr align="center">
      <td bgcolor="#FFFFFF">软件类型</td>
      <td align="left" bgcolor="#FFFFFF"><input name="state" type="radio" class="noborder" value="<%=FinalConstants.STATE_TOOL%>" <%=(u.getState()==FinalConstants.STATE_TOOL?"checked":"")%>>
        工具
        <input name="state" type="radio" class="noborder" value="<%=FinalConstants.STATE_MEND%>"  <%=(u.getState()==FinalConstants.STATE_MEND?"checked":"")%>>
      补丁</td>
    </tr>
    <tr align="center">
      <td bgcolor="#FFFFFF">推荐指数</td>
      <td align="left" bgcolor="#FFFFFF"><select name="commend">
          <option value="1" <%=u.getCommend()==1?"selected":""%>>1</option>
          <option value="2" <%=u.getCommend()==2?"selected":""%>>2</option>
          <option value="3" <%=u.getCommend()==3?"selected":""%>>3</option>
          <option value="4" <%=u.getCommend()==4?"selected":""%>>4</option>
          <option value="5" <%=u.getCommend()==5?"selected":""%>>5</option>
      </select></td>
    </tr>
    <tr align="center">
      <td bgcolor="#FFFFFF">程序大小</td>
      <td align="left" bgcolor="#FFFFFF"><input name="filesize" type="text" value="<%=u.getFilesize()%>" onBlur="return filesizes()">
      (MB)</td>
    </tr>
    <tr align="center">
      <td bgcolor="#FFFFFF">其他说明</td>
      <td align="left" bgcolor="#FFFFFF"><textarea name="resume" cols="50" rows="5" class="textarea"><%=u.getResume()%></textarea></td>
    </tr>
    <tr align="center">
      <td height="27" colspan="2" bgcolor="#FFFFFF"> <input type="hidden" name="mid" value="<%=u.getMid()%>">
        <input type="hidden" name="action" value="modify">
        <input name="Submit" type="submit" class="btn_grey" onClick="return mend()" value="提交">
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
<%}%>
</body>
</html>
