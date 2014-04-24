<%@ page contentType="text/html;charset=gb2312" language="java"%>
<meta http-equiv="Content-Type" content="text/html;charset=gb2312">
<%@ page import="java.sql.*,java.io.*"%>
<jsp:useBean id="rst" scope="page" class="com.mingri.dbconn.DBResult"/>
<jsp:useBean id="calendar" scope="page" class="com.mingri.showtime.ShowTime"/>
<html>
<title>商品销售信息</title>
<link href="../CSS/style.css" rel="stylesheet" type="text/css">
<body>
<%
   request.setCharacterEncoding("gb2312");
   String strSql="select * from tb_kucun";
   String strKh="select * from tb_customer";
   String maxCount="select max(id) from tb_sell";
   ResultSet rs=rst.getResult(strSql);//在下拉列表中显示销售商品名称
   ResultSet rsKh=rst.getResult(strKh);

   String jc=""; String gg="";String bz="";String spid="";String spname="";
   String dj="";String cd="";String dw="";String kcsl="";String theMax="";
   String xsspname=(String)request.getParameter("xsspname");//获得用户所选商品的简称
   String rkStr="select * from tb_kucun where jc='"+xsspname+"'";
   ResultSet rs1=rst.getResult(rkStr);//根据简称查询出用户所选商品

   if(rs1.next()){
     jc=rs1.getString("jc");gg=rs1.getString("gg");bz=rs1.getString("bz");
     cd=rs1.getString("cd");dw=rs1.getString("dw");kcsl=rs1.getString("kcsl");
     spid=rs1.getString("ID");spname=rs1.getString("spname");
     dj=rs1.getString("dj");
   }
   ResultSet rs2=rst.getResult(maxCount);//获得tb_ruku表中字段"id"最大的记录
   if(rs2.next()){
     theMax=rs2.getString(1);
   }
   //将最大的字段加1
   String xsph="XS"+calendar.getDateString()+(Integer.parseInt(theMax.substring(10))+1);
%>
<table width="584" border="0" cellspacing="0" cellpadding="0">
<tr>
    <td height="27" colspan="6" bgcolor="#EEEEEE" class="tableBorder_gray">
    &nbsp;<span  class="word_deepgrey"> 当前位置：销售管理 > </span>商品销售 &gt;&gt;&gt;</td>
  </tr>
    <tr><td valign="top" height="83"><br>
<table width="98%" height="112"  border="0" align="center" cellpadding="1" cellspacing="1">
    <form  name="form1" method="post" action="spxs.jsp" >
       <tr><td height="25"><select name="xsspname" onChange="spchange()">
         <option >请选择销售的商品名称</option>
        <%while(rs.next()){%>
        <option value=<%=rs.getString("jc")%>> <%=rs.getString("spname")%> </option>
        <%}%>
        </select></td><td> <font color="#585858">注:带*号为必填项 </font></td></tr>
        <tr><td height="25">销售票号:<font color="#585858"><%=xsph%></font></td></tr>
        <tr><td height="25">商品名称:<font color="#585858"><%=spname%></font></td>
            <td>简&nbsp;&nbsp;称:<font color="#585858"><%=jc%></font></td>
        </tr>
        <tr><td height="25">规&nbsp;&nbsp;格:<font color="#585858"><%=gg%></font></td>
            <td>包&nbsp;&nbsp;装:<font color="#585858"><%=bz%></font></td>
        </tr>
        <tr><td height="25">产&nbsp;&nbsp;地:<font color="#585858"><%=cd%></font></td>
            <td>进&nbsp;&nbsp;价:<font color="#585858"><%=dj%>元</font></td>
        </tr>
    </form>

    <form  name="form2" method="post" action="xsChange.jsp" >
      <%
         session.setAttribute("jc",jc); session.setAttribute("spname",spname);
         session.setAttribute("gg",gg); session.setAttribute("bz",bz);
         session.setAttribute("cd",cd); session.setAttribute("xsph",xsph);
         session.setAttribute("dw",dw); session.setAttribute("spid",spid);
         session.setAttribute("dj",dj);
      %>
       <tr><td height="25">客户全称:
         <select name="xskhname">
          <%while(rsKh.next()){%>
          <option value="<%=rsKh.getString("khname")%>"> <%=rsKh.getString("khname")%></option>
          <%}%>
        </select></td>
        <td>库存数量:<input type="text" name="kcsl"  readonly value="<%=kcsl%>">        </td></tr>
        <tr><td height="25">单&nbsp;&nbsp;&nbsp;&nbsp;价:
          <input type="text" name="dj" value="<%=dj%>">
              <font color="#585858">(元)</font></td>
            <td>金&nbsp;&nbsp;&nbsp;&nbsp;额:<input type="text" name="je" readonly></td>
        </tr>
        <tr><td height="25">数&nbsp;&nbsp;&nbsp;&nbsp;量:
          <input type="text" name="sl" onBlur="autoje()">
              <font color="#585858">(<%=dw.trim()%>)*</font></td>
            <td>应&nbsp;&nbsp;&nbsp;&nbsp;收:<input type="text" name="ys" readonly></td>
        </tr>
        <tr><td height="25">实&nbsp;&nbsp;&nbsp;&nbsp;收:
          <input type="text" name="ss" onBlur="autoje()">
              <font color="#585858">(元)*</font></td>
            <td>未&nbsp;&nbsp;&nbsp;&nbsp;收:<input type="text" name="ws" readonly></td>
        </tr>
        <tr><td height="25">操&nbsp;作&nbsp;员:
          <input type="text" name="czy" readonly value="<%=session.getAttribute("username")%>">
              <font color="#585858"></font></td>
            <td>经&nbsp;手&nbsp;人:<input type="text" name="jsr">*</td>
        </tr>
        <tr><td height="25">销售日期:
          <input type="text" name="xsdate" value="<%=calendar.getDate()%>">
              <font color="#585858"></font></td>
            <td>结算方式:<select name="jsfs">
            <option value="现金" selected>现金</option>
            <option value="预付" >预付</option>
            <option value="支票" >支票</option>
            <option value="挂账" >挂账</option></select></td>
        </tr>

        <input type="hidden" name="hjc" value=<%=jc%>></form>
        <tr><td height="36" colspan="2" align="center"><input name="submit"  type="button" class="btn_grey"  onclick="check()" value="保存信息">          &nbsp;
          <input type="reset" class="btn_grey" value="清除重置" onClick="myreset()"></td>
        </tr>
    </form>
	</table>
      </td></tr>
</table>
</body>
</html>
<script language='JavaScript'>
function spchange()
{
  document.form1.submit();
}
function autoje()
{
    str=form2.sl.value;
    if(isNaN(str)){
      form2.sl.value=0;
      alert("输入错误,请输入数字");form2.sl.focus();return;}
    str=form2.dj.value;
    if(isNaN(str)){
      form2.dj.value=0;
      alert("输入错误,请输入数字");form2.dj.focus();return;}
    str=form2.ss.value;
    if(isNaN(str)){
      form2.ss.value=0;
      alert("输入错误,请输入数字");form2.ss.focus();return;}
    form2.je.value=form2.dj.value*form2.sl.value;
    form2.ys.value=form2.je.value;
    form2.ws.value=form2.ys.value-form2.ss.value;
    if(form2.ss.value-form2.ys.value>0){
      form2.ss.value=0;
      form2.ws.value=form2.ys.value;
      alert("实收金额不应大于应收金额!");form2.ss.focus();return;
    }
}
function check()
{
  if(form2.sl.value==0){
    alert("请输入数量");form2.sl.focus();return;}
  if(form2.dj.value==0){
    alert("请输入单价");form2.dj.focus();return;}
  if(form2.ss.value==0){
    alert("请输入实收");form2.ss.focus();return;}
  if(form2.jsr.value==""){
    alert("请输入经手人姓名");form2.jsr.focus();return;}
  if(form2.kcsl.value-form2.sl.value<0){
    alert("库存数量不足!请查证后进行销售");
    form2.sl.value=0;
    form2.sl.focus();return;
  }
  if(CheckDate(form2.xsdate.value)){
      alert("请输入标准日期(年-月-日或年/月/日)");
      form2.xsdate.value="";
      form2.xsdate.focus();return;
    }
    form2.submit();
}
function CheckDate(INDate)
{ if (INDate=="")//如果输入日期为空
    {return true;}
	subYY=INDate.substr(0,4)//截取输入日期的前4位
	if(isNaN(subYY) || subYY<=0){//如果输入的不是数字或着是负数
		return true;
	}
	//转换月份
        //从第输入数字的第0位开始查找，判断是否有字符串"-",如果有将separate的值设置为"-"
	if(INDate.indexOf('-',0)!=-1){	separate="-"}
	else{
		if(INDate.indexOf('/',0)!=-1){separate="/"}
		else {return true;}
		}
                //从字符串的第一个位置开始查找，返回特定字符的位置
		area=INDate.indexOf(separate,0)
		subMM=INDate.substr(area+1,INDate.indexOf(separate,area+1)-(area+1))
		if(isNaN(subMM) || subMM<=0){
		return true;
	}
		if(subMM.length<2){subMM="0"+subMM}//如果月份的只有一位那么在它的前面加"0"
	//转换日
	area=INDate.lastIndexOf(separate)//从字符串的最后一位开始查找，返回特定字符的位置
	subDD=INDate.substr(area+1,INDate.length-area-1)
	if(isNaN(subDD) || subDD<=0){
		return true;
	}
	if(eval(subDD)<10){subDD="0"+eval(subDD)}//对作为数字表达示的字符串求值
	NewDate=subYY+"-"+subMM+"-"+subDD
	if(NewDate.length!=10){return true;}//如果输入日期的长度小于10
    if(NewDate.substr(4,1)!="-"){return true;}//如果输入日期的第5位不是"-"
    if(NewDate.substr(7,1)!="-"){return true;}//如果输入日期的第8位不是"-"
	var MM=NewDate.substr(5,2);//从第5位开始截取字符串，截取2为，即获得月份
	var DD=NewDate.substr(8,2);//从第8位开始截取字符串，截取2为，即获得日
        //判断是否为闰年（能被4整除并且能够被100整除或者只能被400整除的年份就为闰年）
	if((subYY%4==0 && subYY%100!=0)||subYY%400==0){
		if(parseInt(MM)==2){//将MM转化为整数
			if(DD>29){return true;}
		}
	}else{
		if(parseInt(MM)==2){
			if(DD>28){return true;}
		}
	}
	var mm=new Array(1,3,5,7,8,10,12); //判断每月中的最大天数
	for(i=0;i< mm.length;i++){
		if (parseInt(MM) == mm[i]){//判断月份是否为数组中的值
			if(parseInt(DD)>31){return true;}
		}else{
			if(parseInt(DD)>30){return true;}
		}
	}
	if(parseInt(MM)>12){return true;}//如果月份大于12
   return false;}//如果以上情况都不是返回false

function myreset()
{
  form2.reset();
}
</script>




















