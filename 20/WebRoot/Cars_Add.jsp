<%@ page contentType="text/html; charset=gb2312" import="java.sql.*"%>
<%@ page import="java.io.*" %>
<% request.setCharacterEncoding("gb2312");%>
<html>
<head>
<title><%if(request.getParameter("id")==null){%>车 辆 数 据 添 加<%}else{%>车 辆 数 据 修 改<%}%></title>
</head>
<link rel="stylesheet" href="Css/style.css">
<jsp:useBean id="cross" scope="page" class="cars.CrossTable" />
<script src="Js/HiddenTable.js"></script>
<%!
String sql;
ResultSet rs;
int logo;
int typenumber;
int sum;
ResultSetMetaData rsmd;
%>
<%
if(request.getParameter("type")!=null){
logo=Integer.parseInt(request.getParameter("id"));
typenumber=Integer.parseInt(request.getParameter("type"));
rs=cross.getrs(typenumber,logo);
}
else{
rs=null;
}
%>
</script>
<SCRIPT>
function ShowTR(objTr,objImg){

	if(objTr.style.display == ""){
		objTr.style.display = "none";
		objImg.src="Image/jia.gif";
	}
	else
	{
		hiddenall(objTr);
		objTr.style.display = "";
		objImg.src="Image/jian.gif";
	}
}
</SCRIPT>
<script language="javascript">
function change(){
 var str=type.selects.value;
 switch(str){
 	case "商用车":
		location.href="Cars_Add_S.jsp";
		break;
	case "乘用车":
		location.href="Cars_Add.jsp";
		break;}
	}
</script>
<script language="javascript">
	function checks(){
		var names=orderform.品牌.value;
		var type=orderform.型号.value;
		var people=orderform.适用人群.value;
		var price=orderform.售价.value;
		if(names==""){
			alert("请填写车辆的品牌");
		}
		else if(type==""){
			alert("请填写车辆的型号");
		}
		else if(people==""){
			alert("请填写车辆适用的人群");
		}
		else if(price==""){
			alert("请填写车辆的参考价格");
		}
		else if(isNaN(parseInt(price))){
			alert("请如实填写车辆的参考价格");
		}
		else{
			orderform.submit();
		}
	}
</script>
<body leftmargin="0" topmargin="0">
<table width="500" height="560" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#efefef" class="table">
  <tr>
    <td valign="top"><table width="480" height="560" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td width="480" height="40" align="center">
		<div align="center" class="bottm" style="font-size: 16px;color: #FF0000;font-weight: bold;width:150;"><%if(request.getParameter("id")==null){%>车 辆 数 据 添 加<%}else{%>车 辆 数 据 修 改<%}%></div></td>
        </tr>
      <tr>
        <td valign="top">
		<table width="480" height="480" border="0" cellpadding="0" cellspacing="0">
          <tr valign="bottom">
            <td height="20" valign="top">
			<table width="480" border="0" cellspacing="0" cellpadding="0">
              <tr>
				  <form name="type">
                <td height="20">
                  <div align="left">
			<%if(request.getParameter("type")==null){%>
                    <select name="selects" class="wenbenkuang" onchange="change()">
                          <option value="商用车">商用车</option>
                          <option value="乘用车" selected>乘用车</option>
                    </select>
<%}%>
                     </div></td></form>
                <td><div align="right"><a href="#">确认当前操作时，请将所有树状表单收起</a></div></td>
              </tr>
            </table>
              </td>
          </tr>
          <tr valign="bottom">
            <td height="430" valign="top">
			<form action="<%if(rs==null){out.write("test.jsp");}else{out.write("Car_Change.jsp");}%>" method="post" enctype="multipart/form-data" name="orderform">
			<table width="480" border="0" cellspacing="0" cellpadding="0" id="chengyongche">
              <tr>
                <td height="15" colspan="2"><input type="hidden" name="hiddenField" value="乘用车"><%if(rs!=null){%><input type="hidden" name="hiddenField" value="<%=logo%>"><%}%></td>
              </tr>
              <tr class="bottm">
                <td width="285" height="20" class="bottm"><div align="left">&nbsp;<a href="#" style="color:#000000 " onClick="ShowTR(jibenziliao,jpg1)"><img id="jpg1" src="Image/jia.gif" width="10" height="10" border="0"> 基 本 资 料</a></div></td>
                <td width="195"></td>
              </tr>
              <tr>
                <td height="20" colspan="2"><div align="left">
                    <table width="480" border="0" cellspacing="0" cellpadding="0" id="jibenziliao">
                      <tr>
                        <td height="15">&nbsp;</td>
                        <td height="15">&nbsp;</td>
                        <td height="15">&nbsp;</td>
                        <td height="15">&nbsp;</td>
                      </tr>
                      <tr>
                        <td width="70" height="23"><div align="right">车辆品牌：</div></td>
                        <td width="169" height="23"><input name="品牌" type="text" class="wenbenkuang" value="<%if(rs!=null){ rs.beforeFirst(); if(rs.next()){out.write(rs.getString("品牌"));}}%>"></td>
                        <td width="70" height="23"><div align="right">车辆型号：</div></td>
                        <td width="171" height="23"><input name="型号" type="text" class="wenbenkuang" value="<%if(rs!=null){ rs.beforeFirst(); if(rs.next()){out.write(rs.getString("型号"));}}%>"></td>
                      </tr>
                      <tr>
                        <td height="23"><div align="right">适用人群：</div></td>
                        <td height="23"><input name="适用人群" type="text" class="wenbenkuang" value="<%if(rs!=null){ rs.beforeFirst(); if(rs!=null&&rs.next()){out.write(rs.getString("适用人群"));}}%>"></td>
                        <td height="23"><div align="right">参考价格：</div></td>
                        <td height="23"><input name="售价" type="text" class="wenbenkuang" size="12" value="<%if(rs!=null){ rs.beforeFirst(); if(rs!=null&&rs.next()){out.write(rs.getString("售价"));}}%>">
              （万元）</td>
                      </tr>
                      <tr>
                        <td height="23"><div align="right">文字简介：</div></td>
                        <td height="23" colspan="3" rowspan="3"><div align="left">
                            <textarea name="文字简介" cols="65" rows="4" class="wenbenkuang"><%if(rs!=null){ rs.beforeFirst(); if(rs!=null&&rs.next()){out.write(rs.getString("文字简介"));}}%></textarea>
                        </div></td>
                      </tr>
                      <tr>
                        <td height="23">&nbsp;</td>
                      </tr>
                      <tr>
                        <td height="23">&nbsp;</td>
                      </tr>
                      <tr>
                        <td height="23"><div align="right">图片简介：</div></td>
                        <td height="23" colspan="3"><input name="简介图片" type="text" class="wenbenkuang" size="35" value="<%if(rs!=null){ rs.beforeFirst(); if(rs!=null&&rs.next()){out.write(rs.getString("简介图片"));}}%>"></td>
                      </tr>
                      <tr>
                        <td height="23"><div align="right">颜色：</div></td>
                        <td height="23"><input name="颜色" type="text" class="wenbenkuang" value="<%if(rs!=null){ rs.beforeFirst(); if(rs!=null&&rs.next()){out.write(rs.getString("颜色"));}}%>"></td>
                        <td height="23">&nbsp;</td>
                        <td height="23"><div align="center"> </div></td>
                      </tr>
                      <tr>
                        <td height="23"><div align="right">对应图片：</div></td>
                        <td height="23" colspan="3"><input name="颜色图片" type="text" class="wenbenkuang" size="35" value="<%if(rs!=null){ rs.beforeFirst(); if(rs!=null&&rs.next()){out.write(rs.getString("颜色图片"));}}%>">
                        </td>
                      </tr>
                      <tr>
                        <td height="23"><div align="right">外观：</div></td>
                        <td height="23" colspan="3"><input name="外观" type="text" class="wenbenkuang" size="60" value="<%if(rs!=null){ rs.beforeFirst(); if(rs!=null&&rs.next()){out.write(rs.getString("外观"));}}%>"></td>
                      </tr>
                      <tr>
                        <td height="23"><div align="right">对应图片：</div></td>
                        <td height="23" colspan="3"><input name="外观图片" type="text" class="wenbenkuang" size="35" value="<%if(rs!=null){ rs.beforeFirst(); if(rs!=null&&rs.next()){out.write(rs.getString("外观图片"));}}%>">
                        </td>
                      </tr>
                      <tr>
                        <td height="23"><div align="right">内饰：</div></td>
                        <td height="23" colspan="3"><input name="内饰" type="text" class="wenbenkuang" size="60" value="<%if(rs!=null){ rs.beforeFirst(); if(rs!=null&&rs.next()){out.write(rs.getString("内饰"));}}%>"></td>
                      </tr>
                      <tr>
                        <td height="23"><div align="right">对应图片：</div></td>
                        <td height="23" colspan="3"><input name="内饰图片" type="text" class="wenbenkuang" size="35" value="<%if(rs!=null){ rs.beforeFirst(); if(rs!=null&&rs.next()){out.write(rs.getString("内饰图片"));}}%>">
                        </td>
                      </tr>
                      <tr>
                        <td height="23"><div align="right">配置：</div></td>
                        <td height="23" colspan="3"><input name="配置" type="text" class="wenbenkuang" size="60" value="<%if(rs!=null){ rs.beforeFirst(); if(rs!=null&&rs.next()){out.write(rs.getString("配置"));}}%>"></td>
                      </tr>
                      <tr>
                        <td height="23"><div align="right">对应图片：</div></td>
                        <td height="23" colspan="3"><input name="配置图片" type="text" class="wenbenkuang" size="35" value="<%if(rs!=null){ rs.beforeFirst(); if(rs!=null&&rs.next()){out.write(rs.getString("配置图片"));}}%>">
                        </td>
                      </tr>
                      <tr>
                        <td height="15" colspan="4" class="bottm">&nbsp;</td>
                      </tr>
                      <tr>
                        <td height="15" colspan="4">&nbsp;</td>
                      </tr>
                    </table>
                    <script language="javascript">jibenziliao.style.display="none";</script>
                </div></td>
              </tr>
              <tr>
                <td height="20" class="bottm"><div align="left">&nbsp;<a href="#" style="color:#000000 " onClick="ShowTR(jibencanshu,jpg2)"><img src="Image/jia.gif" id="jpg2" width="10" height="10" border="0"> 基 本 参 数</a></div></td>
                <td height="20" class="bottm"><div align="center"></div></td>
              </tr>
              <tr>
                <td height="20" colspan="2"><div align="left">
                    <table width="480" border="0" cellspacing="0" cellpadding="0" id="jibencanshu">
                      <tr>
                        <td height="15">&nbsp;</td>
                        <td height="15">&nbsp;</td>
                        <td height="15">&nbsp;</td>
                        <td height="15">&nbsp;</td>
                      </tr>
                      <tr>
                        <td width="70" height="23"><div align="right">最高车速：</div></td>
                        <td width="169" height="23"><input name="最高车速" type="text" class="wenbenkuang" value="<%if(rs!=null){ rs.beforeFirst(); if(rs!=null&&rs.next()){out.write(rs.getString("最高车速"));}}%>"></td>
                        <td width="70" height="23"><div align="right">制动距离：</div></td>
                        <td width="171" height="23"><input name="制动距离" type="text" class="wenbenkuang" value="<%if(rs!=null){ rs.beforeFirst(); if(rs!=null&&rs.next()){out.write(rs.getString("制动距离"));}}%>"></td>
                      </tr>
                      <tr>
                        <td height="23"><div align="right">城市油耗：</div></td>
                        <td height="23"><input name="城市油耗" type="text" class="wenbenkuang" value="<%if(rs!=null){ rs.beforeFirst(); if(rs!=null&&rs.next()){out.write(rs.getString("城市油耗"));}}%>"></td>
                        <td height="23"><div align="right">等速油耗：</div></td>
                        <td height="23"><input name="等速油耗" type="text" class="wenbenkuang" size="12" value="<%if(rs!=null){ rs.beforeFirst(); if(rs!=null&&rs.next()){out.write(rs.getString("等速油耗"));}}%>">
                        </td>
                      </tr>
                      <tr>
                        <td height="23" colspan="4"><div align="right"></div>
                            <div align="left">
                              <table width="480" height="25" border="0" cellpadding="0" cellspacing="0">
                                <tr>
                                  <td width="114"><div align="right">0-100KM加速时间：</div></td>
                                  <td width="366"><input name="0-100KM加速时间" type="text" class="wenbenkuang" value="<%if(rs!=null){ rs.beforeFirst(); if(rs!=null&&rs.next()){out.write(rs.getString("0-100KM加速时间"));}}%>"></td>
                                </tr>
                              </table>
                          </div></td>
                      </tr>
                      <tr>
                        <td height="15" colspan="4" class="bottm">&nbsp;</td>
                      </tr>
                      <tr>
                        <td height="15" colspan="4">&nbsp;</td>
                      </tr>
                    </table>
                    <script language="javascript">jibencanshu.style.display="none";</script>
                </div></td>
              </tr>
              <tr>
                <td height="20" class="bottm"><div align="left">&nbsp;<a href="#" style="color:#000000 " onClick="ShowTR(waixingcanshu,jpg3)"><img src="Image/jia.gif" id="jpg3" width="10" height="10" border="0"> 外 形 参 数</a></div></td>
                <td height="20" class="bottm"><div align="center"></div></td>
              </tr>
              <tr>
                <td height="20" colspan="2"><div align="left">
                    <table width="480" border="0" cellspacing="0" cellpadding="0" id="waixingcanshu">
                      <tr>
                        <td height="15">&nbsp;</td>
                        <td width="135" height="15">&nbsp;</td>
                        <td width="90" height="15">&nbsp;</td>
                        <td width="165" height="15">&nbsp;</td>
                      </tr>
                      <tr>
                        <td width="90" height="23"><div align="right">外廓尺寸：</div></td>
                        <td height="23" colspan="3"><input name="外廓尺寸" type="text" class="wenbenkuang" size="30" value="<%if(rs!=null){ rs.beforeFirst(); if(rs!=null&&rs.next()){out.write(rs.getString("外廓尺寸"));}}%>">
              长 * 宽 * 高</td>
                      </tr>
                      <tr>
                        <td height="23"><div align="right">最小离地间隙：</div></td>
                        <td height="23"><input name="最小离地间隙" type="text" class="wenbenkuang" size="12" value="<%if(rs!=null){ rs.beforeFirst(); if(rs!=null&&rs.next()){out.write(rs.getString("最小离地间隙"));}}%>"></td>
                        <td height="23"><div align="right">最小转弯直径：</div></td>
                        <td height="23"><input name="最小转弯直径" type="text" class="wenbenkuang" size="12" value="<%if(rs!=null){ rs.beforeFirst(); if(rs!=null&&rs.next()){out.write(rs.getString("最小转弯直径"));}}%>"></td>
                      </tr>
                      <tr>
                        <td height="23"><div align="right">汽车自重：</div></td>
                        <td height="0"><div align="left">
                            <input name="汽车自重" type="text" class="wenbenkuang" size="12" value="<%if(rs!=null){ rs.beforeFirst(); if(rs!=null&&rs.next()){out.write(rs.getString("汽车自重"));}}%>">
                        </div></td>
                        <td height="0"><div align="right">车门数：</div></td>
                        <td height="0"><input name="车门数" type="text" class="wenbenkuang" size="12" value="<%if(rs!=null){ rs.beforeFirst(); if(rs!=null&&rs.next()){out.write(rs.getString("车门数"));}}%>"></td>
                      </tr>
                      <tr>
                        <td height="23"><div align="right">座位数：</div></td>
                        <td height="0"><input name="座位数" type="text" class="wenbenkuang" size="12" value="<%if(rs!=null){ rs.beforeFirst(); if(rs!=null&&rs.next()){out.write(rs.getString("座位数"));}}%>"></td>
                        <td height="0"><div align="right">安全气囊：</div></td>
                        <td height="0"><input name="安全气囊" type="text" class="wenbenkuang" size="12" value="<%if(rs!=null){ rs.beforeFirst(); if(rs!=null&&rs.next()){out.write(rs.getString("安全气囊"));}}%>"></td>
                      </tr>
                      <tr>
                        <td height="23"><div align="right">行李箱容积：</div></td>
                        <td height="23"><input name="行李箱容积" type="text" class="wenbenkuang" size="12" value="<%if(rs!=null){ rs.beforeFirst(); if(rs!=null&&rs.next()){out.write(rs.getString("行李箱容积"));}}%>"></td>
                        <td height="23"><div align="right">燃油箱容积：</div></td>
                        <td height="23"><input name="燃油箱容积" type="text" class="wenbenkuang" size="12" value="<%if(rs!=null){ rs.beforeFirst(); if(rs!=null&&rs.next()){out.write(rs.getString("燃油箱容积"));}}%>"></td>
                      </tr>
                      <tr>
                        <td height="23"><div align="right">风阻系数：</div></td>
                        <td height="23"><input name="风阻系数" type="text" class="wenbenkuang" size="12" value="<%if(rs!=null){ rs.beforeFirst(); if(rs!=null&&rs.next()){out.write(rs.getString("风阻系数"));}}%>"></td>
                        <td height="23">&nbsp;</td>
                        <td height="23">&nbsp;</td>
                      </tr>
                      <tr>
                        <td height="15" colspan="4" class="bottm">&nbsp;</td>
                      </tr>
                      <tr>
                        <td height="15" colspan="4">&nbsp;</td>
                      </tr>
                    </table>
                    <script language="javascript">waixingcanshu.style.display="none";</script>
                </div></td>
              </tr>
              <tr>
                <td height="20" class="bottm"><div align="left">&nbsp;<a href="#" style="color:#000000 " onClick="ShowTR(dipancanshu,jpg4)"><img src="Image/jia.gif" id="jpg4" width="10" height="10" border="0"> 底 盘 参 数</a></div></td>
                <td height="20" class="bottm"><div align="center"></div></td>
              </tr>
              <tr>
                <td height="20" colspan="2"><div align="left">
                    <table width="480" border="0" cellspacing="0" cellpadding="0" id="dipancanshu">
                      <tr>
                        <td height="15">&nbsp;</td>
                        <td width="123" height="15">&nbsp;</td>
                        <td width="101" height="15">&nbsp;</td>
                        <td width="158" height="15">&nbsp;</td>
                      </tr>
                      <tr>
                        <td width="98" height="23"><div align="right">变速器型式：</div></td>
                        <td height="23" colspan="3"><input name="变速器型式" type="text" class="wenbenkuang" size="60" value="<%if(rs!=null){ rs.beforeFirst(); if(rs!=null&&rs.next()){out.write(rs.getString("变速器型式"));}}%>"></td>
                      </tr>
                      <tr>
                        <td height="23"><div align="right">轮胎类型及规格：</div></td>
                        <td height="23" colspan="3"><input name="轮胎类型及规格" type="text" class="wenbenkuang" size="60" value="<%if(rs!=null){ rs.beforeFirst(); if(rs!=null&&rs.next()){out.write(rs.getString("轮胎类型及规格"));}}%>"></td>
                      </tr>
                      <tr>
                        <td height="23"><div align="right">制动装置型式：</div></td>
                        <td height="0" colspan="3"><input name="制动装置型式" type="text" class="wenbenkuang" size="60" value="<%if(rs!=null){ rs.beforeFirst(); if(rs!=null&&rs.next()){out.write(rs.getString("制动装置型式"));}}%>"></td>
                      </tr>
                      <tr>
                        <td height="23"><div align="right">转向系统：</div></td>
                        <td height="0" colspan="3"><input name="转向系统" type="text" class="wenbenkuang" size="60" value="<%if(rs!=null){ rs.beforeFirst(); if(rs!=null&&rs.next()){out.write(rs.getString("转向系统"));}}%>"></td>
                      </tr>
                      <tr>
                        <td height="23"><div align="right">悬架形式：</div></td>
                        <td height="23" colspan="3"><input name="悬架形式" type="text" class="wenbenkuang" size="60" value="<%if(rs!=null){ rs.beforeFirst(); if(rs!=null&&rs.next()){out.write(rs.getString("悬架形式"));}}%>"></td>
                      </tr>
                      <tr>
                        <td height="15" colspan="4" class="bottm">&nbsp;</td>
                      </tr>
                      <tr>
                        <td height="15" colspan="4">&nbsp;</td>
                      </tr>
                    </table>
                    <script language="javascript">dipancanshu.style.display="none";</script>
                </div></td>
              </tr>
              <tr>
                <td height="20" class="bottm"><div align="left">&nbsp;<a href="#" style="color:#000000 " onClick="ShowTR(fadongjicanshu,jpg5)"><img src="Image/jia.gif" id="jpg5" width="10" height="10" border="0"> 发 动 机 参 数</a></div></td>
                <td height="20" class="bottm"><div align="center"></div></td>
              </tr>
              <tr>
                <td height="20" colspan="2"><div align="left">
                    <table width="480" border="0" cellspacing="0" cellpadding="0" id="fadongjicanshu">
                      <tr>
                        <td height="15">&nbsp;</td>
                        <td width="139" height="15">&nbsp;</td>
                        <td width="85" height="15">&nbsp;</td>
                        <td width="158" height="15">&nbsp;</td>
                      </tr>
                      <tr>
                        <td width="98" height="23"><div align="right">发动机名称：</div></td>
                        <td height="23"><input name="发动机名称" type="text" class="wenbenkuang" size="12" value="<%if(rs!=null){ rs.beforeFirst(); if(rs!=null&&rs.next()){out.write(rs.getString("发动机名称"));}}%>"></td>
                        <td height="23"><div align="right">发动机位置：</div></td>
                        <td height="23"><input name="发动机位置" type="text" class="wenbenkuang" size="12" value="<%if(rs!=null){ rs.beforeFirst(); if(rs!=null&&rs.next()){out.write(rs.getString("发动机位置"));}}%>"></td>
                      </tr>
                      <tr>
                        <td height="23"><div align="right">发动机型式：</div></td>
                        <td height="23" colspan="3"><input name="发动机型式" type="text" class="wenbenkuang" size="45" value="<%if(rs!=null){ rs.beforeFirst(); if(rs!=null&&rs.next()){out.write(rs.getString("发动机型式"));}}%>"></td>
                      </tr>
                      <tr>
                        <td height="23"><div align="right">汽缸数：</div></td>
                        <td height="0"><input name="汽缸数" type="text" class="wenbenkuang" size="12" value="<%if(rs!=null){ rs.beforeFirst(); if(rs!=null&&rs.next()){out.write(rs.getString("汽缸数"));}}%>"></td>
                        <td height="0"><div align="right">排量：</div></td>
                        <td height="0"><input name="排量" type="text" class="wenbenkuang" size="12" value="<%if(rs!=null){ rs.beforeFirst(); if(rs!=null&&rs.next()){out.write(rs.getString("排量"));}}%>"></td>
                      </tr>
                      <tr>
                        <td height="23"><div align="right">最大功率：</div></td>
                        <td height="0"><input name="最大功率" type="text" class="wenbenkuang" size="12" value="<%if(rs!=null){ rs.beforeFirst(); if(rs!=null&&rs.next()){out.write(rs.getString("最大功率"));}}%>"></td>
                        <td height="0"><div align="right">最大扭矩：</div></td>
                        <td height="0"><input name="最大扭矩" type="text" class="wenbenkuang" size="12" value="<%if(rs!=null){ rs.beforeFirst(); if(rs!=null&&rs.next()){out.write(rs.getString("最大扭矩"));}}%>"></td>
                      </tr>
                      <tr>
                        <td height="23"><div align="right">点火方式：</div></td>
                        <td height="23"><input name="点火方式" type="text" class="wenbenkuang" size="12" value="<%if(rs!=null){ rs.beforeFirst(); if(rs!=null&&rs.next()){out.write(rs.getString("点火方式"));}}%>"></td>
                        <td height="23"><div align="right">汽油型号：</div></td>
                        <td height="23"><input name="汽油型号" type="text" class="wenbenkuang" size="12" value="<%if(rs!=null){ rs.beforeFirst(); if(rs!=null&&rs.next()){out.write(rs.getString("汽油型号"));}}%>"></td>
                      </tr>
                      <tr>
                        <td height="15" colspan="4" class="bottm">&nbsp;</td>
                      </tr>
                      <tr>
                        <td height="15" colspan="4">&nbsp;</td>
                      </tr>
                    </table>
                    <script language="javascript">fadongjicanshu.style.display="none";</script>
                </div></td>
              </tr>
              <tr>
                <td height="20" class="bottm"><div align="left">&nbsp;<a href="#" style="color:#000000 " onClick="ShowTR(qitacanshu,jpg6)"><img src="Image/jia.gif" id="jpg6" width="10" height="10" border="0"> 其 他 参 数</a></div></td>
                <td height="20" class="bottm"><div align="center"></div></td>
              </tr>
              <tr>
                <td height="20" colspan="2"><div align="left">
                    <table width="480" border="0" cellspacing="0" cellpadding="0" id="qitacanshu">
                      <tr>
                        <td width="480" height="15" class="bottm"><textarea name="其他参数" cols="77" rows="4" class="wenbenkuang"><%if(rs!=null){ rs.beforeFirst(); if(rs!=null&&rs.next()){out.write(rs.getString("其他参数"));}}%></textarea></td>
                      </tr>
                      <tr>
                        <td height="15">&nbsp;</td>
                      </tr>
                    </table>
                    <script language="javascript">qitacanshu.style.display="none";</script>
                </div></td>
              </tr>
              <tr>
                <td height="20" class="bottm"><div align="left">&nbsp;<a href="#" style="color:#000000 " onClick="ShowTR(qitashuoming,jpg7)"><img src="Image/jia.gif" id="jpg7" width="10" height="10" border="0"> 其 他 说 明</a></div></td>
                <td height="20" class="bottm"><div align="center"></div></td>
              </tr>
              <tr>
                <td height="20" colspan="2"><div align="left" id="qitashuoming">
                    <textarea name="其他说明" cols="77" rows="4" class="wenbenkuang"><%if(rs!=null){ rs.beforeFirst(); if(rs!=null&&rs.next()){out.write(rs.getString("其他说明"));}}%></textarea>
                </div></td>
              </tr>
              <script language="javascript">qitashuoming.style.display="none";</script>
              <tr>
                <td height="20" class="bottm"><div align="left">&nbsp;<a href="#" style="color:#000000 " onClick="ShowTR(biaozhunzhuangbei,jpg8)"><img src="Image/jia.gif" id="jpg8" width="10" height="10" border="0"> 标 准 装 备</a></div></td>
                <td height="20" class="bottm"><div align="center"></div></td>
              </tr>
              <tr>
                <td height="20" colspan="2"><div align="left" id="biaozhunzhuangbei">
                    <textarea name="标准装备" cols="77" rows="4" class="wenbenkuang"><%if(rs!=null){ rs.beforeFirst(); if(rs!=null&&rs.next()){out.write(rs.getString("标准装备"));}}%></textarea>
                </div></td>
              </tr>
              <script language="javascript">biaozhunzhuangbei.style.display="none";</script>
              <tr>
                <td height="20" class="bottm"><div align="left">&nbsp;<a href="#" style="color:#000000 " onClick="ShowTR(xuanzhuangzhuangbei,jpg9)"><img src="Image/jia.gif" id="jpg9" width="10" height="10" border="0"> 选 装 装 备</a></div></td>
                <td height="20" class="bottm"><div align="center"></div></td>
              </tr>
              <tr>
                <td height="20" colspan="2"><div align="left" id="xuanzhuangzhuangbei">
                    <textarea name="选装装备" cols="77" rows="4" class="wenbenkuang"><%if(rs!=null){ rs.beforeFirst(); if(rs!=null&&rs.next()){out.write(rs.getString("选装装备"));}}%></textarea>
                </div></td>
              </tr>
              <script language="javascript">xuanzhuangzhuangbei.style.display="none";</script>
            </table></form></td>
          </tr>
          <tr valign="bottom">
            <td width="480" height="30" valign="middle">
              <div align="center">
                <input name="Submit2" type="button" class="buttons" value="<%if(rs!=null){%>  修  改  <%}else{out.write("  添  加  ");}%>" onClick="checks()">
                <input name="Submit" type="button" class="buttons" value="  重  置  " onClick="javascript:location.reload()">
                  <input name="Submit3" type="button" class="buttons" value="  返  回  " onClick="javascript:window.close()">
              </div></td>
            </tr>
        </table></td>
      </tr>
    </table></td>
  </tr>
</table>
</body>
</html>
