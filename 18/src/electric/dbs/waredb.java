package electric.dbs;
import electric.dbs.Dbware;
import electric.dbs.ware;
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
public class waredb {
  public waredb() {
  }
 public int selectsql(int st)
 {
      String countSql="SELECT COUNT(*) FROM WARE WHERE STATUS<>1";
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
        String sql="SELECT * FROM [WARE] WHERE STATUS<>1";
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
              ware ware = new ware();
              ware.setId(rs.getInt(1));
              ware.setPname(rs.getString(2));
              ware.setPmodel(rs.getString(3));
              ware.setPcost(rs.getString(4));
              ware.setPheft(rs.getString(5));
              ware.setPfacturer(rs.getString(6));
              ware.setPnote(rs.getString(7));
              ware.setCreateDate(rs.getString(8));
              ware.setStatus(rs.getInt(9));
              coll.add(ware);
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
