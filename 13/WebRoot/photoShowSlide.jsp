<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<jsp:directive.page import="java.util.List"/>
<%
String newAddress="";
String[] address=(String[])request.getAttribute("address");
for(int i=0;i<address.length;i++){
	newAddress+="'"+address[i]+"',";
}
newAddress=newAddress.substring(0,newAddress.length()-1);


%>
<link href="css/style.css" type="text/css" rel="stylesheet" />
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>幻灯片浏览相片</title>
<SCRIPT language="javascript">
//指定要显示的图片路径

var sImgArr=new Array(<%=newAddress%>);

var plImg = new Image();
var gIndex = 0;



function SlideImg(index){
	gIndex = index;
	if ('Microsoft Internet Explorer' == navigator.appName)	{
		document.images["slideImg"].filters.item(0).Apply();
	}
	document.images["slideImg"].src = sImgArr[index];
	if ('Microsoft Internet Explorer' == navigator.appName){
		document.images["slideImg"].filters.item(0).play();
	}
}
function NextImg(){  //显示下一张图片
	gIndex = ((gIndex+1)>=sImgArr.length?0:(gIndex+1));
	SlideImg(gIndex);
}
function PrevImg(){  //显示前一张图片
	gIndex = ((gIndex-1)<0?(sImgArr.length-1):(gIndex-1));
	SlideImg(gIndex);	
}


var sid;
function inislide(){  //设置自动运行

	if(sid==null){
		sid = setInterval('NextImg()', 3000);
	}
}

</SCRIPT>
</head>



<body onLoad="inislide()">



  
  
  
     <jsp:include page="top.jsp" flush="true" />
   <table width="753" height="40" border="0" align="center" cellpadding="0" cellspacing="0" background="images/16.jpg">
     <tr>
       <td width="561" height="28">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font color="#EDE6BC" size="-1"><b>当前用户：${sessionScope.userInfo.username}</b></font></td>
       <td width="192"><a href="user_upLoadPhoto.jsp" class="a1">请您上传自己的相片</a>
	   </td>
     </tr>
</table>
   <table width="753" height="54" border="0" align="center" cellpadding="0" cellspacing="0" background="images/17.jpg">
     <tr>
       <td height="51"><table width="287" height="33" border="0" align="center" cellpadding="0" cellspacing="0">
           <tr>
             <th width="287" height="33" align="center" valign="bottom"> <a href="javascript:history.go(-1);" class="a3">滚动浏览图片</a>&nbsp;&nbsp; <a href="#" class="a3">幻灯片浏览</a> </th>
           </tr>
       </table></td>
     </tr>
   </table>
   <table width="753" height="504" border="0" align="center" cellpadding="0" cellspacing="0" background="images/18.jpg">
     <tr>
       <td>
	   
	   
	   
	   
	   <table width="410" height="350" border="0" align="center" cellpadding="0" cellspacing="0" background="images/bg.gif">
    <tr>
      <td width="67" height="302" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td colspan="3" height="14"></td>
          </tr>
        <tr>
          <td width="4%" height="274">&nbsp;</td>
          <td width="92%" valign="top"><img src="images/5.jpg" name="slideImg" width="379" height="275" id="slideImg" style="BORDER-TOP: #000 1px solid; FILTER: revealtrans(duration=2.0,transition=10); BORDER-BOTTOM: #000 1px solid"></td>
          <td width="4%">&nbsp;</td>
        </tr>
        <tr>
          <td height="64" colspan="3" valign="top"><img src="images/bg_1.jpg" width="410" height="66" border="0" usemap="#Map"></td>
          </tr>
      </table></td>
    </tr>
  </table>
	   
	   
	   
	   
	   
	   
	   
	   
	   
	   
	   </td>
     </tr>
</table>
   







<jsp:include page="down.jsp" flush="true"></jsp:include>
<map name="Map">
<area shape="circle" coords="214,32,17" href="#" onClick="PrevImg()">
<area shape="circle" coords="272,32,16" href="#"  onClick="NextImg()"></map></body>    

















              
</html>        

