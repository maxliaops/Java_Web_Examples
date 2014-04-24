<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<jsp:useBean id="conn" scope="page" class="com.tools.ConnDB"/>
<%
ResultSet rs_superType=conn.executeQuery("select ID,superType from V_Type group by ID,superType order by superType desc");
%>
<table width="186" height="47"  border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
  <tr>
    <td height="47"><img src="images/left_type.gif" width="186" height="47"></td>
  </tr>
</table>
<table width="186" height="312"  border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" class="tableBorder">
  <tr>
    <td height="400" valign="top"><table width="100%" height="40"  border="0" cellpadding="0" cellspacing="0">
	<tr><td height="9pt"></td></tr>
      <%
			int ID_superType=0;
			String superType="";
			int m=1;
			while(rs_superType.next()){
			  ID_superType=rs_superType.getInt(1);
			  superType=rs_superType.getString(2);
				String sql="select * from V_Type where ID="+ID_superType;
				ResultSet rs_subType=conn.executeQuery(sql);
				String subType="";
				int subID=0;
				//获取记录总数
				rs_subType.last();
				int subType_RC=rs_subType.getRow();
				rs_subType.first();
			 %>
      <tr>
        <td><%
					if(subType_RC<=0){
					%>
          &nbsp;&nbsp;&nbsp;&nbsp;<img src="images/jian_null.gif" width="38" height="16" border="0"> <%=superType%>
          <%
					}else{
					%>
          &nbsp;&nbsp;&nbsp;&nbsp;<a href="Javascript:ShowTR(img<%=m%>,OpenRep<%=m%>)"><img src="images/jia.gif" border="0" alt="展开" id="img<%=m%>"></a> <a href="Javascript:ShowTR(img<%=m%>,OpenRep<%=m%>)"><%=superType%></a>
          <%
					}
					%>        </td>
        <%if (subType_RC>0){%>
      <tr id="OpenRep<%=m%>" style="display:none;">
        <td colspan="6"><%do{
				subType=rs_subType.getString(3);
				subID=rs_subType.getInt(4);
				%>
              <table width="100%"  border="0" cellspacing="-2" cellpadding="-2">
                <tr>
                  <td height="25" align="center"><table width="90%"  border="0" cellspacing="0" cellpadding="0">
                      <tr onMouseOver="this.style.background='#EEEEEE'" onMouseOut="this.style.background=''">
                        <td width="15%">&nbsp;</td>
                        <td width="10%" align="center"><img src="images/folder.gif" width="16" height="16" border="0"> </td>
                        <td width="75%"><a href="type.jsp?Type=<%=subID%>"><%=subType%></a></td>
                      </tr>
                  </table></td>
                </tr>
              </table>
          <%	m++;  //注意，该条语句一定不能少
				}while(rs_subType.next());
				%>        </td>
        <%}%>
      </tr>
      <%			}%>
    </table>    </td>
  </tr>
  <tr>
    <td valign="top"><table width="100%" height="119"  border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td height="60" align="center"><img src="images/ggzs_blue.gif" width="176" height="50"></td>
      </tr>
      <tr>
        <td height="60" align="center"><img src="images/ggzs_green.gif" width="176" height="50"></td>
      </tr>
      <tr>
        <td height="60" align="center"><img src="images/ggzs_blue.gif" width="176" height="50"></td>
      </tr>
    </table></td>
  </tr>
</table>
      <script language="javascript">
ShowTR(img1,OpenRep1);  //设置第1个节点为展开状态
function ShowTR(objImg,objTr){
	if(objTr.style.display == ""){
		objTr.style.display = "none";
		objImg.src = "images/jia.gif";
		objImg.alt = "展开";
	}else{
		objTr.style.display = "";
		objImg.src = "images/jian.gif";
		objImg.alt = "折叠";
	}
}
</script>