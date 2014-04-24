<%@ page contentType="text/html; charset=gb2312" import="java.sql.*"%>
<%@ page import="java.io.*" %>
<% request.setCharacterEncoding("gb2312");%>
<html>
<head>
<title><%if(request.getParameter("id")==null){%>车 辆 数 据 添 加<%}else{%>车 辆 数 据 修 改<%}%></title>
</head>
<link rel="stylesheet" href="Css/style.css">
<jsp:useBean id="cross" scope="page" class="cars.CrossTable" />
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
%><script>

function hiddenall(objTr){
	jibenziliao.style.display = "none";
	jibencanshu.style.display = "none";
	waixingcanshu.style.display = "none";
	dipancanshu.style.display = "none";
	fadongjicanshu.style.display = "none";
	shibiema.style.display ="none";
	}
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
		break;
	}
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
              <tr><form name="type">
                <td height="20">
                  <div align="left">
				  <%if(request.getParameter("type")==null){%>
                    <select name="selects" class="wenbenkuang" onchange="change()">
                      <option value="商用车" selected>商用车</option>
                      <option value="乘用车">乘用车</option>
                    </select><%}%>
                     </div></td></form>
                <td><div align="right"><a href="#">确认数据添加时，请将所有树状表单收起</a></div></td>
              </tr>
            </table>
              </td>
          </tr>
          <tr valign="bottom">
            <td height="430" valign="top">
			<form action="<%if(rs==null){out.write("test.jsp");}else{out.write("Car_Change.jsp");}%>" method="post" enctype="multipart/form-data" name="orderform">
			  <table width="480" border="0" cellspacing="0" cellpadding="0" id="shangyongche">
                <tr>
                  <td height="15" colspan="2"><input type="hidden" name="hiddenField" value="商用车"><%if(rs!=null){%><input type="hidden" name="hiddenField" value="<%=logo%>"><%}%></td>
                </tr>
                <tr class="bottm">
                  <td width="285" height="20" class="bottm"><div align="left">&nbsp;<a href="#" style="color:#000000 " onClick="ShowTR(jibenziliao,jpg1)"><img id="jpg1" src="Image/jia.gif" width="10" height="10" border="0"> 基 本 资 料</a></div></td>
                  <td width="195"><div align="center" id="count1"></div></td>
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
                          <td width="169" height="23"><input name="品牌" type="text" class="wenbenkuang"  value="<%if(rs!=null){ rs.beforeFirst(); if(rs.next()){out.write(rs.getString("品牌"));}}%>"></td>
                          <td width="70" height="23"><div align="right">车辆型号：</div></td>
                          <td width="171" height="23"><input name="型号" type="text" class="wenbenkuang" value="<%if(rs!=null){ rs.beforeFirst(); if(rs.next()){out.write(rs.getString("型号"));}}%>"></td>
                        </tr>
                        <tr>
                          <td height="23"><div align="right">适用人群：</div></td>
                          <td height="23"><input name="适用人群" type="text" class="wenbenkuang" value="<%if(rs!=null){ rs.beforeFirst(); if(rs.next()){out.write(rs.getString("适用人群"));}}%>"></td>
                          <td height="23"><div align="right">参考价格：</div></td>
                          <td height="23"><input name="售价" type="text" class="wenbenkuang" size="12" value="<%if(rs!=null){ rs.beforeFirst(); if(rs.next()){out.write(rs.getString("售价"));}}%>">
              （万元）</td>
                        </tr>
                        <tr>
                          <td height="23"><div align="right">文字简介：</div></td>
                          <td height="23" colspan="3" rowspan="3"><div align="left">
                              <textarea name="文字简介" cols="65" rows="4" class="wenbenkuang"><%if(rs!=null){ rs.beforeFirst(); if(rs.next()){out.write(rs.getString("文字简介"));}}%></textarea>
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
                          <td height="23" colspan="3"><input name="简介图片" type="text" class="wenbenkuang" size="35" value="<%if(rs!=null){ rs.beforeFirst(); if(rs.next()){out.write(rs.getString("简介图片"));}}%>"></td>
                        </tr>
                        <tr>
                          <td height="23"><div align="right">颜色：</div></td>
                          <td height="23"><input name="颜色" type="text" class="wenbenkuang" value="<%if(rs!=null){ rs.beforeFirst(); if(rs.next()){out.write(rs.getString("颜色"));}}%>"></td>
                          <td height="23">&nbsp;</td>
                          <td height="23"><div align="center"> </div></td>
                        </tr>
                        <tr>
                          <td height="23"><div align="right">对应图片：</div></td>
                          <td height="23" colspan="3"><input name="颜色图片" type="text" class="wenbenkuang" value="<%if(rs!=null){ rs.beforeFirst(); if(rs.next()){out.write(rs.getString("颜色图片"));}}%>" size="35">
                          </td>
                        </tr>
                        <tr>
                          <td height="23"><div align="right">外观：</div></td>
                          <td height="23" colspan="3"><input name="外观" type="text" class="wenbenkuang" value="<%if(rs!=null){ rs.beforeFirst(); if(rs.next()){out.write(rs.getString("外观"));}}%>" size="60"></td>
                        </tr>
                        <tr>
                          <td height="23"><div align="right">对应图片：</div></td>
                          <td height="23" colspan="3"><input name="外观图片" type="text" class="wenbenkuang" value="<%if(rs!=null){ rs.beforeFirst(); if(rs.next()){out.write(rs.getString("外观图片"));}}%>" size="35">
                          </td>
                        </tr>
                        <tr>
                          <td height="23"><div align="right">内饰：</div></td>
                          <td height="23" colspan="3"><input name="内饰" type="text" class="wenbenkuang" value="<%if(rs!=null){ rs.beforeFirst(); if(rs.next()){out.write(rs.getString("内饰"));}}%>" size="60"></td>
                        </tr>
                        <tr>
                          <td height="23"><div align="right">对应图片：</div></td>
                          <td height="23" colspan="3"><input name="内饰图片" type="text" class="wenbenkuang" value="<%if(rs!=null){ rs.beforeFirst(); if(rs.next()){out.write(rs.getString("内饰图片"));}}%>" size="35">
                          </td>
                        </tr>
                        <tr>
                          <td height="23"><div align="right">配置：</div></td>
                          <td height="23" colspan="3"><input name="配置" type="text" class="wenbenkuang" value="<%if(rs!=null){ rs.beforeFirst(); if(rs.next()){out.write(rs.getString("配置"));}}%>" size="60"></td>
                        </tr>
                        <tr>
                          <td height="23"><div align="right">对应图片：</div></td>
                          <td height="23" colspan="3"><input name="配置图片" type="text" class="wenbenkuang" value="<%if(rs!=null){ rs.beforeFirst(); if(rs.next()){out.write(rs.getString("配置图片"));}}%>" size="35">
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
                          <td width="155" height="23"><input name="最高车速" type="text" class="wenbenkuang" value="<%if(rs!=null){ rs.beforeFirst(); if(rs.next()){out.write(rs.getString("最高车速"));}}%>"></td>
                          <td width="84" height="23"><div align="right">驱动型式：</div></td>
                          <td width="171" height="23"><input name="驱动形式" type="text" class="wenbenkuang" value="<%if(rs!=null){ rs.beforeFirst(); if(rs.next()){out.write(rs.getString("驱动形式"));}}%>"></td>
                        </tr>
                        <tr>
                          <td height="23"><div align="right">制动距离：</div></td>
                          <td height="23"><input name="制动距离" type="text" class="wenbenkuang" value="<%if(rs!=null){ rs.beforeFirst(); if(rs.next()){out.write(rs.getString("制动距离"));}}%>"></td>
                          <td height="23"><div align="right">最小转弯直径：</div></td>
                          <td height="23"><input name="最小转弯直径" type="text" class="wenbenkuang" value="<%if(rs!=null){ rs.beforeFirst(); if(rs.next()){out.write(rs.getString("最小转弯直径"));}}%>" size="12">
                          </td>
                        </tr>
                        <tr>
                          <td height="23" colspan="4"><div align="right"></div>
                              <div align="left">
                                <table width="480" height="25" border="0" cellpadding="0" cellspacing="0">
                                  <tr>
                                    <td width="76"><div align="right">最大爬坡度：</div></td>
                                    <td width="404"><input name="最大爬坡度" type="text" class="wenbenkuang" value="<%if(rs!=null){ rs.beforeFirst(); if(rs.next()){out.write(rs.getString("最大爬坡度"));}}%>"></td>
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
                          <td width="125" height="15">&nbsp;</td>
                          <td width="99" height="15">&nbsp;</td>
                          <td width="156" height="15">&nbsp;</td>
                        </tr>
                        <tr>
                          <td width="100" height="23"><div align="right">外廓尺寸：</div></td>
                          <td height="23" colspan="3"><input name="外形尺寸" type="text" class="wenbenkuang" value="<%if(rs!=null){ rs.beforeFirst(); if(rs.next()){out.write(rs.getString("外形尺寸"));}}%>" size="30">
              长 * 宽 * 高</td>
                        </tr>
                        <tr>
                          <td height="23"><div align="right">车厢内部尺寸：</div></td>
                          <td height="23" colspan="3"><input name="车厢内部尺寸" type="text" class="wenbenkuang" id="车厢内部尺寸" value="<%if(rs!=null){ rs.beforeFirst(); if(rs.next()){out.write(rs.getString("车厢内部尺寸"));}}%>" size="30">
              长 * 宽 * 高</td>
                        </tr>
                        <tr>
                          <td height="23"><div align="right">载重量：</div></td>
                          <td height="23"><input name="载重量" type="text" class="wenbenkuang" id="载重量" value="<%if(rs!=null){ rs.beforeFirst(); if(rs.next()){out.write(rs.getString("载重量"));}}%>" size="12"></td>
                          <td height="23"><div align="right">汽车自重：</div></td>
                          <td height="23"><input name="汽车自重" type="text" class="wenbenkuang" id="汽车自重" value="<%if(rs!=null){ rs.beforeFirst(); if(rs.next()){out.write(rs.getString("汽车自重"));}}%>" size="12"></td>
                        </tr>
                        <tr>
                          <td height="23"><div align="right">载荷分配（空）：</div></td>
                          <td height="0"><div align="left">
                              <input name="载荷分配（空载）" type="text" class="wenbenkuang" id="载荷分配（空载）" value="<%if(rs!=null){ rs.beforeFirst(); if(rs.next()){out.write(rs.getString("载荷分配（空载）"));}}%>" size="12">
                          </div></td>
                          <td height="0"><div align="right">载荷分配（满）：</div></td>
                          <td height="0"><input name="载荷分配（满载）" type="text" class="wenbenkuang" id="载荷分配（满载）" value="<%if(rs!=null){ rs.beforeFirst(); if(rs.next()){out.write(rs.getString("载荷分配（满载）"));}}%>"size="12"></td>
                        </tr>
                        <tr>
                          <td height="23"><div align="right">满载总重：</div></td>
                          <td height="0"><input name="满载总重" type="text" class="wenbenkuang" id="满载总重" value="<%if(rs!=null){ rs.beforeFirst(); if(rs.next()){out.write(rs.getString("满载总重"));}}%>" size="12"></td>
                          <td height="0"><div align="right">悬架：</div></td>
                          <td height="0"><input name="悬架" type="text" class="wenbenkuang" id="悬架" value="<%if(rs!=null){ rs.beforeFirst(); if(rs.next()){out.write(rs.getString("悬架"));}}%>" size="12"></td>
                        </tr>
                        <tr>
                          <td height="23"><div align="right">最小离地间隙：</div></td>
                          <td height="23"><input name="最小离地间隙（mm）" type="text" class="wenbenkuang" id="最小离地间隙（mm）" value="<%if(rs!=null){ rs.beforeFirst(); if(rs.next()){out.write(rs.getString("最小离地间隙（mm）"));}}%>" size="12"></td>
                          <td height="23"><div align="right">轴距：</div></td>
                          <td height="23"><input name="轴距" type="text" class="wenbenkuang" id="轴距" value="<%if(rs!=null){ rs.beforeFirst(); if(rs.next()){out.write(rs.getString("轴距"));}}%>" size="12"></td>
                        </tr>
                        <tr>
                          <td height="23"><div align="right">轮距：</div></td>
                          <td height="23"><input name="轮距" type="text" class="wenbenkuang" id="轮距" value="<%if(rs!=null){ rs.beforeFirst(); if(rs.next()){out.write(rs.getString("轮距"));}}%>" size="12"></td>
                          <td height="23"><div align="right">油箱容积：</div></td>
                          <td height="23"><span class="bottm">
                            <input name="油箱容积" type="text" class="wenbenkuang" id="油箱容积" value="<%if(rs!=null){ rs.beforeFirst(); if(rs.next()){out.write(rs.getString("油箱容积"));}}%>" size="12">
                          </span></td>
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
                          <td height="23" colspan="3"><input name="变速器型式" type="text" class="wenbenkuang" value="<%if(rs!=null){ rs.beforeFirst(); if(rs.next()){out.write(rs.getString("变速器型式"));}}%>" size="60"></td>
                        </tr>
                        <tr>
                          <td height="23"><div align="right">离合器型式：</div></td>
                          <td height="23" colspan="3"><input name="离合器型式" type="text" class="wenbenkuang" id="离合器型式" value="<%if(rs!=null){ rs.beforeFirst(); if(rs.next()){out.write(rs.getString("离合器型式"));}}%>" size="60"></td>
                        </tr>
                        <tr>
                          <td height="23"><div align="right">传动轴：</div></td>
                          <td height="23" colspan="3"><input name="传动轴" type="text" class="wenbenkuang" id="传动轴" value="<%if(rs!=null){ rs.beforeFirst(); if(rs.next()){out.write(rs.getString("传动轴"));}}%>" size="60"></td>
                        </tr>
                        <tr>
                          <td height="23"><div align="right">后桥型式：</div></td>
                          <td height="23" colspan="3"><input name="后桥型式" type="text" class="wenbenkuang" id="后桥型式" value="<%if(rs!=null){ rs.beforeFirst(); if(rs.next()){out.write(rs.getString("后桥型式"));}}%>" size="60"></td>
                        </tr>
                        <tr>
                          <td height="23"><div align="right">车架：</div></td>
                          <td height="23" colspan="3"><input name="车架" type="text" class="wenbenkuang" id="车架" value="<%if(rs!=null){ rs.beforeFirst(); if(rs.next()){out.write(rs.getString("车架"));}}%>" size="60"></td>
                        </tr>
                        <tr>
                          <td height="23"><div align="right">前轴：</div></td>
                          <td height="23" colspan="3"><input name="前轴" type="text" class="wenbenkuang" id="前轴" value="<%if(rs!=null){ rs.beforeFirst(); if(rs.next()){out.write(rs.getString("前轴"));}}%>" size="60"></td>
                        </tr>
                        <tr>
                          <td height="23"><div align="right">备胎升降器：</div></td>
                          <td height="23" colspan="3"><input name="备胎升降器" type="text" class="wenbenkuang" id="备胎升降器" value="<%if(rs!=null){ rs.beforeFirst(); if(rs.next()){out.write(rs.getString("备胎升降器"));}}%>" size="60"></td>
                        </tr>
                        <tr>
                          <td height="23"><div align="right">电气系统：</div></td>
                          <td height="23" colspan="3"><input name="电气系统" type="text" class="wenbenkuang" id="电气系统" value="<%if(rs!=null){ rs.beforeFirst(); if(rs.next()){out.write(rs.getString("电气系统"));}}%>" size="60"></td>
                        </tr>
                        <tr>
                          <td height="23"><div align="right">其他电气系统：</div></td>
                          <td height="23" colspan="3"><input name="其他电气系统" type="text" class="wenbenkuang" id="其他电气系统" value="<%if(rs!=null){ rs.beforeFirst(); if(rs.next()){out.write(rs.getString("其他电气系统"));}}%>" size="60"></td>
                        </tr>
                        <tr>
                          <td height="23"><div align="right">车身及附件：</div></td>
                          <td height="23" colspan="3"><input name="车身及附件" type="text" class="wenbenkuang" id="车身及附件" value="<%if(rs!=null){ rs.beforeFirst(); if(rs.next()){out.write(rs.getString("车身及附件"));}}%>" size="60"></td>
                        </tr>
                        <tr>
                          <td height="23"><div align="right">轮胎类型及规格：</div></td>
                          <td height="23" colspan="3"><input name="轮胎类型及规格" type="text" class="wenbenkuang" value="<%if(rs!=null){ rs.beforeFirst(); if(rs.next()){out.write(rs.getString("轮胎类型及规格"));}}%>" size="60"></td>
                        </tr>
                        <tr>
                          <td height="23"><div align="right">制动装置型式：</div></td>
                          <td height="0" colspan="3"><input name="制动装置型式" type="text" class="wenbenkuang" value="<%if(rs!=null){ rs.beforeFirst(); if(rs.next()){out.write(rs.getString("制动装置型式"));}}%>" size="60"></td>
                        </tr>
                        <tr>
                          <td height="23"><div align="right">转向器型式：</div></td>
                          <td height="0" colspan="3"><input name="转向器型式" type="text" class="wenbenkuang" id="转向器型式" value="<%if(rs!=null){ rs.beforeFirst(); if(rs.next()){out.write(rs.getString("转向器型式"));}}%>" size="60"></td>
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
                          <td width="134" height="15">&nbsp;</td>
                          <td width="85" height="15">&nbsp;</td>
                          <td width="158" height="15">&nbsp;</td>
                        </tr>
                        <tr>
                          <td width="103" height="23"><div align="right">发动机名称：</div></td>
                          <td height="23"><input name="发动机名称" type="text" class="wenbenkuang" value="<%if(rs!=null){ rs.beforeFirst(); if(rs.next()){out.write(rs.getString("发动机名称"));}}%>" size="12"></td>
                          <td height="23"><div align="right">发动机位置：</div></td>
                          <td height="23"><input name="发动机位置" type="text" class="wenbenkuang" value="<%if(rs!=null){ rs.beforeFirst(); if(rs.next()){out.write(rs.getString("发动机位置"));}}%>" size="12"></td>
                        </tr>
                        <tr>
                          <td height="23"><div align="right">发动机型式：</div></td>
                          <td height="23" colspan="3"><input name="发动机型式" type="text" class="wenbenkuang" value="<%if(rs!=null){ rs.beforeFirst(); if(rs.next()){out.write(rs.getString("发动机型式"));}}%>" size="45"></td>
                        </tr>
                        <tr>
                          <td height="23"><div align="right">汽缸数：</div></td>
                          <td height="0"><input name="汽缸数" type="text" class="wenbenkuang" value="<%if(rs!=null){ rs.beforeFirst(); if(rs.next()){out.write(rs.getString("汽缸数"));}}%>" size="12"></td>
                          <td height="0"><div align="right">排量：</div></td>
                          <td height="0"><input name="排量" type="text" class="wenbenkuang" value="<%if(rs!=null){ rs.beforeFirst(); if(rs.next()){out.write(rs.getString("排量"));}}%>" size="12"></td>
                        </tr>
                        <tr>
                          <td height="23"><div align="right">最大功率：</div></td>
                          <td height="0"><input name="最大功率" type="text" class="wenbenkuang" value="<%if(rs!=null){ rs.beforeFirst(); if(rs.next()){out.write(rs.getString("最大功率"));}}%>" size="12"></td>
                          <td height="0"><div align="right">最大扭矩：</div></td>
                          <td height="0"><input name="最大扭矩" type="text" class="wenbenkuang" value="<%if(rs!=null){ rs.beforeFirst(); if(rs.next()){out.write(rs.getString("最大扭矩"));}}%>" size="12"></td>
                        </tr>
                        <tr>
                          <td height="23"><div align="right">缸径：</div></td>
                          <td height="0"><input name="缸径/行程" type="text" class="wenbenkuang" id="缸径/行程" value="<%if(rs!=null){ rs.beforeFirst(); if(rs.next()){out.write(rs.getString("缸径/行程"));}}%>" size="12"></td>
                          <td height="0"><div align="right">压缩比：</div></td>
                          <td height="0"><input name="压缩比" type="text" class="wenbenkuang" id="压缩比" value="<%if(rs!=null){ rs.beforeFirst(); if(rs.next()){out.write(rs.getString("压缩比"));}}%>" size="12"></td>
                        </tr>
                        <tr>
                          <td height="23"><div align="right">0-100KM加速时间：</div></td>
                          <td height="0"><input name="0-100km加速时间" type="text" class="wenbenkuang" id="0-100km加速时间" value="<%if(rs!=null){ rs.beforeFirst(); if(rs.next()){out.write(rs.getString("0-100km加速时间"));}}%>" size="12"></td>
                          <td height="0"><div align="right">点火方式：</div></td>
                          <td height="0"><input name="点火方式" type="text" class="wenbenkuang" id="点火方式" value="<%if(rs!=null){ rs.beforeFirst(); if(rs.next()){out.write(rs.getString("点火方式"));}}%>" size="12"></td>
                        </tr>
                        <tr>
                          <td height="23"><div align="right">百公里油耗：</div></td>
                          <td height="23"><input name="百公里油耗" type="text" class="wenbenkuang" id="百公里油耗" value="<%if(rs!=null){ rs.beforeFirst(); if(rs.next()){out.write(rs.getString("百公里油耗"));}}%>" size="12"></td>
                          <td height="23"><div align="right">燃油种类：</div></td>
                          <td height="23">                            <input name="燃油种类" type="text" class="wenbenkuang" id="燃油种类" value="<%if(rs!=null){ rs.beforeFirst(); if(rs.next()){out.write(rs.getString("燃油种类"));}}%>" size="12"></td></tr>
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
                  <td height="20" class="bottm"><div align="left">&nbsp;<a href="#" style="color:#000000 " onClick="ShowTR(shibiema,jpg9)"><img src="Image/jia.gif" id="jpg9" width="10" height="10" border="0"> 车 身 类 别 及 标 识</a></div></td>
                  <td height="20" class="bottm"><div align="center"></div></td>
                </tr>
                <tr>
                  <td height="20" colspan="2"><div align="left" id="shibiema">
                      <table width="480" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                          <td height="15">&nbsp;</td>
                          <td height="15">&nbsp;</td>
                          <td height="15">&nbsp;</td>
                          <td height="15">&nbsp;</td>
                        </tr>
                        <tr>
                          <td width="70" height="23"><div align="right">底盘型号：</div></td>
                          <td width="155" height="23"><input name="底盘型号及类别" type="text" class="wenbenkuang" id="底盘型号及类别" value="<%if(rs!=null){ rs.beforeFirst(); if(rs.next()){out.write(rs.getString("底盘型号及类别"));}}%>"></td>
                          <td width="84" height="23"><div align="right">车辆识别码：</div></td>
                          <td width="171" height="23"><input name="车辆识别码" type="text" class="wenbenkuang" id="车辆识别码" value="<%if(rs!=null){ rs.beforeFirst(); if(rs.next()){out.write(rs.getString("车辆识别码"));}}%>"></td>
                        </tr>
                        <tr>
                          <td height="23"><div align="right">可选颜色：</div></td>
                          <td height="23" colspan="3"><input name="可选颜色" type="text" class="wenbenkuang" id="可选颜色" value="<%if(rs!=null){ rs.beforeFirst(); if(rs.next()){out.write(rs.getString("可选颜色"));}}%>"></td>
                        </tr>
                        <tr>
                          <td height="15" colspan="4" class="bottm">&nbsp;</td>
                        </tr>
                        <tr>
                          <td height="15" colspan="4">&nbsp;</td>
                        </tr>
                      </table>
                  </div></td>
                </tr>
                <script language="javascript">shibiema.style.display="none";</script>
              </table>
            </form></td>
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
