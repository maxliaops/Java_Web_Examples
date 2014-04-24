package electric.dbs;
import java.sql.*;
import javax.servlet.http.*;
import electric.*;
import electric.electricUtils.*;

public class Dbproduct
          {
  private static final String LOAD_PRODUCT_BY_ID =
      "SELECT * FROM [PRODUCT] WHERE [ID]=?";

  private static final String INSERT_PRODUCT =
      "INSERT INTO [PRODUCT] ([Id],[Productname],[Productprice],[Productform],[Productnote],[Pic],[Status]) VALUES " +
      "(?,?,?,?,?,?,?)";

  private static final String UPDATE_PRODUCT =
      "UPDATE [PRODUCT] SET [Productname]=?,[Productprice]=?,[Productform]=?,[Productnote]=?," +
      "[Status]=?" +
      " WHERE [Id]=?";

  private static final String Del_product =
      "UPDATE [PRODUCT] SET [Status]=? WHERE [Id]=?";

  private static final String CLEAR_PRODUCT = "DELETE FROM [PRODUCT] WHERE STATUS=" +
      FinalConstants.STATUS_DELETE;

  private int Id;
  private String Productname;
  private String Productprice;
  private String Productform;
  private String Productnote;
  private String Pic;
  private int Status;
  public Dbproduct()
  {}
  public Dbproduct(HttpServletRequest request) {
    this.Id = DbSequenceManager.nextID(FinalConstants.T_PRODUCT);
    this.Productname = ParamUtils.getEscapeHTMLParameter(request, "productname");
    this.Productprice = ParamUtils.getEscapeHTMLParameter(request, "productprice");
    this.Productform = ParamUtils.getEscapeHTMLParameter(request, "productform");
    this.Productnote = ParamUtils.getEscapeHTMLParameter(request, "productnote");
    this.Pic = ParamUtils.getEscapeHTMLParameter(request, "pic");
    this.Status = FinalConstants.STATUS_NORMAL;
    insertIntoDb();
  }

 public Dbproduct(int Id) throws ProductNotFoundException {
  this.Id = Id;
 // System.out.print(Id);
  if (Id <= 0) {
    return;
  }
  loadFromDb();

}

protected static Dbproduct getInstance(int Id) throws
    ProductNotFoundException {
  return new Dbproduct(Id);
}

protected void delete() {
  setStatus(FinalConstants.STATUS_DELETE);
}

protected static void clear() {
  Connection con = null;
  PreparedStatement pstmt = null;
  try {
    con = DbConnectionManager.getConnection();
    pstmt = con.prepareStatement(CLEAR_PRODUCT);
    pstmt.executeUpdate();
  }
  catch (SQLException sqle) {
    System.err.println(
        "SQLException in DbTChatRooms.java:clearTChatRooms(): " + sqle);
    sqle.printStackTrace();
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
}

/////////////////////////////////////////////////////////////////

  public int getId() {
    return this.Id;
  }
 public String getProductname()
  {
    return this.Productname;
  }
  public String getProductprice()
  {
    return this.Productprice;
  }
  public String getProductform()
  {
    return this.Productform;
  }
  public String getProductnote()
 {
   return this.Productnote;
 }
  public String getPic()
 {
   return this.Pic;
 }
 public int getStatus()
 {
   return this.Status;
 }
 //////////////////////WRITE METHODS/////////////////////////////
 /////////////////////////////////////////////////////////////////

  public void setId(int Id) {
    this.Id=Id;
     saveToDb();
  }
  public void setProductname(String Productname)
   {
     this.Productname=Productname;
      saveToDb();
   }
   public void setProductprice(String Productprice)
   {
      this.Productprice=Productprice;
      saveToDb();
   }
   public void setProductform(String Productform)
   {
      this.Productform=Productform;
      saveToDb();
   }
   public void setProductnote(String Productnote)
  {
     this.Productnote=Productnote;
     saveToDb();
  }
   public void setPic(String Pic)
  {
      this.Pic=Pic;
      saveToDb();
  }
 public void setStatus(int Status)
 {
    this.Status=Status;
    DELToDb();
 }
////////////////////////////////////////////////////////////////////////////////

  public void modify(HttpServletRequest request) {
    this.Id = ParamUtils.getIntParameter(request, "Id");
    this.Productname = ParamUtils.getEscapeHTMLParameter(request, "productname");
    this.Productprice = ParamUtils.getEscapeHTMLParameter(request, "productprice");
    this.Productform = ParamUtils.getEscapeHTMLParameter(request, "productform");
    this.Productnote = ParamUtils.getEscapeHTMLParameter(request, "productnote");
    this.Status = FinalConstants.STATUS_NORMAL;
    saveToDb();
  }

  private void loadFromDb() throws ProductNotFoundException {
  Connection con = null;
  PreparedStatement pstmt = null;
  try {
    con = DbConnectionManager.getConnection();
    pstmt = con.prepareStatement(LOAD_PRODUCT_BY_ID);
    pstmt.setInt(1,Id);
    ResultSet rs = pstmt.executeQuery();
    if (!rs.next()) {
      throw new ProductNotFoundException("从数据表[PRODUCT]中读取用户数据失败,欲读取的用户ID:[ " +
                                       Id + "]!");
    }
     this.Id = rs.getInt("Id");
     this.Productname = rs.getString("Productname");
     this.Productprice = rs.getString("Productprice");
     this.Productform = rs.getString("Productform");
     this.Productnote = rs.getString("Productnote");
     this.Pic = rs.getString("Pic");
     this.Status = rs.getInt("Status");
}
  catch (SQLException sqle) {
    throw new ProductNotFoundException("从数据表[PRODUCT]中读取用户数据失败,欲读取的用户ID:[ " +
                                    Id + "]!");
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

}
private void insertIntoDb() {
    Connection con = null;
    PreparedStatement pstmt = null;
    try {
      con = DbConnectionManager.getConnection();
      pstmt = con.prepareStatement(INSERT_PRODUCT);
      pstmt.setInt(1, this.Id);
      pstmt.setString(2,StringUtils.toChinese(this.Productname));
      pstmt.setString(3, StringUtils.toChinese(this.Productprice));
      pstmt.setString(4, StringUtils.toChinese(this.Productform));
      pstmt.setString(5, StringUtils.toChinese(this.Productnote));
      pstmt.setString(6, StringUtils.toChinese(this.Pic));
      pstmt.setInt(7, this.Status);
      pstmt.executeUpdate();
    }
    catch (SQLException sqle) {
      System.err.println("错误位置: DbProduct:insertIntoDb()-" + sqle);
      sqle.printStackTrace();
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
  }

  private void saveToDb() {
  Connection con = null;
  PreparedStatement pstmt = null;
  try {
    con = DbConnectionManager.getConnection();
    pstmt = con.prepareStatement(UPDATE_PRODUCT);
    pstmt.setString(1,StringUtils.toChinese(this.Productname));
    pstmt.setString(2, StringUtils.toChinese(this.Productprice));
    pstmt.setString(3, StringUtils.toChinese(this.Productform));
    pstmt.setString(4, StringUtils.toChinese(this.Productnote));
    pstmt.setInt(5, this.Status);
    pstmt.setInt(6, this.Id);
   // System.out.print("weiwei");
    pstmt.executeUpdate();
  }
  catch (SQLException sqle) {
    System.err.println("错误位置: DbProduct.java:saveToDb(): " + sqle);
    sqle.printStackTrace();
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
}
private  void DELToDb() {
Connection con = null;
PreparedStatement pstmt = null;
try {
con = DbConnectionManager.getConnection();
pstmt = con.prepareStatement(Del_product);
System.out.println(Del_product);
pstmt.setInt(1, this.Status);
pstmt.setInt(2, this.Id);
pstmt.executeUpdate();
}
catch (SQLException sqle) {
System.err.println("错误位置: DbShop.java:DELToDb(): " + sqle);
sqle.printStackTrace();
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
}

}
