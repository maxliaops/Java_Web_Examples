<%@page contentType="text/html; charset=gb2312" language="java"%>
<%@page import="com.actionForm.GoodsForm"%>
<%@page import="com.actionForm.BranchForm"%>
<%@page import="com.actionForm.StorageForm"%>
<%@page import="com.dao.OutStorageDAO"%>
<%@page import="com.dao.BranchDAO"%>
<%@page import="java.util.*"%>
<%
boolean flag=false;

  //获取全部物资信息
    List listgetuse = null;
    OutStorageDAO outStorageDAO = new OutStorageDAO();
    //listgoods = getUseDAO.storage_query();     //查询库存物资
    listgetuse=(List)request.getAttribute("getuse");
   // session.setAttribute("listgoods", listgoods);
  //获取全部部门信息
    List listbranch = null;
    BranchDAO branchDAO = new BranchDAO();
    listbranch = branchDAO.query(null);
  if (listgetuse.size() <= 0) {
    out.println("<script language='javascript'>alert('暂无部门领用信息，不能进行部门报损!');window.location.href='getUse.do?action=getuseaddquery';</script>");
  }
  else if (listbranch.size() <= 0) {
    out.println("<script language='javascript'>alert('请先录入部门信息');window.location.href='branch.do?action=branchQuery';</script>");
  }
  else {
%>
<script language="javascript">
function mycheck(form){
	if(form.damagenum.value<=0){
		alert("请输入数量!");form.damagenum.focus();return false;
	}
	if(form.principal.value==""){
		alert("请填写负责人姓名!");form.principal.focus();return false;
	}
}
</script>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312"/>
<title>物资管理系统</title>
<link rel="stylesheet" href="Css/style.css">
</head>
<body>
<table width="757" height="174" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="133" align="center" valign="top"><%@include file="top.jsp"%>
    </td>
  </tr>
  <tr>
    <td><table width="100%" height="26" border="0" cellpadding="0" cellspacing="0" background="images/area_bg.jpg">
        <tr>
          <td width="26%" align="center" class='word_white'>当前登录用户：<%=session.getAttribute("username")%></td>
          <td width="4%">&nbsp;</td>
          <td width="70%" valign="bottom"> 当前位置：物资处理
            &gt; 部门报损
            &gt;&gt;&gt; </td>
        </tr>
      </table>
      <table width="100%" height="385" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
        <tr>
          <td width="5" valign="top" background="images/left.gif">&nbsp;</td>
          <td align="center" valign="top">&nbsp;
            <form name="form1" method="post" action="damage.do?action=damageadd" onSubmit="return mycheck(form1)">
              <table width="60%" height="253" border="1" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF" bordercolorlight="#DDDDDA" bordercolordark="#FFFFFF">
                <tr>
                  <script language="javascript">
				  function subcheck(myform){
				  	if(isNaN(myform.damagenum.value)){
						alert("您输入的数量不合法，请重新输入!");myform.damagenum.focus();return;
					}
				  	if(myform.damagenum.value<=0){
						alert("请输入数量!");myform.damagenum.focus();return;
					}
					myform.totalpay.value=(myform.damagenum.value*myform.price.value).toFixed(2);     //保留两位小数
				  }
		  function ChangeItem(id){
		  	window.location.href="damage.do?action=damageaddquery&id="+id;
		  }
		  </script>
                  <td width="25%" height="27" align="left"style="padding-left:10px">物资名称：</td>
                  <td width="75%" align="left"style="padding-left:10px"><select name="goodsid" class="select" id="goodsid" onChange="ChangeItem(this.value)">
                    <%
                  //List list=(List)request.getAttribute("GoodsStorage");
                  int selgoodsId=request.getAttribute("id").hashCode();     //选择的物资ID
                  String selProducer="";     //生产厂家
                  String selUnit="";     //单位
                  float selPrice=0.0f;     //单价
                  String goodsname="";     //物资名称
                  int goodsId=0;     //物资ID
                  String spec="";     //规格
                  float amount=0.0f;
                //  for(int i=0;i<list.size();i++){
                  for(int i=0;i<listgetuse.size();i++){
                    //Object obj[]=(Object[])list.get(i);
                   // Object obj[]=(Object[])listgetuse.get(i);
                   // GoodsForm goodsF=(GoodsForm)obj[0];
				   GoodsForm goodsF=(GoodsForm)listgetuse.get(i);
                    goodsId=goodsF.getId();
                    goodsname=goodsF.getName();
					spec=goodsF.getSpec();
                    if(i==0){
                      spec=goodsF.getSpec();
                      selProducer=goodsF.getProducer();
                      selUnit=goodsF.getUnit();
                      selPrice=goodsF.getPrice();
                    }
                    if(selgoodsId==goodsId){
                      selProducer=goodsF.getProducer();
                      selUnit=goodsF.getUnit();
                      selPrice=goodsF.getPrice();
                    }
                  %>
                    <option value="<%=goodsId%>" <%if(selgoodsId==goodsId){out.print("selected");}%>><%=goodsname+" ["+spec+"]" %> </option>
                    <%}                  %>
                  </select></td>
                </tr>
                <tr>
                  <td height="27" align="left"style="padding-left:10px">生产厂家：</td>
                  <td align="left"style="padding-left:10px"><%=selProducer%></td>
                </tr>
                <tr>
                  <td height="27" align="left"style="padding-left:10px">单&nbsp;&nbsp;&nbsp;&nbsp;价：              </td>
                  <td align="left"style="padding-left:10px"><input name="price" type="text" id="price" readonly="readonly" size="10" value="<%=selPrice%>">
元 </td>
                </tr>
                <tr>
                  <td height="27" align="left"style="padding-left:10px">部门名称：</td>
                  <td align="left"style="padding-left:10px"><select name="branchid" id="branchid">
                    <%
                    Iterator itbranch = listbranch.iterator();
                    int branchid=-1;
                    String branchname="";
                    while (itbranch.hasNext()) {
                      BranchForm branch = (BranchForm) itbranch.next();
                      branchid = branch.getId();
                      branchname = branch.getName();
                  %>
                    <option value="<%=branchid%>"><%=branchname %> </option>
                    <%}                  %>
                  </select></td>
                </tr>
                <tr>
                  <td height="27" align="left"style="padding-left:10px">报损数量：              </td>
                  <td align="left"style="padding-left:10px"><input name="damagenum" type="text" id="damagenum" value="1" size="8" onBlur="subcheck(form1)">
                    <%=selUnit%></td>
                </tr>
                <tr>
                  <td height="27" align="left"style="padding-left:10px">负&nbsp;责&nbsp;人：</td>
                  <td align="left"style="padding-left:10px"><input name="principal" type="text" id="principal" size="20"></td>
                </tr>
                <tr>
                  <td height="27" align="left"style="padding-left:10px">报损金额：</td>
                  <td align="left"style="padding-left:10px"><input name="totalpay" type="text" id="totalpay"  size="20" value="<%=amount%>" readonly="yes" >
元 </td>
                </tr>
                <tr>
                  <td height="27" align="left"style="padding-left:10px">操&nbsp;作&nbsp;员：</td>
                  <td align="left"style="padding-left:10px"><input name="username" type="text" id="username" value="<%=session.getAttribute("username")%>" size="20" readonly="yes"></td>
                </tr>
                <tr>
                  <td align="left"style="padding-left:10px">报损原因：</td>
                  <td align="left"style="padding-left:10px"><textarea name="cause" cols="40" rows="4" id="cause"></textarea></td>
                </tr>				
                <tr>
                  <td colspan="2" align="center"style="padding-left:10px"><input name="Submit" type="submit" class="btn_grey" value="保存"> &nbsp;
                  <input name="Submit2" type="reset" class="btn_grey" value="重置"></td>
                </tr>
              </table>
            </form>
          </td>
          <td width="10" valign="top" background="images/right.jpg">&nbsp;</td>
        </tr>
      </table></td>
  </tr>
  <tr>
    <td height="55" valign="top" background="images/bottom.jpg"><%@include file="copyright.jsp"%>
    </td>
  </tr>
</table>
</body>
</html>
<%}%>
