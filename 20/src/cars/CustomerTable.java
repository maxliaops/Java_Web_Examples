package cars;

public class CustomerTable {
  String table;

  public CustomerTable() {
    table="";
    table=table+"<table width=580 height=566 border=1 cellpadding=0 cellspacing=0><tr bgcolor=#FFCC99>";
        table=table+"<td height=20>&nbsp;<a href=SpeakFor.jsp style='color:#000000' >客服中心</a> --&gt;&gt; 客服热线</td>";
      table=table+"</tr><tr><td height=180 valign=top style=padding:10px;>" +
      		"长春：0431-8497****<br><br>吉林：0432-769****<br><br>四平：0434-559****</td></tr> </table>";
  }

  public String gettable(){
    return table;
  }
}