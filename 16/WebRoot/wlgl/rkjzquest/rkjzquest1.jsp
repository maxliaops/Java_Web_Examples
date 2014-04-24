<%@ page contentType="text/html;charset=gb2312"%>
<%request.setCharacterEncoding("gb2312");%>
<html>
  <title>销售结账查询</title>
  <meta http-equiv="Content-Type" content="text/html;charset=gb2312">
  <link href="../../CSS/style.css" rel="stylesheet" type="text/css">
    <style type="text/css">
<!--
.style1 {color: #FF3535}
.style2 {color: #333333}
-->
    </style>
<body>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tr>
    <td height="27" bgcolor="#EEEEEE" class="tableBorder_gray">
    &nbsp;<span  class="word_deepgrey"> 当前位置：往来管理 > </span>入库结账查询 &gt;&gt;&gt;</td>
  </tr>
    <tr><td valign="top" height="83">
      <table width="98%" height="90" border="0" cellpadding="0" cellspacing="0">
        <tr><td width="590" height="41" align="Top">
          <form name="form1" method="POST" action="rkjzquest.jsp" target="MainFrame">
            <div align="center">请选择查询条件:
                <select name="cif">
                  <option value="gysname" selected>供应商名称</option>
                  <option value="id">结款编号</option>
                  <option value="rkid">入库票号</option>
                </select>
                <select name="ccif">
                  <option value="=" selected> 等于</option>
                  <option value="LIKE">LIKE</option>
                  <option value="ALL">ALL</option>
                </select>
                <input type="text" name="qvalue">
                <select name="andor">
                  <option value="AND" selected> AND</option>
                  <option value="OR">OR</option>
                </select>
                <br>
                请输入查询日期：从
                <input type="text" name="sdate" size="16">
                至
                <input type="text" name="edate" size="16">
                <input name="submit1" type="button" class="btn_grey" value="查询" onClick="check()">
                <input name="submit2" type="button" class="btn_grey" value="显示全部数据" onClick="listall()">
            </div>
          </form>
           </td><td>&nbsp;
        </td>
        </tr>
      </table>
    </td></tr>
  </table>
</body>
</html>
<script language='JavaScript'>
function listall()
{
window.location.reload();
form1.ccif.value="ALL";
form1.submit();}
function  check(){
  if(form1.qvalue.value==0){
    alert("请输入查询条件");form1.qvalue.focus();
    return;
  }
  if(form1.sdate.value==0){
    form1.sdate.focus();
    alert("请输入查询日期");return;
    }
  if(form1.edate.value==0){
    form1.edate.focus();
    alert("请输入截止日期");return;
    }
  if(CheckDate(form1.sdate.value)){
    alert("请输入标准日期(如:(年/月/日)或(年-月-日))");
    form1.sdate.focus();
    form1.sdate.focus();
    return;
  }
  if(CheckDate(form1.edate.value)){
    alert("请输入标准日期(如:(年/月/日)或(年-月-日))");
    form1.edate.value="";
    form1.edate.focus();
    return;
  }
  form1.submit();
}
//判断输入的日期是否正确
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
</script>
