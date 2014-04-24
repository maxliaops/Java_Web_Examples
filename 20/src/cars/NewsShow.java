package cars;

import java.sql.*;

/**
 * <p>Title: 华奥汽车销售集团网站</p>
 * <p>Description: </p>
 * <p>Copyright: Copyright (c) 2005</p>
 * <p>Company: 明日科技有限公司</p>
 * @author not attributable
 * @version 1.0
 */

public class NewsShow {
  String sql;
  String show;
  ResultSet rs;
  int i=0;
  public NewsShow() {
    Bean1 data=new Bean1();
    sql="select * from tb_News where Type='新闻报道' or Type='集团动向' or Type='新车报道' order by IssueDate";
    try{
      rs=data.getrs(sql);
      rs.beforeFirst();
      sql="";
      while (rs.next()&&(i<10)){
        sql=sql+"<tr><td height='20'>&nbsp;&nbsp;&nbsp;&nbsp;<a href='#'onClick=javascript:window.open('News_Particular.jsp?id="+rs.getInt("ID")+"','','width=500,height=560,toolbar=no,location=no,status=no,menubar=no') style='color:#000000'>"+rs.getString("Title")+"</a></td></tr>";
      }
    }
    catch(SQLException ex){
      ex.printStackTrace();
    }
    show="<table width='160' border='0' cellspacing='0' cellpadding='0'><tr>";
    show=show+sql+"</table>";
  }

  public String getstring(){
    return show;
  }
}