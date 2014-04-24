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

public class FileText {
  String[] city=new String[30];
  String filetext="";
  String sql;
  String rla="";
  String mid="";
  ResultSet rs;
  Bean1 data=new Bean1();

  public FileText() {
    city[0]="新疆";
    city[1]="西藏";
    city[2]="云南";
    city[3]="四川";
    city[4]="贵州";
    city[5]="广东";
    city[6]="广西";
    city[7]="海南";
    city[8]="福建";
    city[9]="江苏";
    city[10]="浙江";
    city[11]="江西";
    city[12]="安徽";
    city[13]="湖南";
    city[14]="湖北";
    city[15]="河南";
    city[16]="河北";
    city[17]="山东";
    city[18]="山西";
    city[19]="陕西";
    city[20]="甘肃";
    city[21]="宁夏";
    city[22]="青海";
    city[23]="内蒙古";
    city[24]="吉林";
    city[25]="辽宁";
    city[26]="北京";
    city[27]="天津";
    city[28]="重庆";
    city[29]="黑龙江";
  }

  public String getfiletext(String type){
    try{
      filetext="<script language='javascript'>\rfunction area(areas)\r{ var str;switch(areas){\r";
       for(int i=0;i<city.length;i++){
                mid=mid+"case \""+city[i]+"\":\n";
                sql="select * from tb_Enterprise where Address like '%"+city[i]+"%' and Style='"+type+"'";
                        rs=data.getrs(sql);
                        rs.beforeFirst();
                        while(rs!=null&&rs.next()){
                                rla=rla+"<tr height='20'><td align=center class=br><a href='#' onclick=javascript:window.open('Enterprise_Particular.jsp?id="+rs.getInt("ID")+"','','width=380,height=235,toolbar=no,location=no,status=no,menubar=no') style='color:#000000'>"+rs.getString("Name")+"</a></td><td align=center class=bottm>"+rs.getString("Phone")+"</td></tr>";
                        }
                 mid=mid+"str=\"<table align=center width=560><tr height=20><td bgcolor=#efefef align=center class=br>连锁企业名称</td>";
                 mid=mid+"<td align=center class=bottm  bgcolor=#efefef>联系电话</td></tr>"+rla+"<tr><td></td><td></td></tr></table>\"\r";
                 mid=mid+"break;\r";
                 rla="";
               }
        filetext=filetext+mid+"} intro.innerHTML=str;}</script>";
        return filetext;
    }
    catch(Exception e){
      e.printStackTrace();
    }
    return null;
  }
}