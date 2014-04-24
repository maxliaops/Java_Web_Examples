<%@ page contentType="text/html;charset=gb2312" language="java"%>
<%@ page import="java.sql.*,java.io.*"%>
<jsp:useBean id="rst" scope="page" class="com.mingri.dbconn.DBResult"/>
<jsp:useBean id="calendar" scope="page" class="com.mingri.showtime.ShowTime"/>
<html>
<title>商品入库信息</title>
<meta http-equiv="Content-Type" content="text/html;charset=gb2312">
<link href="../CSS/style.css" rel="stylesheet" type="text/css">
<body>
<%
   request.setCharacterEncoding("gb2312");//对字符串统一编码解决表单提交中的中文乱玛问题
   String strSql="select * from tb_brand";
   String maxCount="select max(id) from tb_ruku";//在入库表中查找出最大的id号
   ResultSet rs=rst.getResult(strSql);//在下拉列表中显示商品名称
   String jc=""; String gg="";String bz="";String spid="";String spname="";
   String gysname="";String cd="";String dw="";String theMax="";
   String rkspname=(String)request.getParameter("rkspname");//获得用户所选商品的简称
   String rkStr="select * from tb_brand where spname='"+rkspname+"'";
   ResultSet rs1=rst.getResult(rkStr);//根据商品名称查询出用户所选商品

   if(rs1.next()){
     jc=rs1.getString("jc");gg=rs1.getString("gg");bz=rs1.getString("bz");
     gysname=rs1.getString("gysname"); cd=rs1.getString("cd");dw=rs1.getString("dw");
     spid=rs1.getString("ID");spname=rs1.getString("spname");
   }
   ResultSet rs2=rst.getResult(maxCount);//获得tb_ruku表中字段"id"最大的记录
   if(rs2.next()){
     theMax=rs2.getString(1);
   }
   //将最大的字段加1
   String rkbh="RK"+calendar.getDateString()+(Integer.parseInt(theMax.substring(10))+1);
%>
<table width="584" border="0" cellspacing="0" cellpadding="0">
<tr>
    <td height="27" colspan="6" bgcolor="#EEEEEE" class="tableBorder_gray">
    &nbsp;<span  class="word_deepgrey"> 当前位置：库存管理> </span>商品入库 &gt;&gt;&gt;</td>
  </tr>
    <tr><td valign="top" height="83"><br>
    <table width="98%" height="112"  border="0" align="center" cellpadding="1" cellspacing="1" bgcolor="#F2F2F2">
         <tr><td width="274" >
    <form  name="form1" method="post" action="sprk.jsp" >
       <tr><td height="27">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<select name="rkspname" onChange="spchange()">
         <option selected="selected">请选择入库商品的商品名称</option>
        <%while(rs.next()){%>
        <option value=<%=rs.getString("spname")%>> <%=rs.getString("spname")%> </option>
        <%}%>
        </select></td><td width="276"> 注:带*号为必填项 </td></tr>
        <tr><td height="27">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;入库编号:<font color="#585858"><%=rkbh%></font></td></tr>
        <tr><td height="27">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;商品名称:<font color="#585858"><%=spname%></font></td>
            <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;简&nbsp;&nbsp;称:<font color="#585858"><%=jc%></font></td>
        </tr>
        <tr><td height="27">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;规&nbsp;&nbsp;格:<font color="#585858"><%=gg%></font></td>
            <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;包&nbsp;&nbsp;装:<font color="#585858"><%=bz%></font></td>
        </tr>
        <tr><td height="27">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;供应商全称:<font color="#585858"><%=gysname%></font></td>
            <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;产&nbsp;&nbsp;地:<font color="#585858"><%=cd%></font></td>
        </tr>
    </form>

    <form  name="form2" method="post" action="spChange.jsp" >
      <%
         session.setAttribute("jc",jc); session.setAttribute("spname",spname);
         session.setAttribute("gg",gg); session.setAttribute("bz",bz);
         session.setAttribute("cd",cd); session.setAttribute("rkbh",rkbh);
         session.setAttribute("dw",dw); session.setAttribute("spid",spid);
         session.setAttribute("gysname",gysname);
      %>
        <tr><td height="27">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;数&nbsp;&nbsp;量:<input type="text" name="sl" onBlur="autoje()">
              (<%=dw%>)*</td>
            <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;金&nbsp;&nbsp;额:<input type="text" name="je" readonly></td>
        </tr>
        <tr><td height="27">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;单&nbsp;&nbsp;价:<input type="text" name="dj" onBlur="autoje()">
              (元)*</td>
            <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;应&nbsp;&nbsp;付:<input type="text" name="yf" readonly></td>
        </tr>
        <tr><td height="27">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;实&nbsp;&nbsp;付:<input type="text" name="sf" onBlur="autoje()">
              (元)*</td>
            <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;未&nbsp;&nbsp;付:<input type="text" name="wf" readonly></td>
        </tr>
        <tr><td height="27">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;操作员:<input type="text" name="czy" readonly value="<%=session.getAttribute("username")%>">
              </td>
            <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;经手人:<input type="text" name="jsr">*</td>
        </tr>
        <tr><td height="27">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;入库日期:<input type="text" name="rkdate" readonly value="<%=calendar.getDate()%>">
             </td>
            <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;结算方式:<select name="jsfs">
            <option value="现金" selected>现金</option>
            <option value="yf" >预付</option>
            <option value="zp" >支票</option>
            <option value="gz" >挂账</option></select></td>
        </tr>

        <input type="hidden" name="hjc" value=<%=jc%>></form>
        <tr><td height="40" colspan="2" align="center">
          <input name="mySubmit"  type="button" value="保存信息"  onclick="check()" class="btn_grey"> 
          &nbsp;        
            <input name="myeset"type="reset" class="btn_grey" value="清除重置" onClick="myreset()"></td>
        </tr>
</form>
</table>      </td></tr>
</table>
</body>
</html>
<script language='JavaScript'>
function spchange()
{
  form1.submit();
}
function autoje()
{
    str=form2.sl.value;
    if(isNaN(str)){//判断输入是否为数字
      form2.sl.value=0;
      alert("输入错误,请输入数字");form2.sl.focus();retrun;}
    str=form2.dj.value;
    if(isNaN(str)){
      form2.dj.value=0;
      alert("输入错误,请输入数字");form2.dj.focus();retrun;}
    str=form2.sf.value;
    if(isNaN(str)){
      form2.sf.value=0;
      alert("输入错误,请输入数字");form2.sf.focus();retrun;}
    //自动计算金额、应收及未收款
    form2.je.value=form2.dj.value*form2.sl.value;
    form2.yf.value=form2.je.value;
    form2.wf.value=form2.yf.value-form2.sf.value;
    if(form2.sf.value-form2.yf.value>0){
      form2.sf.value=0;
      form2.wf.value=form2.yf.value;
      alert("实付金额不应大于应付金额!");form2.sf.focus();return;
    }
}
function check()
{
  if(form2.sl.value==0){
    alert("请输入数量");form2.sl.focus();return;}
  if(form2.dj.value==0){
    alert("请输入单价");form2.dj.focus();return;}
  if(form2.sf.value==0){
    alert("请输入实付");form2.sf.focus();return;}
  if(form2.jsr.value==""){
    alert("请输入经手人姓名");form2.jsr.focus();return;}
  form2.submit();
}
function myreset()
{
  form2.reset();
}
</script>




















