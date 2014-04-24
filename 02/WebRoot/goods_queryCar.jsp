<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@page import="com.form.LogForm"%>
<link href="css/style.css" type="text/css" rel="stylesheet">
<jsp:directive.page import="java.util.List"/>
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>物流配货网——车源信息查询</title>
</head>
<jsp:useBean id="goodsAndLogDao" scope="page" class="com.dao.GoodsAndLogDao"/>
<jsp:useBean id="pagination" class="com.tools.MyPagination" scope="session"/>
<%
String str=(String)request.getParameter("Page");
int Page=1;
List list=null;
if(str==null){
	list=(List)request.getAttribute("list");
	int pagesize=5;      //指定每页显示的记录数
	list=pagination.getInitPage(list,Page,pagesize);     //初始化分页信息
}else{
	Page=pagination.getPage(str);
	list=pagination.getAppointPage(Page);     //获取指定页的数据
}
request.setAttribute("list1",list);
%>


<s:set name="list" value="#request.list1"/>
<body>
<jsp:include page="main_top.jsp"/>


<table border="0" cellpadding="0" cellspacing="0">
  <tr>
  <td width="57">&nbsp;</td>
    <td width="637" valign="top" align="center">
	<table width="615"  border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td height="25" valign="top">当前位置：首页  >>  车源信息查询</td>
      </tr>
    </table>  
     
              

    <table border="1" cellpadding="1" cellspacing="1" bordercolor="#FFFFFF" bgcolor="E4ECEF">
      <tr align="center">
        <td width="61" height="30">车牌号码</td>
        <td width="131">路线</td>
        <td width="148">车辆描述</td>
        <td width="127">使用日志</td>
        <td width="79">是否使用</td>
      </tr>
      <s:iterator value="list" status="carList" id="car"> 
        <s:set name="car_id" value="%{#car.id}" scope="request"/>   
        <s:set name="car_number" value="%{#car.car_number}" scope="request"/>  
      <tr bgcolor="#FFFFFF" align="center">
        <td height="40"><s:property value="car_number"/></td>
        <td><s:property value="car_road"/></td>
        <td><s:property value="car_content"/></td>
        <td>
        <%
         Integer car=  (Integer)request.getAttribute("car_id");      
          LogForm logForm=goodsAndLogDao.queryCarLogForm(car);
        System.out.println("ddddddddd "+(logForm==null));
        if(logForm!=null){  
    	  out.print("发货时间："+logForm.getStartTime()+"<br>");
       out.print("收货时间："+logForm.getEndTime()+"<br>");
      	 }else{
         out.print("&nbsp;");	 
       }
      	 %>
        </td>
        <td>
        <%
       String information="已经使用";
    
       if(logForm==null){    	
     information="<a href='goods_insertGoods.jsp?car_id="+car+"&car_number="+request.getAttribute("car_number")+"'>未被使用</a>";
      }
       out.print(information);
	  
        %>
        </td>
      </tr>
      </s:iterator>
    </table>
	
	<%=pagination.printCtrl(Page)%>
	
	
	
	</td>
    <td width="115" valign="top">
	
	<jsp:include page="main_right.jsp"/>
	
	</td>
  </tr>
</table>
<jsp:include page="main_down.jsp"/>
</body>
</html>
