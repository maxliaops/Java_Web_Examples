<%@ page contentType="text/html;charset=gb2312" language="java"%>
<%@ page import="java.sql.*,java.io.*"%>
<jsp:useBean id="qu" scope="page" class="com.mingri.info.QuestString"/>
<jsp:useBean id="rst" scope="page" class="com.mingri.dbconn.DBResult"/>
<jsp:useBean id="calendar" scope="page" class="com.mingri.showtime.ShowTime"/>
<jsp:useBean id="trans" scope="page" class="com.mingri.chinese.ToChinese"/>
<html>
<title>商品入库信息</title>
<meta http-equiv="Content-Type" content="text/html;charset=gb2312">
<link href="../../CSS/style.css" rel="stylesheet" type="text/css">
<body>
<%
   //自动生成入库结帐最大票号
   String maxCount="select max(id) as maxid from tb_rkjz";
   String theMax="";
   ResultSet rsMax=rst.getResult(maxCount);
   if(rsMax.next()){
     theMax=rsMax.getString(1);
   }
   //最大结帐票号由字符"JK"加上系统日期加五位数字编码组成
   String jkph="JK"+calendar.getDateString()+(Integer.parseInt(theMax.substring(10))+1);
//——————————————————————————————————————————————————————————
   //分页显示出入库票号表(tb_rkph)中的信息
   String pages=request.getParameter("pages");//接收当前页数，用做分页显示
   String cif=request.getParameter("cif");//接收查询条件
   String ccif=request.getParameter("ccif");//接收查询方法
   String qvalue=trans.trans(request.getParameter("qvalue"));//接收查询关键字
   String table="tb_rkph";//定义需要查询的表名
   String httpFile="sprkjz.jsp";//定义处理请求的JSP文件
   //将查询所需要的条件在JavaBean中设置
   qu.setCif(cif);qu.setQValue(qvalue);qu.setCcif(ccif);
   qu.setPageSize(1);//设置每页显示的记录数为1条
   String strCount=qu.getXSCount(table);//获得所要查询的记录总数
   if(pages==null||pages.equals("null")){
     pages="0";
   }
   //调用JavaBean中的方法来设置Bean中的一些属性(主要是分页所需要的属性)
   qu.setQuerySql(httpFile,pages,strCount);
   //获得所需要查询的结果集
   ResultSet rs=rst.getResult((String)qu.getXSString(table));
   //获取当前页数和每页显示的记录数
   int i=0,Page=qu.getCurPage(),pagesize=qu.getPageSize();
   while(rs.next()){
     if(i>(Page-1)*pagesize-1){
%><form name="form1" action="sprkPayFor.jsp" method="POST">
   <table width="450" height="112"  border="0" align="center" cellpadding="1" cellspacing="1">

        <tr><td height="25">入库票号:
          <input type="text" name="rkph" readonly="readonly" value="<%=rs.getString("rkph")%>">
              <font color="#585858"></font></td>
            <td>数&nbsp;&nbsp;量:<input type="text" name="sl" readonly="readonly"
                         value="<%=rs.getString("sl")%>">
              <font color="#585858"></font></td>
        </tr>
        <tr><td height="25">供应商:
          <input type="text" name="gysname" readonly="readonly"
                         value="<%=rs.getString("gysname")%>">
              <font color="#585858"></font></td>
            <td>应&nbsp;&nbsp;付:<input type="text" name="yf" readonly="readonly"
                         value="<%=rs.getString("yf").substring(0,rs.getString("yf").length()-2)%>">元
              <font color="#585858"></font></td>
        </tr>
        <tr><td height="25">实&nbsp;&nbsp;&nbsp;&nbsp;付:
          <input type="text" name="sf" readonly="readonly"
                         value="<%=rs.getString("sf").substring(0,rs.getString("sf").length()-2)%>">元
              <font color="#585858"></font></td>
             <td>未&nbsp;&nbsp;付:<input type="text" name="wf" readonly="readonly"
                         value="<%=rs.getString("wf").substring(0,rs.getString("wf").length()-2)%>">元
              <font color="#585858"></font></td>
        </tr>
        <tr><td height="25">入库日期:
          <input type="text" name="rkdate" readonly="readonly"
                         value="<%=rs.getString("rkdate").substring(0,10)%>">
              <font color="#585858"></font></td>
            <td>操作员:<input type="text" name="czy" readonly="readonly"
                         value="<%=rs.getString("czy")%>">
              <font color="#585858"></font></td>
        </tr>
        <tr><td height="25">结算方式:
          <input type="text" name="jsfs" readonly="readonly"
                         value="<%=rs.getString("jsfs")%>">
              <font color="#585858"></font></td>
             <td>经手人:<input type="text" name="jsr" readonly="readonly"
                         value="<%=rs.getString("jsr")%>">
              <font color="#585858"></font></td>
        </tr>
  </table>

    <table width="450" height="10"  border="0" align="center" cellpadding="1" cellspacing="1">
       <tr><td height="25">结款票号:<input type="text" name="jkph" readonly="readonly"
                         value="<%=jkph%>">
              <font color="#585858"></font></td>
           <td>结款日期:<input type="text" name="jkdate" readonly="readonly"
                         value="<%=calendar.getDate()%>">
              <font color="#585858"></font></td>
        </tr>
       <tr><td height="25">本次结款:<input type="text" name="bcjk" onBlur="autoje()">
              <font color="#585858"></font></td>
           <td>余&nbsp;&nbsp;&nbsp;&nbsp;额:<input type="text" name="ye" readonly="readonly">
              <font color="#585858"></font></td>
        </tr>
        <tr><td height="25">操&nbsp;作&nbsp;员:<input type="text" name="czy1" readonly value="<%=session.getAttribute("username")%>">
              <font color="#585858"></font></td>
            <td>经&nbsp;手&nbsp;人:<input type="text" name="jsr1"></td>
        </tr>
        <tr><td height="40" colspan="2" align="center"><input name="submit1"  type="button" class="btn_grey"  onclick="check()" value="确定">
        &nbsp;
        <input type="reset" class="btn_grey" value="取消" onClick="myreset()"></td></tr>
    </table> 
</form>
<%}i++;}
rs.close();
String str_parameter="&cif="+qu.getCif()+"&ccif="+qu.getCcif()+"&qvalue="+qu.getQValue()+"";
session.setAttribute("str_parameter",str_parameter);
qu.setStr_parameter(str_parameter);
%>
<%=qu.pageFooter()%>
  </body>
</html>
<script language="javascript">
function autoje()
{
  if(form1.wf.value-form1.bcjk.value<0){
    alert("结款金额不应大于未付金额!");form1.bcjk.focus();return;}
  form1.ye.value=form1.wf.value-form1.bcjk.value;
}
function check()
{
  if(form1.bcjk.value==0){
    alert("请输入结账金额!");form1.bcjk.focus();return;}
  if(form1.jsr.value==0){
    alert("请输入经手人!");form1.jsr.focus();return;}
  if(isNaN(form1.bcjk.value)){
    alert("输入错误,请输入数字!");form1.bcjk.focus();return;}
  form1.submit();
}
function myreset()
{
  form1.bcjk.value="";form1.ye.value="";form1.jsr1.value="";
}
</script>












