<%@ page contentType="text/html;charset=gb2312"%>
<html>
  <title>客户信息查询</title>
  <link href="../CSS/style.css" rel="stylesheet" type="text/css">
  <style type="text/css">
<!--
.style2 {color: #333333}
-->
  </style>
<body bgcolor="#FFFFFF" text="#000000" >
<script language='JavaScript'>
function listall()
{
form1.ccif.value="ALL";//将ccif的值设置为"ALL"
form1.submit();}//提交表单
function check()
{
  if(form1.qvalue.value==0){
    alert('请出入查询关键字');form1.qvalue.focus();return;
  }
  form1.submit();
}
</script>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tr>
    <td height="27" bgcolor="#EEEEEE" class="tableBorder_gray">
    &nbsp;<span  class="word_deepgrey"> 当前位置：基础信息管理 > </span> 客户信息查询 &gt;&gt;&gt;</td>
  </tr>
    <tr><td valign="top" height="83">
      <table width="98%" height="70" border="0" cellpadding="0" cellspacing="0">
        <tr><td width="550" height="43" align="Top">
          <form name="form1" method="POST" action="khquest.jsp" target="MainFrame">
            <div align="center"> &nbsp;&nbsp; &nbsp;&nbsp;请选择查询条件:
              <select name="cif">
                <option value="khname" selected>客户名称</option>
                <option value="khjc">客户简称</option>
              </select>
              <select name="ccif">
                <option value="=" selected> 等于</option>
                <option value="LIKE">LIKE</option>
                <option value="ALL">ALL</option>
              </select>
              <%request.setCharacterEncoding("gb2312");%>
              <input type="text" name="qvalue">
              <input name="submit1" type="button" class="btn_grey" value="查询" onClick="check()">
              <input name="submit2" type="submit" class="btn_grey" value="显示全部数据" onClick="listall()">
            </div>
          </form>
        </td></tr>
      </table>
    </td></tr>
</table>
</body>
</html>

