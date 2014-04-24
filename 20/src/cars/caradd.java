package cars;
import java.sql.*;
public class caradd {

  String sql;
  ResultSet rs;
  int logo,homo,homo1;
  int type;
  Bean1 con=new Bean1();
  int Carnumber,carhomo,carhomo1;

  public caradd() {
  }

  public int getint(String name,String datas,String Type,int types){
    try{
      sql="select * from tb_Cars where Name='"+Type.trim()+"'";
      rs=con.getrs(sql);
      if(rs!=null&&rs.next()){
        logo=rs.getInt("ID");
      }
      rs.close();
      con.close();
    }
    catch(Exception e){
      e.printStackTrace();
    }
    try{
      sql="select * from tb_Basic2 where Name='"+name.trim()+"' and Home2="+logo;
      Bean1 con1=new Bean1();
      rs=con1.getrs(sql);
      if(rs!=null&&rs.next()){
        homo=rs.getInt("ID");
        homo1=rs.getInt("Homo1");
      }
      con1.close();
    }
    catch(Exception e){
     e.printStackTrace();
    }
    try{
      String sting=datas.trim();
      if(sting.equals("")){
        sting="----";
      }
      Bean1 con2=new Bean1();
      sql="insert into tb_Values values('"+sting+"',"+homo+","+homo1+","+logo+","+types+")";
      int i=con2.getint(sql);
      con2.close();
      return i;
    }
    catch(Exception e){
      e.printStackTrace();
    }
    return 0;
  }

  public int getmax(){
    try{
    sql="select * from tb_Values order by Logo desc";
    Bean1 con3=new Bean1();
    rs=con3.getrs(sql);
    if(rs!=null&&rs.next()){
     type=rs.getInt("Logo")+1;
    }
    else{
      type=1;
    }
    con3.close();
    rs.close();
    return type;
    }
    catch(Exception e){
      e.printStackTrace();
    }
    return 0;
  }

  public String getsql(){
    return sql;
  }

  public int getupdate(String Varname,String cardata,String CarType,int logo){
    try{
        Bean1 conn1 = new Bean1();
        sql = "select * from tb_Cars where Name='" + CarType.trim() + "'";
        rs = conn1.getrs(sql);
        rs.beforeFirst();
        if (rs != null && rs.next()) {
          Carnumber = rs.getInt("ID");
        }
        conn1.close();
        rs.close();
        Bean1 conn2 = new Bean1();
        sql = "select * from tb_Basic2 where Name='" + Varname.trim() +
            "' and Home2=" + Carnumber;
        rs = conn2.getrs(sql);
        rs.beforeFirst();
        if (rs != null && rs.next()) {
          carhomo = rs.getInt("ID");
          carhomo1 = rs.getInt("Homo1");
        }
        Bean1 conn3 = new Bean1();
        sql = "update tb_Values set Price='" + cardata.trim() +
            "' where Homo1=" + carhomo + " and Logo=" + logo;
        int i =conn3.getint(sql);
        return i;
    }
    catch(Exception e){
      e.printStackTrace();
    }
    return 0;
  }

}