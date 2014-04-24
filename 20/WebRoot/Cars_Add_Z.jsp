<%@ page contentType="text/html; charset=gb2312" import="java.sql.*"%>
<%@ page import="java.io.*" %>
<% request.setCharacterEncoding("gb2312");%>
<html>
<head>
<title><%if(request.getParameter("id")==null){%>车 辆 数 据 添 加<%}else{%>车 辆 数 据 修 改<%}%></title>
</head>
<link rel="stylesheet" href="Css/style.css">
<jsp:useBean id="data" scope="page" class="cars.Bean1" />
<jsp:useBean id="con" scope="page" class="cars.SendGet" />
<jsp:useBean id="cross" scope="page" class="cars.CrossTable" />
<%!int logo;
ResultSet rs;
%>
<%
if(request.getParameter("id")!=null){
logo=Integer.parseInt(request.getParameter("id"));
rs=cross.getrs(4,logo);
}
else{
rs=null;
}
%>
<script language="javascript">
	function checks(){
	 var names=orderform.名称.value;
	 var price=orderform.价格.value;
	var price1=orderform.超时费用.value;
	 var price2=orderform.超里程费用.value;
	 var price3=orderform.费用项目.value;
	 var price4=orderform.另付费项目.value;
	 var pic=orderform.图片.value;
	 if(names==""){
	 	alert("请填写租赁车辆的名称");
	}
	else if(price==""){
		alert("请输入租赁车辆的出租价格");
	}
	else if(price1==""){
		alert("请输入车辆使用超时的应付费用");
	}
	else if(price2==""){
		alert("请输入车辆使用超里程的应付费用");
	}
	else if(price3==""){
		alert("请填写车辆的收费项目");
	}
	else if(price4==""){
		alert("请填写其他的收费项目");
	}
	else if(pic==""){
		alert("请填写租赁车辆的简介图片的名称");
	}
	else {
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
                <td height="20" valign="top">&nbsp; </td>
              </tr>
              <tr valign="bottom">
                <td height="430" valign="top">
                  <form action="<%if(rs==null){out.write("test.jsp");}else{out.write("Car_Change.jsp");}%>" method="post" enctype="multipart/form-data" name="orderform">
                    <table width="480" border="0" cellspacing="0" cellpadding="0" id="zulinche">
                      <tr>
                        <td height="15" colspan="2"><input type="hidden" name="hiddenField" value="租赁车"><%if(rs!=null){%><input type="hidden" name="hiddenField" value="<%=logo%>"><%}%></td>
                      </tr>
                      <tr class="bottm">
                        <td width="285" height="30" class="bottm"><div align="left">&nbsp;<a href="#" style="color:#000000 ">租 赁 车 基 本 资 料</a></div></td>
                        <td width="195" height="30"><div align="center" id="count1"></div></td>
                      </tr>
                      <tr>
                        <td height="20" colspan="2"><div align="left">
                            <table width="480" border="0" cellspacing="0" cellpadding="0" id="jibenziliao">
                              <tr>
                                <td height="20">&nbsp;</td>
                                <td width="140" height="20">&nbsp;</td>
                                <td width="70" height="20">&nbsp;</td>
                                <td width="171" height="20">&nbsp;</td>
                              </tr>
                              <tr>
                                <td width="99" height="35"><div align="right">车辆名称：</div></td>
                                <td height="35" colspan="3"><input name="名称" type="text" class="wenbenkuang" id="名称" size="40" value="<%if(rs!=null){ rs.beforeFirst(); if(rs.next()){out.write(rs.getString("名称"));}}%>"></td>
                              </tr>
                              <tr>
                                <td height="35"><div align="right">基本价格：</div></td>
                                <td height="35" colspan="3"><input name="价格" type="text" class="wenbenkuang" id="价格" size="40" value="<%if(rs!=null){ rs.beforeFirst(); if(rs.next()){out.write(rs.getString("价格"));}}%>"></td>
                              </tr>
                              <tr>
                                <td height="35"><div align="right">超时费用：</div></td>
                                <td height="35" colspan="3"><div align="left">
                                    <input name="超时费用" type="text" class="wenbenkuang" id="超时费用" size="40"value="<%if(rs!=null){ rs.beforeFirst(); if(rs.next()){out.write(rs.getString("超时费用"));}}%>">
                                </div></td>
                              </tr>
                              <tr>
                                <td height="35"><div align="right">超里程费用：</div></td>
                                <td height="35" colspan="3"><input name="超里程费用" type="text" class="wenbenkuang" id="超里程费用"  size="40" value="<%if(rs!=null){ rs.beforeFirst(); if(rs.next()){out.write(rs.getString("超里程费用"));}}%>"></td>
                              </tr>
                              <tr>
                                <td height="35"><div align="right">费用项目：</div></td>
                                <td height="35" colspan="3"><input name="费用项目" type="text" class="wenbenkuang" id="费用项目" size="40" value="<%if(rs!=null){ rs.beforeFirst(); if(rs.next()){out.write(rs.getString("费用项目"));}}%>"></td>
                              </tr>
                              <tr>
                                <td height="35"><div align="right">另付费项目：</div></td>
                                <td height="35" colspan="3"><input name="另付费项目" type="text" class="wenbenkuang" id="另付费项目" size="45" value="<%if(rs!=null){ rs.beforeFirst(); if(rs.next()){out.write(rs.getString("另付费项目"));}}%>"></td>
                              </tr>
                              <tr>
                                <td height="35"><div align="right">备注：</div></td>
                                <td height="35" colspan="3" rowspan="3"><textarea name="备注" cols="58" rows="6" class="wenbenkuang" id="备注"><%if(rs!=null){ rs.beforeFirst(); if(rs.next()){out.write(rs.getString("备注"));}}%>
</textarea></td>
                              </tr>
                              <tr>
                                <td height="35">&nbsp;</td>
                              </tr>
                              <tr>
                                <td height="35">&nbsp;</td>
                              </tr>
                              <tr>
                                <td height="35"><div align="right">车辆图片：</div></td>
                                <td height="35" colspan="3"><input name="图片" type="text" class="wenbenkuang" id="图片" size="40" value="<%if(rs!=null){ rs.beforeFirst(); if(rs.next()){out.write(rs.getString("图片"));}}%>"></td>
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
