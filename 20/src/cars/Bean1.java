package cars;
import java.sql.*;
/**
 * <p>Title: </p>
 * <p>Description: </p>
 * <p>Copyright: Copyright (c) 2005</p>
 * <p>Company: </p>
 * @author not attributable
 * @version 1.0
 */

public class Bean1 {
  Connection con;
  Statement st;
  ResultSet rs;
  String name;
  int i;
  boolean bln;
  public Bean1() {
  }
  public synchronized Connection getcon() throws Exception {
    try{

      Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
      con=DriverManager.getConnection("jdbc:sqlserver://localhost:1433;DatabaseName=db_Cars","sa","");
      return con;
    }
    catch(Exception ex){
      ex.printStackTrace();
    }
    return null;
  }
  public Statement getst(){
    try{
      con=getcon();
      st=con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
      return st;
    }
    catch(Exception e1){
    }
    return null;
  }
  public ResultSet getrs(String sql){
    try{
      st=getst();
      rs=st.executeQuery(sql);
      return rs;
    }
    catch(Exception e2){
    }
    return null;
  }
  public int getint(String sql){
    try{
      st=getst();
      i=st.executeUpdate(sql);
      return i;
    }
    catch(Exception e3){
    }
    return 0;
  }
  public boolean getbln(String sql){
    try{
      st=getst();
      bln=st.execute(sql);
      return bln;
    }
    catch(Exception e4){
    }
    return false;
  }

  public synchronized void close(){
    try{
      if(rs!=null){
        rs.close();
        rs = null;
      }
      if(st!=null){
        st.close();
        st = null;
      }
      if(con!=null){
        con.close();
        con = null;
      }
    }
    catch(Exception e5){

    }
  }
}
