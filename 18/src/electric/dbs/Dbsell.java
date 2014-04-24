package electric.dbs;
import java.sql.*;
import javax.servlet.http.*;
import electric.*;
import java.text.SimpleDateFormat;
import electric.electricUtils.*;
public class Dbsell
          {

  private static final String LOAD_SELL_BY_ID =
      "SELECT * FROM [SELL] WHERE [Id]=?";

  private static final String INSERT_SELL =
      "INSERT INTO [SELL] ([Id],[Shopid],[Productid],[Procolor],[Protype],[Pronumber],[Propeople],[Ptime],[Createdate],[Status]) VALUES " +
      "(?,?,?,?,?,?,?,?,?,?)";

  private static final String UPDATE_SELL =
      "UPDATE [SELL] SET [Shopid]=?,[Productid]=?,[Procolor]=?,[Protype]=?,[Pronumber]=?," +
      "[Propeople]=?,[Ptime]=?,[Status]=?" +
      " WHERE [Id]=?";

  private static final String CLEAR_SELL = "DELETE FROM [SELL] WHERE STATUS=" +
      FinalConstants.STATUS_DELETE;

  private int Id;
  private int Shopid;
  private int Productid;
  private String Procolor;
  private int Protype;
  private int Pronumber;
  private String Propeople;
  private String Ptime;
  private String Createdate;
  private int Status;
  public Dbsell()
  {}
  public Dbsell(HttpServletRequest request) {
    this.Id = DbSequenceManager.nextID(FinalConstants.T_SELL);
    this.Shopid = ParamUtils.getIntParameter(request, "shopid");
    this.Productid = ParamUtils.getIntParameter(request, "productid");
    this.Procolor = ParamUtils.getEscapeHTMLParameter(request, "procolor");
    this.Protype = ParamUtils.getIntParameter(request, "protype");
    this.Pronumber = ParamUtils.getIntParameter(request, "pronumber");
    this.Propeople = ParamUtils.getEscapeHTMLParameter(request, "propeople");
    String ayear = ParamUtils.getEscapeHTMLParameter(request, "Ayear");
    String amonth = ParamUtils.getEscapeHTMLParameter(request, "Amonth");
    String aday = ParamUtils.getEscapeHTMLParameter(request, "Aday");
    //this.Ptime = ayear+amonth+aday;
    //java.util.Date dat=new java.util.Date();
    //this.Ptime =dat.toLocaleString().substring(0,9);
    SimpleDateFormat simpleDate = new SimpleDateFormat("yyyyMMdd");
    String shiftDateToDate = simpleDate.format(new java.util.Date());
    this.Ptime =shiftDateToDate;
    this.Createdate = shiftDateToDate;
    this.Status = FinalConstants.STATUS_NORMAL;
    insertIntoDb();
  }

 public Dbsell(int Id) throws SellNotFoundException {
  this.Id = Id;
 // System.out.print(Id);
  if (Id <= 0) {
    return;
  }
  loadFromDb();

}

protected static Dbsell getInstance(int Id) throws
    SellNotFoundException {
  return new Dbsell(Id);
}

protected void delete() {
  setStatus(FinalConstants.STATUS_DELETE);
}

protected static void clear() {
  Connection con = null;
  PreparedStatement pstmt = null;
  try {
    con = DbConnectionManager.getConnection();
    pstmt = con.prepareStatement(CLEAR_SELL);
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
  public int getShopid()
{
  return this.Shopid;
}

  public int getProductid()
  {
    return this.Productid;
  }
  public String getProcolor()
  {
    return this.Procolor;
  }
  public int getProtype()
  {
    return this.Protype;
  }
  public int getPronumber()
 {
   return this.Pronumber;
 }
 public String getPropeople()
 {
   return this.Propeople;
 }
 public String getPtime()
 {
   return this.Ptime;
 }
 public String getCraetedate()
 {
   return this.Createdate;
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
  public void setShopid(int Shopid)
{
  this.Shopid=Shopid;
  saveToDb();
}

  public void setProductid(int Productid)
 {
    this.Productid=Productid;
    saveToDb();
 }
 public void setProcolor(String Procolor)
 {
   this.Procolor=Procolor;
   saveToDb();
 }
 public void setProtype(int Protype)
 {
   this.Protype=Protype;
   saveToDb();
 }
 public void setPronumber(int Pronumber)
{
   this.Pronumber=Pronumber;
   saveToDb();
}
public void setPropeople(String Propeople)
{
   this.Propeople=Propeople;
   saveToDb();
}
public void setPtime(String Ptime)
{
   this.Ptime=Ptime;
   saveToDb();
}
public void setCraetedate(String Createdate)
{
   this.Createdate=Createdate;
   saveToDb();
}
 public void setStatus(int Status)
 {
    this.Status=Status;
     saveToDb();
 }
////////////////////////////////////////////////////////////////////////////////

  public void modify(HttpServletRequest request) {
    this.Id = ParamUtils.getIntParameter(request, "Id");
    this.Shopid = ParamUtils.getIntParameter(request, "shopid");
    this.Productid = ParamUtils.getIntParameter(request, "productid");
    this.Procolor = ParamUtils.getEscapeHTMLParameter(request, "procolor");
    this.Protype = ParamUtils.getIntParameter(request, "protype");
    this.Pronumber = ParamUtils.getIntParameter(request, "pronumber");
    this.Propeople = ParamUtils.getEscapeHTMLParameter(request, "propeople");
    String ayear = ParamUtils.getEscapeHTMLParameter(request, "Ayear");
    String amonth = ParamUtils.getEscapeHTMLParameter(request, "Amonth");
    String aday = ParamUtils.getEscapeHTMLParameter(request, "Aday");
    this.Ptime = ayear+amonth+aday;
    this.Status = FinalConstants.STATUS_NORMAL;
    saveToDb();
  }

  private void loadFromDb() throws SellNotFoundException {
  Connection con = null;
  PreparedStatement pstmt = null;
  try {
    con = DbConnectionManager.getConnection();
    pstmt = con.prepareStatement(LOAD_SELL_BY_ID);
    pstmt.setInt(1,Id);
    ResultSet rs = pstmt.executeQuery();
    if (!rs.next()) {
      throw new SellNotFoundException("从数据表[SELL]中读取用户数据失败,欲读取的用户ID:[ " +
                                       Id + "]!");
    }
     this.Id = rs.getInt("Id");
     this.Shopid = rs.getInt("Shopid");
     this.Productid = rs.getInt("Productid");
     this.Procolor = rs.getString("Procolor");
     this.Protype = rs.getInt("Protype");
     this.Pronumber=rs.getInt("Pronumber");
     this.Propeople = rs.getString("Propeople");
     this.Ptime = rs.getString("Ptime");
     this.Createdate = rs.getString("Createdate");
     this.Status = rs.getInt("STATUS");
}
  catch (SQLException sqle) {
    throw new SellNotFoundException("从数据表[SELL]中读取用户数据失败,欲读取的用户ID:[ " +
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
      pstmt = con.prepareStatement(INSERT_SELL);
      pstmt.setInt(1, this.Id);
      pstmt.setInt(2, this.Shopid);
      pstmt.setInt(3, this.Productid);
      pstmt.setString(4,StringUtils.toChinese(this.Procolor));
      pstmt.setInt(5, this.Protype);
      pstmt.setInt(6, this.Pronumber);
      pstmt.setString(7, StringUtils.toChinese(this.Propeople));
      pstmt.setString(8, StringUtils.toChinese(this.Ptime));
      pstmt.setString(9, StringUtils.toChinese(this.Createdate));
      pstmt.setInt(10, this.Status);
      pstmt.executeUpdate();
    }
    catch (SQLException sqle) {
      System.err.println("错误位置: DbSell:insertIntoDb()-" + sqle);
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
    pstmt = con.prepareStatement(UPDATE_SELL);
    System.out.println(UPDATE_SELL);
        pstmt.setInt(1, this.Shopid);
        pstmt.setInt(2, this.Productid);
        pstmt.setString(3,StringUtils.toChinese(this.Procolor));
        pstmt.setInt(4, this.Protype);
        pstmt.setInt(5, this.Pronumber);
        pstmt.setString(6, StringUtils.toChinese(this.Propeople));
        pstmt.setString(7, StringUtils.toChinese(this.Ptime));
        pstmt.setInt(8, this.Status);
        pstmt.setInt(9, this.Id);
   // System.out.print("weiwei");
    pstmt.executeUpdate();
  }
  catch (SQLException sqle) {
    System.err.println("错误位置: DbSell.java:saveToDb(): " + sqle);
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
