<%@page contentType="text/html; charset=gb2312" language="java"%>
<%@page import="com.actionForm.LoanForm"%>
<%@page import="com.actionForm.GoodsForm"%>
<%@page import="com.core.GetTime"%>
<%@page import="java.util.*"%>
<script language="javascript">
function check(myform){
	if(myform.flag[0].checked==false && myform.flag[1].checked==false && myform.flag[2].checked==false){
		alert("请选择查询方式!");return false;
	}
	if (myform.flag[1].checked){
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
          <td width="70%" valign="bottom"> 当前位置：物资入库
            &gt;
            借出归还
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
		<form name="myform" method="post" action="ifDeal.do?action=loanBackQuery">
          <table width="98%"  border="0" cellpadding="0" cellspacing="0" bgcolor="#E3F4F7" class="tableBorder">
            <tr>
              <td rowspan="2" align="center">&nbsp;<img src="images/search.gif" width="45" height="28"></td>
              <td height="14"><div><input name="flag" type="checkbox" class="noborder" value="a" checked>
                请选择查询依据：
                  <select name="f" class="wenbenkuang" id="f">
                    <option value="lno">借出单号</option>
                    <option value="borrowperson">借用人</option>
                    <option value="principal">负责人</option>
                    <option value="username">操作员</option>
                   </select>
                  <input name="key" type="text" id="key" size="50">
                  <input name="Submit" type="submit" class="btn_grey" value="查询" onClick="return check(myform)"></div></td>
            </tr>
            <tr>
              <td><input name="flag" type="checkbox" class="noborder" id="flag" value="b"><input name="flag" type="checkbox" class="noborder" id="flag" value="c" checked="checked" style="display:none">
借出时间：                从
  <input name="sdate" type="text" id="sdate">
到
<input name="edate" type="text" id="edate">
(日期格式为：2011-07-05)<input name="state" type="hidden" id="state" value="1">
</td>
            </tr>
          </table>
		</form>
		<%
		List list=(List)request.getAttribute("loanBackQuery");
                System.out.println("LIST SIZE:"+list.size());
if(list.size()==0){
%>
          <table width="98%" height="30"  border="0" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF">
            <tr>
              <td height="36" align="center">没有符合条件的借出单信息！</td>
            </tr>
          </table>
          <%
}else{
	int id=0;
	String lno="";
	String goodsname="";
	String spec="";
	String principal="";
	String borrowperson="";
	String btel="";
        String username="";
	String createTime="";
	GoodsForm goodsF=null;
  %>
          <table width="98%"  border="1" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF" bordercolordark="#D2E3E6" bordercolorlight="#FFFFFF">
  <tr align="center" bgcolor="#e3F4F7">
    <td width="19%">借出单号</td>
    <td width="24%">物资名称 [ <span class="word_grey">规格</span> ]</td>
    <td width="8%">借用人</td>
    <td width="9%">电话</td>
    <td width="7%">负责人</td>
    <td width="8%">操作员</td>
    <td width="20%">借出审核时间</td>
    <td width="4%">归还</td>
  </tr>
<%
for(int i=0;i<list.size();i++){
  LoanForm LoanForm=(LoanForm)list.get(i);
  id=LoanForm.getId();
  lno=LoanForm.getLno();
  goodsF=LoanForm.getGoods();
  goodsname=goodsF.getName();
  spec=goodsF.getSpec();
  principal=LoanForm.getPrincipal();
  borrowperson=LoanForm.getBorrowperson();
  btel=LoanForm.getBtel();
  username=LoanForm.getUsername();
  GetTime getTime=new GetTime();
  createTime=getTime.formatTime(LoanForm.getApprovetime());
%>
  <tr>
    <td style="padding:5px;">&nbsp;<%=lno%></td>
    <td style="padding:5px;"><%=goodsname%> [&nbsp;<span class="word_grey"><%=spec%></span>&nbsp;]</td>
    <td style="padding:5px;">&nbsp;<%=borrowperson%></td>
    <td style="padding:5px;">&nbsp;<%=btel%></td>
    <td style="padding:5px;">&nbsp;<%=principal%></td>
    <td style="padding:5px;">&nbsp;<%=username%></td>
    <td style="padding:5px;">&nbsp;<%=createTime%></td>
    <td align="center" style="padding:5px;"><a href="loan.do?action=backloan&id=<%=id%>"><img src="images/enforce.gif" width="16" height="16" border="0"></a></td>
 </tr>
 <%} %>
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

