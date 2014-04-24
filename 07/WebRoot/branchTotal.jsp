<%@page contentType="text/html; charset=gb2312" language="java"%>
<%@page import="com.actionForm.GetUseForm"%>
<%@page import="com.actionForm.BranchForm"%>
<%@page import="com.actionForm.GoodsForm"%>
<%@page import="com.core.GetTime"%>
<%@page import="java.util.*"%>
<script language="javascript">
function check(myform){
		if(myform.sdate.value==""){
			alert("请输入开始日期");myform.sdate.focus();return false;
		}
		if(CheckDate(myform.sdate.value)){
			alert("您输入的开始日期不正确！\n 请注意日期格式或闰年！");myform.sdate.focus();return false;
		}
		if(myform.edate.value==""){
			alert("请输入结束日期");myform.edate.focus();return false;
		}
		if(CheckDate(myform.edate.value)){
			alert("您输入的结束日期不正确！\n 请注意日期格式或闰年！");myform.edate.focus();return false;
		}
}
</script>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312"/>
<title>物资管理系统</title>
<link rel="stylesheet" href="Css/style.css">
<script src="JS/function.js"></script>
</head>
<body>
<table width="757" height="174" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="133" align="center" valign="top"><%@include file="top.jsp"%>
    </td>
  </tr>
  <tr>
    <td><table width="100%" height="26" border="0" cellpadding="0" cellspacing="0" background="images/area_bg.jpg">
        <tr>
          <td width="26%" align="center" class='word_white'>当前登录用户：<%=session.getAttribute("username")%></td>
          <td width="4%">&nbsp;</td>
          <td width="70%" valign="bottom"> 当前位置：查询统计
            &gt;
            部门汇总
            &gt;&gt;&gt; </td>
        </tr>
      </table>
      <table width="100%" height="385" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
        <tr>
          <td width="5" valign="top" background="images/left.gif">&nbsp;</td>
          <td align="center" valign="top">&nbsp;
<table width="96%" height="487"  border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td align="center" valign="top">
		<form name="myform" method="post" action="ifDeal.do?action=branchTotal">
          <table width="98%"  border="0" cellpadding="0" cellspacing="0" bgcolor="#E3F4F7" class="tableBorder">
            <tr>
              <td align="center">&nbsp;<img src="images/search.gif" width="45" height="28"></td>
              <td><input name="flag" type="checkbox" id="flag" value="b" checked style="display:none">
统计时间：                从
  <input name="sdate" type="text" id="sdate">
到
<input name="edate" type="text" id="edate">
(日期格式为：2011-07-05)
<input name="Submit" type="submit" class="btn_grey" value="统计" onClick="return check(myform)"></td>
            </tr>
          </table>
		</form>
<%
List list=(List)request.getAttribute("branchTotal");
System.out.println("LIST SIZE:"+list.size());
if(list.size()==0){
%>
          <table width="98%" height="30"  border="0" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF">
            <tr>
              <td height="36" align="center">没有符合条件的部门领用信息！</td>
            </tr>
          </table>
          <%
}else{
	String sDate=(String)request.getAttribute("sDate");
	String eDate=(String)request.getAttribute("eDate");
	String message="";
	if(sDate==null || sDate.equals("")){
		message="全部部门汇总信息";
	}else{
		message="从"+sDate+"到"+eDate+"之间的部门汇总信息";
	}
	String goodsname="";
	String spec="";
        String unit="";
        float price=0.0f;
	String branchname="";
	int lyamount=0;
	int bsamount=0;
	int zyamount=0;
  %>
          <table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td align="center"><%=message%></td>
            </tr>
          </table>
          <table width="98%"  border="1" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF" bordercolordark="#D2E3E6" bordercolorlight="#FFFFFF">
  <tr align="center" bgcolor="#e3F4F7">
    <td width="12%">部门</td>
    <td width="27%">物资名称[规格]</td>
    <td width="4%">单位</td>
    <td width="7%">单价</td>
    <td width="8%">领用数量</td>
    <td width="9%">领用金额</td>
    <td width="9%">报损数量</td>
    <td width="8%">报损金额</td>
    <td width="8%">在用数量</td>
    <td width="8%">在用金额</td>
  </tr>
<%
for(int i=0;i<list.size();i++){
	Object obj[]=(Object[])list.get(i);
	goodsname=obj[0].toString();
	spec=obj[1].toString();
        unit=obj[2].toString();
        price=Float.parseFloat(obj[3].toString());
	branchname=obj[4].toString();
	lyamount=Integer.parseInt(obj[5].toString());
	bsamount=Integer.parseInt(obj[6].toString());
	zyamount=Integer.parseInt(obj[7].toString());
%>
  <tr>
    <td style="padding:5px;"><%=branchname%></td>
    <td style="padding:5px;"><%=goodsname%>[<%=spec%>]</td>
    <td align="center" style="padding:5px;"><%=unit%></td>
    <td align="center" style="padding:5px;"><%=price%></td>
    <td align="center" style="padding:5px;"><%=lyamount%></td>
    <td style="padding:5px;"><%=price*lyamount%></td>
    <td style="padding:5px;"><%=bsamount%></td>
    <td style="padding:5px;"><%=price*bsamount%></td>
    <td style="padding:5px;"><%=zyamount%></td>
    <td style="padding:5px;"><%=price*zyamount%></td>
  </tr>
<%}%>
</table>
<%}%>
          </td>
      </tr>
    </table>

          </td>
          <td width="10" valign="top" background="images/right.jpg">&nbsp;</td>
        </tr>
      </table></td>
  </tr>
  <tr>
    <td height="55" valign="top" background="images/bottom.jpg"><%@include file="copyright.jsp"%>
    </td>
  </tr>
</table>
</body>
</html>

