<%@ page contentType="text/html;charset=gb2312" language="java"%>
<html>
  <title>商品销售排行</title>
  <meta http-equiv="Content-Type" content="text/html;charset=gb2312">
    <link href="../CSS/style.css" rel="stylesheet" type="text/css">
  <body>
  <table width="590" border="0" cellspacing="-2" cellpadding="-2">
    <tr height="6"><td>
        </td>
    </tr>
    <tr><td valign="top" height="83">
      <table width="99%" border="0" cellspacing="0" cellpadding="0">
<tr bgcolor="#FF9933">
    <td height="27" colspan="6" bgcolor="#EEEEEE" class="tableBorder_gray">
    &nbsp;<span  class="word_deepgrey"> 当前位置：查询统计></span>年销售额分析 &gt;&gt;&gt;</td>
  </tr>
      <form name="form2" method="post" action="spyearquest.jsp" target="MainFrame">
  <tr>
    <td height="30" colspan="6">&nbsp;请选择要进行分析的年份：
      <select name="year" id="year" >
        <%for(int i=2000;i<=2049;i++){%>
        <option value="<%=i%>" ><%=i%>年</option>
	<%}%>
      </select>
        <input name="Submit" type="submit" class="btn_grey" value="确定分析"></td>
  </tr>
  </form>
  </table>
    </td></tr></table>
</body>
</html>
  </body>
</html>
