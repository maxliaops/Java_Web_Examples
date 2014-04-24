package electric.dbs;
import electric.dbs.Dbshop;
import electric.dbs.shop;
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
public class Shopdb {
  public Shopdb() {
  }
 public int selectsql(int st)
 {
      String countSql="SELECT COUNT(*) FROM [USER] WHERE STATUS<>1";
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
        String sql="SELECT * FROM [USER] WHERE STATUS<>1";
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
                shop shop = new shop();
                shop.setId(rs.getInt(1));
                shop.setUsername(rs.getString(2));
                shop.setPassword(rs.getString(3));
                shop.setShopname(rs.getString(4));
                shop.setArea(rs.getString(5));
                shop.setPeopleman(rs.getString(6));
                shop.setMantel(rs.getString(7));
                shop.setShoptel(rs.getString(8));
                shop.setUsertypee(rs.getInt(9));
                shop.setCreatedate(rs.getString(10));
                shop.setStatus(rs.getInt(11));
              coll.add(shop);
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
    public Collection select_chain(int step, int page) {
         Collection coll = new ArrayList();
         Connection con=null;
         ResultSet rs=null;
         PreparedStatement pstmt=null;
         int tip = step * (page - 1);
         try {
           String sql="SELECT * FROM [USER] WHERE STATUS<>1 and Usertype=1";
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
                   shop shop = new shop();
                   shop.setId(rs.getInt(1));
                   shop.setUsername(rs.getString(2));
                   shop.setPassword(rs.getString(3));
                   shop.setShopname(rs.getString(4));
                   shop.setArea(rs.getString(5));
                   shop.setPeopleman(rs.getString(6));
                   shop.setMantel(rs.getString(7));
                   shop.setShoptel(rs.getString(8));
                   shop.setUsertypee(rs.getInt(9));
                   shop.setCreatedate(rs.getString(10));
                   shop.setStatus(rs.getInt(11));
                 coll.add(shop);
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
