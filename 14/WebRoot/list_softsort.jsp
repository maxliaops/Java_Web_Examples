<%@ page contentType="text/html; charset=GBK" %>
<%@ page import="com.model.User" %>
<%@ page import="com.model.Soft" %>
<%@ page import="com.core.*" %>
<%@ page import="java.util.*" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<title>锐芒科技</title>
<link href="css/css.css" rel="stylesheet" type="text/css">
</head>
<body onLoad="clockon(bgclock)">
<table width="781" border="0" align="center" cellpadding="0" cellspacing="0" class="tableBorder">
  <tr>
    <td height="165" colspan="3"><jsp:include page="top.jsp"/></td>
  </tr>
  <tr>
    <td width="11">&nbsp;</td>  
    <td width="7" align="left" valign="top"><jsp:include page="left_softsort.jsp"/></td>

    <td width="731"  align="center" valign="top">
	<table><tr bgcolor="#FFFFFF">
    <td colspan="3"  align="center" valign="top" height="5px"></td>
	</tr></table>
	<table width="96%" border="0" align="center" cellpadding="0" cellspacing="1" class="tableNew">
	    <tr align="center" bgcolor="#1789D5">
          <td height="27" colspan="3" class="TableTitle1">≡ 产品信息 ≡</td>
        </tr>
        <%
BasetableFactory bf=BasetableFactory.getInstance();
String sql=ParamUtils.getRequestString(request,"sid");
if(sql!=null&&!"".equals(sql)) sql="WHERE sid="+sql;
	Collection coll=bf.ListSoft(sql);
	if(coll==null||coll.size()<0||coll.isEmpty()){%>
        <tr align="center">
          <td width="750" height="24" colspan="3" bgcolor="#FFFFFF">没有添加该类别的产品</td>
        </tr><%}else{
        Iterator it=coll.iterator();
        while(it.hasNext()){        Soft s=(Soft)it.next();%>
        <tr>
          <td width="33%" height="24" align="center" bgcolor="#FFFFFF">产品名称</td>
          <td width="33%" align="center" bgcolor="#FFFFFF"><%=s.getName()%></td>
          <td width="34%" rowspan="5" align="center" bgcolor="#FFFFFF">
		  <%String path=bf.SearchHead("WHERE iid='"+StringUtils.toUnicode(s.getIid()+"'")).getPath();
		  if(path==null){out.print("无图片");
		  }else{out.print("<img src='"+path+"' width=150 height=135 >");}%></td>
        </tr>
        <tr>
          <td height="24" align="center" bgcolor="#FFFFFF">产品版本</td>
          <td width="33%" align="center" bgcolor="#FFFFFF"><%=s.getEdition()%></td>
        </tr>
        <tr>
          <td height="24" align="center" bgcolor="#FFFFFF">运行环境</td>
          <td width="33%" align="center" bgcolor="#FFFFFF"><%=s.getEnvironment()%></td>
        </tr>
        <tr>
          <td height="12" align="center" bgcolor="#FFFFFF">产品价格</td>
          <td width="33%" align="center" bgcolor="#FFFFFF"><%=s.getPrice()%>(元)</td>
        </tr>
        <tr>
          <td height="12" align="center" bgcolor="#FFFFFF">推荐指数</td>
          <td width="33%" align="center" bgcolor="#FFFFFF"><% for(int i=0;i<s.getCommend();i++){out.print("<img src='images/star.gif'>");}%></td>
        </tr>
        <tr>
          <td height="24" align="center" bgcolor="#FFFFFF">版本说明</td>
          <td width="33%" align="center" bgcolor="#FFFFFF"><%=s.getRegular()==1?"正式版":"试用版"%>
          <td width="34%" rowspan="5" align="left" valign="top" bgcolor="#FFFFFF">&nbsp;&nbsp;&nbsp;&nbsp;<%=s.getIntroduce()%></td>
        </tr>
        <tr>
          <td height="24" align="center" bgcolor="#FFFFFF">产品类别</td>
          <td width="33%" align="center" bgcolor="#FFFFFF"><%=bf.SearchSsort("where sid="+s.getSid()).getName()%></td>
        </tr>
        <tr>
          <td height="12" align="center" bgcolor="#FFFFFF">文件大小</td>
          <td width="33%" align="center" bgcolor="#FFFFFF"><%=s.getFilesize()%>MB</td>
        </tr>
        <tr>
          <td height="12" align="center" bgcolor="#FFFFFF">下载数量</td>
          <td width="33%" align="center" bgcolor="#FFFFFF"><%=s.getLoadnum()%></td>
        </tr>
        <tr>
          <td height="24" align="center" bgcolor="#FFFFFF">上传时间</td>
          <td width="33%" align="center" bgcolor="#FFFFFF"><%=s.getUptime()%></td>
        </tr>
        <tr>
          <td height="12" align="center" bgcolor="#FFFFFF">其他说明</td>
          <td colspan="2" rowspan="2" align="left" valign="top" bgcolor="#FFFFFF">&nbsp;&nbsp;&nbsp;&nbsp;<%=s.getResume()%></td>
        </tr>
        <tr>
          <td height="12" align="center" bgcolor="#FFFFFF">点击下载<a href="download.jsp?sfid=<%=s.getSfid()%>"><img src="images/download.gif" border="0"></a></td>
        </tr>
		<tr><td colspan="3" bgcolor="#FFFFFF">
		<hr size="1">
		</td></tr> 
		
<%}}%>
      </table></td>
  </tr>
  <tr>
    <td colspan="3" align="left" valign="top">
<jsp:include page="bottom.jsp"/>
	</td>
  </tr>
</table>
</body>
</html>
