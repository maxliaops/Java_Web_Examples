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

public class CrossTable {
  Bean1 data=new Bean1();
  ResultSet rs;
  ResultSet rs1;
  int sum=0;
  String sql;
  String str="";
  int homo1=0;
  int homo=0;
  int homo2=0;
  String rla="";
  int str1=0;
  int str2=0;


  public CrossTable() {
  }

  public ResultSet getrs(int i){
    try{
      sql = "select Name from tb_Basic2 where Home2="+i;
      rs = data.getrs(sql);
      rs.last();
      sum = rs.getRow();
      rs.beforeFirst();
      while (rs.next()) {
        if (rs.isLast()) {
          str = str + "min(case Name when '" + rs.getString("Name") +
              "' then tb_Values.Price end) AS '" + rs.getString("Name") + "'";
        }
        else {
          str = str + "min(case Name when '" + rs.getString("Name") +
              "' then tb_Values.Price end) AS '" + rs.getString("Name") + "',";
        }
      }
      rs.close();
      sql = "select tb_Values.Logo," + str + " from tb_Basic2 inner join tb_Values on tb_Basic2.ID=tb_Values.Homo1 and tb_Values.Type="+i+" group by tb_Values.Logo";
      rs = data.getrs(sql);
      str="";
      return rs;
    }
    catch(Exception e){
      e.printStackTrace();
    }
    return null;
  }

  public ResultSet getrs(int i,int logo){
    try{
      sql = "select Name from tb_Basic2 where Home2="+i;
      rs = data.getrs(sql);
      rs.last();
      sum = rs.getRow();
      rs.beforeFirst();
      while (rs.next()) {
        if (rs.isLast()) {
          str = str + "min(case Name when '" + rs.getString("Name") +
              "' then tb_Values.Price end) AS '" + rs.getString("Name") + "'";
        }
        else {
          str = str + "min(case Name when '" + rs.getString("Name") +
              "' then tb_Values.Price end) AS '" + rs.getString("Name") + "',";
        }
      }
      rs.close();
      sql = "select tb_Values.Logo," + str + " from tb_Basic2 inner join tb_Values on tb_Basic2.ID=tb_Values.Homo1 and tb_Values.Logo="+logo+" group by tb_Values.Logo";
      rs = data.getrs(sql);
      str="";
      return rs;
    }
    catch(Exception e){
      e.printStackTrace();
    }
    return null;
  }

  public ResultSet getrs(int i,int logo,int type){
    try{
      sql = "select Name from tb_Basic2 where Home2="+i+" and Homo1="+type;
      rs = data.getrs(sql);
      rs.last();
      sum = rs.getRow();
      rs.beforeFirst();
      while (rs.next()) {
        if (rs.isLast()) {
          str = str + "min(case Name when '" + rs.getString("Name") +
              "' then tb_Values.Price end) AS '" + rs.getString("Name") + "'";
        }
        else {
          str = str + "min(case Name when '" + rs.getString("Name") +
              "' then tb_Values.Price end) AS '" + rs.getString("Name") + "',";
        }
      }
      rs.close();
      sql = "select tb_Values.Logo," + str + " from tb_Basic2 inner join tb_Values on tb_Basic2.ID=tb_Values.Homo1 and tb_Values.Logo="+logo+" group by tb_Values.Logo";
      rs = data.getrs(sql);
      str="";
      return rs;
    }
    catch(Exception e){
      e.printStackTrace();
    }
    return null;
  }

  public ResultSet getrs(String name1,String name2,int logo){
    try{
  sql="select * from tb_Basic2 where Name='品牌' and Home2="+logo;
  rs=data.getrs(sql);
  rs.beforeFirst();
  if(rs.next()&&rs!=null){
    homo1 = rs.getInt("ID");
    }
  sql="select * from tb_Basic2 where Name='型号' and Home2="+logo;
  rs=data.getrs(sql);
  rs.beforeFirst();
  if(rs.next()&&rs!=null){
    homo2 = rs.getInt("ID");
  }
      sql="select * from tb_Values where Homo1="+homo1+" and Price like '%"+name1+"%'";
      rs=data.getrs(sql);
      rs.last();
      int row1=rs.getRow();
      int[] ary1=new int[row1];
      rs.beforeFirst();
      while(rs.next()&&rs!=null){
        ary1[str2]=rs.getInt("Logo");
        str2=str2+1;
      }
      rs.close();
      data.close();
      Bean1 data1=new Bean1();
      sql="select * from tb_Values where Homo1="+homo2+" and Price like '%"+name2+"%'";
      rs=data1.getrs(sql);
      rs.beforeFirst();
       rla="";
      while(rs.next()&&rs!=null){
        for(str1=0;str1<str2;str1++){
          if (ary1[str1] == rs.getInt("Logo")) {
            rla = rla + " tb_Values.Logo=" + rs.getInt("Logo") + " or";
          }
       }
      }
      rla=rla.substring(0,rla.length()-3);
      sql = "select Name from tb_Basic2 where Home2="+logo;
      rs = data.getrs(sql);
      rs.beforeFirst();
      while (rs.next()) {
      if (rs.isLast()) {
          str = str + "min(case Name when '" + rs.getString("Name") +
           "' then tb_Values.Price end) AS '" + rs.getString("Name") + "'";
       }
          else {
        str = str + "min(case Name when '" + rs.getString("Name") +
                    "' then tb_Values.Price end) AS '" + rs.getString("Name") + "',";
        }
     }
     rs.close();
     sql = "select tb_Values.Logo,tb_Values.Type," + str + " from tb_Basic2 inner join tb_Values on tb_Basic2.ID=tb_Values.Homo1 and("+rla+") group by tb_Values.Logo,tb_Values.Type";
     rs = data.getrs(sql);
     str="";
     rla="";
  return rs;
}
catch (Exception e) {
  e.printStackTrace();
}
return null;
  }


  public ResultSet getrs(String name,String price){
    try{
  sql="select * from tb_Basic2 where Name='"+name+"'";
  rs=data.getrs(sql);
  rs.beforeFirst();
  if(rs.next()&&rs!=null){
    homo1 = rs.getInt("ID");
    }
  if(rs.next()&&rs!=null){
    homo2 = rs.getInt("ID");
  }
      sql="select * from tb_Values where (Homo1="+homo1+" or Homo1="+homo2+") and Price='"+price+"'";
      rs=data.getrs(sql);
      rs.beforeFirst();
      rla="";
      while(rs.next()&&rs!=null){
        homo1=rs.getInt("Logo");
        rla=rla+" tb_Values.Logo="+homo1+" or";
      }
      rla=rla.substring(0,rla.length()-3);
  str="min(case Name when '品牌' then tb_Values.Price end) AS '品牌',";
  str=str+"min(case Name when '型号' then tb_Values.Price end) AS '型号',";
  str=str+"min(case Name when '售价' then tb_Values.Price end) AS '售价'";
  sql = "select tb_Values.Logo,tb_Values.Type," + str + " from tb_Basic2 inner join tb_Values on tb_Basic2.ID=tb_Values.Homo1 and("+rla+") group by tb_Values.Logo,tb_Values.Type";
  rs = data.getrs(sql);
  sql="";
  str="";
  rla="";
  return rs;
}
catch (Exception e) {
  e.printStackTrace();
}
return null;
  }

  public ResultSet getrs(){
    try{
  str="min(case Name when '品牌' then tb_Values.Price end) AS '品牌',";
  str=str+"min(case Name when '型号' then tb_Values.Price end) AS '型号',";
  str=str+"min(case Name when '售价' then tb_Values.Price end) AS '售价'";
  sql = "select tb_Values.Logo,tb_Values.Type," + str + " from tb_Basic2 inner join tb_Values on tb_Basic2.ID=tb_Values.Homo1 and (tb_Values.Type=1 or tb_Values.Type=3) group by tb_Values.Logo,tb_Values.Type";
  rs = data.getrs(sql);
  sql="";
  str="";
  return rs;
}
catch (Exception e) {
  e.printStackTrace();
}
return null;
  }


  public void close(){
    data.close();
    try{
      rs.close();
    }
    catch(Exception e){
    }
  }

  public String getsql(){
    return sql;
  }

}