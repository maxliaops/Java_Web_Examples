package electric.dbs;
import electric.dbs.Dbnews;
import electric.dbs.mess;
import java.util.Collection;
import java.util.ArrayList;
import java.sql.SQLException;
import java.sql.ResultSet;
import java.util.Iterator;
import java.sql.*;
import javax.servlet.http.*;
import electric.electricUtils.*;
/**
 * <p>Title: </p>
 * <p>Description: </p>
 * <p>Copyright: Copyright (c) 2005</p>
 * <p>Company: </p>
 * @author not attributable
 * @version 1.0
 */
public class Messdb {
  private static final String LOAD_SELL_BY_ID =
  "SELECT * FROM [MESS] WHERE [Id]=?";

  private int Id=0;

  public Messdb() {
  }
  /////

  public mess show(int Id) {
    this.Id = Id;
    mess mes = new mess();
    Connection con = null;
    PreparedStatement pstmt = null;
    try {
      con = DbConnectionManager.getConnection();
      pstmt = con.prepareStatement(LOAD_SELL_BY_ID);
      pstmt.setInt(1, Id);
      ResultSet rs = pstmt.executeQuery();
      if (rs.next()) {
        mes.setMname(rs.getString(2));
        mes.setMtext(rs.getString(3));
        mes.setMnote(rs.getString(4));
        mes.setCreateDate(rs.getString(5));
      }
    }
    catch (SQLException sqle) {
      System.out.println("rs has Exceptione");
    }
    finally {
      try {
        pstmt.close();
      }
      catch (Exception e) {
        e.printStackTrace();
      }
      try {
        con.close();
      }
      catch (Exception e) {
        e.printStackTrace();
      }
    }
    return mes;

  }

  ////
 public int selectsql(int st)
 {
      String countSql="SELECT COUNT(*) FROM MESS WHERE STATUS<>1";
      Connection co=null;
      ResultSet r = null;
      PreparedStatement pstm = null;
      int size=0;
      int sizepa=0;
   try {
     co = DbConnectionManager.getConnection();
     pstm = co.prepareStatement(countSql);
     r = pstm.executeQuery();
     while (r.next()) {
       size = r.getInt(1);
       sizepa=(int)size/st;
       if(size%st>0)
       {
           sizepa=sizepa+1;
       }
     }
     r.close();
     r=null;
     pstm.close();
     pstm=null;
     co.close();
     co=null;


   }

   catch (SQLException sqle) {
      System.err.println(sqle.getMessage()+"333");
    }
      return sizepa;
 }
 public Collection select(int step, int page) {
      Collection coll = new ArrayList();
      Connection con=null;
      ResultSet rs=null;
      PreparedStatement pstmt=null;
      int tip = step * (page - 1);
      try {
        String sql="SELECT * FROM [MESS] WHERE STATUS<>1";
        con = DbConnectionManager.getConnection();
        pstmt = con.prepareStatement(sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
        rs = pstmt.executeQuery();
        System.out.print(tip);
          if (tip <= 0) {
              rs.beforeFirst();
          } else {
              if (!rs.absolute(tip)) {
                  rs.beforeFirst();
              }
          }
          for (int i = 1; rs.next() && i <= step; i++) {
              mess mess = new mess();
              mess.setId(rs.getInt(1));
              mess.setMname(rs.getString(2));
              mess.setMtext(rs.getString(3));
              mess.setMnote(rs.getString(4));
              mess.setCreateDate(rs.getString(5));
              mess.setStatus(rs.getInt(6));
              coll.add(mess);
         }
         rs.close();
         rs=null;
         pstmt.close();
         pstmt=null;
         con.close();
         con=null;
      } catch (SQLException ex) {
          System.out.println(ex.getMessage()+"666");
      } finally {
          return coll;
      }
    }
}
