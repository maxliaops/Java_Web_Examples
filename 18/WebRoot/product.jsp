<%@ page contentType="text/html; charset=gb2312" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>添加新产品</title>
<script language="javascript">
<!--
  function CallUpload(formName,controlName,imageName)
  {
    toUrl="upimg.jsp?formname="+formName+"&controlname="+controlName+"&imagename="+imageName;
    window.open(toUrl,"uploadtool","width=400,height=400");
  }
//-->
</script>
<link href="style.css" rel="stylesheet">
</head>

<body>
<table width="777" height="172"  border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td><table width="777"  border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td><img src="Images/tiring-room/tiring-room_01.gif" width="777" height="125"></td>
      </tr>
      <tr>
        <td height="47" valign="top" background="Images/tiring-room/tiring-room_02.gif"><jsp:include page="H_navigation.jsp"/></td>
      </tr>
    </table></td>
  </tr>
</table>
<table width="777"  border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="44" height="380" valign="top"><img src="Images/tiring-room/tiring-room_03.gif" width="44" height="248"></td>
    <td valign="top"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="68" colspan="2" background="Images/tiring-room/h_addproduct.gif">&nbsp;</td>
      </tr>
      <tr>
        <td width="4%">&nbsp;</td>
        <td width="96%">
		  <form method="POST"  name="newkx" action="product_add.jsp">
            <table width="100%" height="250" border="0">
              <tr>
                <td width="27%" height="30" align="center">产品名称：</td>
                <td width="73%" colspan="2"><input type="text" name="productname" size="28">
                  *</td>
              </tr>
              <tr>
                <td width="27%" height="30" align="center">产品单价：</td>
                <td width="73%" colspan="2"><input type="text" name="productprice" size="28">
                  *</td>
              </tr>
              <tr>
                <td width="27%" height="30" align="center">生 产 商：</td>
                <td width="73%" colspan="2"><input type="text" name="productform" size="28">
                  *</td>
              </tr>
              <tr>
                <td width="27%" height="30" align="center">产品介绍：
                  </td> 
                <td width="73%" colspan="2">
                  <textarea name="productnote" cols="40" rows="4" class="wenbenkuang"></textarea>
                  *</td>
              </tr>
              <tr>
                <td width="27%" height="30" align="center">产品图片：</td>
                <td colspan="2">
<input type="text" name="pic" size="28" readonly="yes">
* 
<input name="B5" type="button" class="btn_grey" onClick="JavaScript:CallUpload('newkx','pic','Kpic_ima');" value="上传"> 
(请单击上传按钮上传图片！)                  
<input type="hidden" name="Kpic_ima"></td>
                <input type="hidden" name="pageaction" value="create">
                <input type="hidden" name="responsepage" value="shopman.jsp">
                <input type="hidden" name="usertype" value="1">

                  
              </tr>
			  <script language="javascript">
			  function check(){
			  	for(i=0;i<5;i++){
					if(newkx.elements[i].value==""){
					alert("请将信息添完整!");
					newkx.elements[i].focus();
					return false;
					}
				}
				if(isNaN(newkx.productprice.value)){
					alert("您输入的单价不正确!");newkx.productprice.focus();return false;
				}
				return true;
			  }
			  </script>
              <tr>
                <td width="27%" align="right">
                    <input name="B1" type="submit" class="btn_grey" value="提交" onClick="return check();"></td>
                <td width="73%"><input name="B2" type="reset" class="btn_grey" value="全部重写">
                  &nbsp;
                  <input name="button" type="button" class="btn_grey" onClick="history.back();" value="&nbsp;返&nbsp;回&nbsp;"></td>
                <td width="37%">&nbsp;</td>
              </tr>
            </table>
	      </form>
		  </td>
      </tr>
    </table></td>
    <td width="35" valign="top"><img src="Images/tiring-room/tiring-room_05.gif" width="35" height="248"></td>
  </tr>
</table>
<jsp:include page="copyright.htm"/>
</body>
</html>