<%@ page contentType="text/html; charset=gb2312" %>
<%@ page import="com.model.*" %>
<%@ page import="com.core.*" %>
<%@ page import="java.util.*" %>
<%if (!Crazyadept.UserIsOK(session,FinalConstants.STATUS_ADMIN)) return;%>
<html>
<head>
<title>add_affiche</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<link href="../css/admin.css" rel="stylesheet" type="text/css">
<script src="../js/validate.js"></script>
<script>
function su(){
//text/plain
        document.form2.encoding="application/x-www-form-urlencoded";
    document.form2.action="";
    document.form2.submit();
}
</script>
<body> 
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="1" class="tableNew"> 
  <tr align="center"> 
    <td colspan="2" class="TableTitle1" >添加解决方案</td> 
  </tr> 
  <form action="up_modify_resolvent.jsp" method="post" enctype="multipart/form-data" name="form2"> 
    <tr align="center"> 
      <td width="17%" height="27" bgcolor="#FFFFFF">方案名称：</td> 
      <td width="83%" height="27" align="left" bgcolor="#FFFFFF"> <input name="name" type="text" size="50"> </td> 
    </tr> 
    <tr align="center"> 
      <td height="27" bgcolor="#FFFFFF">所属软件类别：</td> 
      <td height="27" align="left" bgcolor="#FFFFFF"><select name="sid" onChange="su()"> 
          <%
int sid=ParamUtils.getIntParameter(request,"sid");
BasetableFactory bf=BasetableFactory.getInstance();
Collection coll=bf.ListSsort("");
if(coll==null||coll.size()<=0){
    out.print("<option>—无—</option>");
}else{
    out.print("<option>—请选择—</option>");
    Iterator it=coll.iterator();
    while(it.hasNext()){
        Ssort s=(Ssort)it.next();
        out.print("<option value='"+s.getSid()+"' "+(sid==s.getSid()?"selected":"")+">"+s.getName()+"</option>)");
        }
}%> 
      </select></td> 
    </tr> 
    <tr align="center"> 
      <td height="27" bgcolor="#FFFFFF">实例应用：</td> 
      <td height="27" align="left" bgcolor="#FFFFFF"><select name="sfid"> 
          <%
Collection col=bf.ListSoft("WHERE sid="+sid);
if(col==null|col.size()<=0){
    out.print("<option>—无—</option>");
}else{
    out.print("<option>—请选择—</option>");
    Iterator it=col.iterator();
    while(it.hasNext()){
        Soft s=(Soft)it.next();
        out.print("<option value="+s.getSfid()+">"+s.getName()+"</option>)");
        }
}%> 
      </select></td> 
    </tr> 
    <tr align="center"> 
      <td height="27" colspan="2" bgcolor="#FFFFFF"><span class="TableTitle1">解决方案</span></td> 
    </tr> 
    <tr align="center"> 
      <td height="27" colspan="2" bgcolor="#FFFFFF"><textarea name="content" cols="90" rows="20" class="textarea"></textarea></td> 
    </tr> 
    <tr align="center"> 
      <td height="27" colspan="2" bgcolor="#FFFFFF">上传解决方案例图&nbsp; 
      <input name="file" type="file" size="50"></td> 
    </tr> 
    <tr align="center"> 
      <td height="27" colspan="2" bgcolor="#FFFFFF"> <input type="hidden" name="uid" value='<%=(((User)session.getAttribute("user")).getUid())%>'> 
        <input name="Submit" type="submit" class="btn_grey" onClick="return resolvent()" value="提交"> 
&nbsp;&nbsp; 
      <input name="Submit2" type="reset" class="btn_grey" value="重置"></td> 
    </tr> 
  </form> 
</table> 
<table width="100%"  border="0" cellspacing="0" cellpadding="0"> 
  <tr> 
    <td height="50" colspan="5" align="right"><a href="#" onClick="Jscript:history.back()">返回</a></td> 
  </tr> 
</table> 
</body>
</html>
