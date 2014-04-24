<%@ page contentType="text/html; charset=GBK" %>
<%@ page import="java.util.Collection" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="com.core.BasetableFactory" %>
<%@ page import="com.model.Head" %>
<%@ page import="com.model.Soft" %>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<link href="css/style.css" rel="stylesheet" type="text/css">
<table width="525" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="33" colspan="3" valign="bottom"><img src="images/title_introduce.GIF" width="521" height="29" border="0" usemap="#Map" /></td>
  </tr>
  <tr>
    <td width="9">&nbsp;</td>
    <td width="531"><table width="511"  border="0" cellpadding="0" align="right" cellspacing="0">
      <tr>
        <td align="right">
<table width="500"  border="0" align="center" cellpadding="0" cellspacing="0"  bordercolorlight="#d8d8d8" bordercolordark="#FFFFFF">
      <%
BasetableFactory bf=BasetableFactory.getInstance();
Collection coll=bf.ListSoft(1000,"ORDER BY uptime DESC");
if(coll==null||coll.size()<=0){%>
      <tr align="center">
        <td height="22" colspan="3">没有添加产品软件</td>
      </tr>
      <%

}else{
        Iterator it=coll.iterator();
        while(it.hasNext()){
        	Soft s=(Soft)it.next();
%>
      <tr>
        <td width="74" height="20" align="center">软件名称：</td>
        <td width="238">&nbsp;<%=s.getName()%></td>
        <td width="188" rowspan="5" align="center" valign="middle" class="tableBorder"><%String path=bf.SearchHead("WHERE iid='"+s.getIid()+"'").getPath();if(path==null){out.print("无图片");}else{out.print("<img src="+path+" width=150 height=135>");}%></td>
      </tr>
      <tr>
        <td height="20" align="center">版 本 号：</td>
        <td height="24">&nbsp;<%=s.getEdition()%></td>
      </tr>
      <tr>
        <td height="20" align="center">运行平台：</td>
        <td height="24">&nbsp;<%=s.getEnvironment()%></td>
      </tr>
      <tr>
        <td height="20" align="center">价&nbsp;&nbsp;&nbsp;&nbsp;格：</td>
        <td height="12">&nbsp;<%=s.getPrice()%></td>
      </tr>
      <tr>
        <td height="20" align="center">软件类别：</td>
        <td height="12">&nbsp;<%=bf.SearchSsort("WHERE sid="+s.getSid()).getName()%></td>
      </tr>
      <tr align="right">
        <td height="20" align="center">产品介绍：</td>
        <td height="6" colspan="2" align="left" valign="top" style="padding:5px;">&nbsp;&nbsp;&nbsp;&nbsp;<%=s.getIntroduce()%></td>
      </tr>
	  <tr><td height="5px" colspan="3">
	  <hr size="1">
	  </td></tr>
      <%}%>
<%}%>	  
    </table>		</td>
      </tr>
    </table></td>
    <td width="15" valign="top">&nbsp;</td>
  </tr>
    <tr>
    <td colspan="3">&nbsp;</td>
  </tr>
</table>

<map name="Map" id="Map"><area shape="rect" coords="457,4,501,19" href="list_softsort.jsp" />
</map>