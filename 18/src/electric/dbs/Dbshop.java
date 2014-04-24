package electric.dbs;

/**
 * <p>Title: </p>
 * <p>Description: </p>
 * <p>Copyright: Copyright (c) 2005</p>
 * <p>Company: </p>
 * @author not attributable
 * @version 1.0
 */

import java.sql.*;
import javax.servlet.http.*;
import electric.*;
import java.text.SimpleDateFormat;
import electric.electricUtils.*;
public class Dbshop
          {

  private static final String LOAD_SHOP_BY_ID =
      "SELECT * FROM [USER] WHERE [ID]=?";

  private static final String INSERT_SHOP =
      "INSERT INTO [USER] ([Id],[Username],[Password],[Shopname],[Area],[Peopleman],[Mantel],[Shoptel],[Usertype],[Createdate],[Status]) VALUES " +
      "(?,?,?,?,?,?,?,?,?,?,?)";

  private static final String UPDATE_SHOP =
      "UPDATE [USER] SET [Username]=?,[Password]=?,[Shopname]=?," +
      "[Area]=?,[Peopleman]=?,[Mantel]=?,[Shoptel]=?,[Usertype]=?,[Status]=?" +
      " WHERE [Id]=?";

  private static final String Del_SHOP =
     "UPDATE [USER] SET [Status]=? WHERE [Id]=?";


  private static final String CLEAR_SHOP = "DELETE FROM [USER] WHERE STATUS=" +
      FinalConstants.STATUS_DELETE;

  private int Id;
  private String Username;
  private String Password;
  private String Shopname;
  private String Area;
  private String Peopleman;
  private String Mantel;
  private String Shoptel;
  private int Usertype;
  private String Createdate;
  private int Status;

  public Dbshop()
  {}
  public Dbshop(HttpServletRequest request) {
    this.Id = DbSequenceManager.nextID(FinalConstants.T_SHOP);
    this.Username = ParamUtils.getEscapeHTMLParameter(request, "username");
    this.Password = ParamUtils.getEscapeHTMLParameter(request, "password");
    this.Shopname = ParamUtils.getEscapeHTMLParameter(request, "shopname");
    this.Area = ParamUtils.getEscapeHTMLParameter(request, "area");
    this.Peopleman = ParamUtils.getEscapeHTMLParameter(request, "peopleman");
    this.Mantel = ParamUtils.getEscapeHTMLParameter(request, "mantel");
    this.Shoptel = ParamUtils.getEscapeHTMLParameter(request, "shoptel");
    this.Usertype = ParamUtils.getIntParameter(request,"usertype");
    SimpleDateFormat simpleDate = new SimpleDateFormat("yyyyMMdd");
    String shiftDateToDate = simpleDate.format(new java.util.Date());
    this.Createdate = shiftDateToDate;
    this.Status = FinalConstants.STATUS_NORMAL;
    insertIntoDb();
  }

 public Dbshop(int Id) throws ShopNotFoundException {
  this.Id = Id;
 // System.out.print(Id);
  if (Id <= 0) {
    return;
  }
  loadFromDb();

}

protected static Dbshop getInstance(int Id) throws
    ShopNotFoundException {
  return new Dbshop(Id);
}

protected void delete() {
  setStatus(FinalConstants.STATUS_DELETE);
}

protected static void clear() {
  Connection con = null;
  PreparedStatement pstmt = null;
  try {
    con = DbConnectionManager.getConnection();
    pstmt = con.prepareStatement(CLEAR_SHOP);
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
  public String getUsername(){
  return this.Username;
}
  public String getPassword(){
  return this.Password;
}

  public String getShopname(){
    return this.Shopname;
  }
  public String getArea(){
   return this.Area;
 }
  public String getPeopleman(){
   return this.Peopleman;
 }
  public String getMantel(){
  return this.Mantel;
 }
  public String getShoptel(){
  return this.Shoptel;
 }
 public int getUsertype(){
 return this.Usertype;
}
  public String getCreatedate(){
   return this.Createdate;
 }
  public int getStatus(){
   return this.Status;
 }
 //////////////////////WRITE METHODS/////////////////////////////
 /////////////////////////////////////////////////////////////////

  public void setId(int Id) {
    this.Id=Id;
    saveToDb();
  }
 public void setUsername(String Username){
    this.Username=Username;
    saveToDb();
 }
 public void setPassword(String Password){
    this.Password=Password;
    saveToDb();
 }
 public void setShopname(String Shopname){
     this.Shopname=Shopname;
     saveToDb();
}
   public void setArea(String Area){
     this.Area=Area;
      saveToDb();
}


 public void setPeopleman(String Peopleman){
    this.Peopleman=Peopleman;
    saveToDb();
 }
 public void setMantel(String Mantel){
    this.Mantel=Mantel;
    saveToDb();
 }
 public void setShoptel(String Shoptel){
    this.Shoptel=Shoptel;
    saveToDb();
 }
 public void setUsertypee(int Usertype){
   this.Usertype=Usertype;
   saveToDb();
}
 public void setCreatedate(String Createdate){
    this.Createdate=Createdate;
    saveToDb();
 }
 public void setStatus(int Status){
    this.Status=Status;
     DELToDb();
 }
////////////////////////////////////////////////////////////////////////////////

  public void modify(HttpServletRequest request) {
    this.Id = ParamUtils.getIntParameter(request, "id");
    this.Username = ParamUtils.getEscapeHTMLParameter(request, "username");
    this.Password = ParamUtils.getEscapeHTMLParameter(request, "password");
    this.Shopname = ParamUtils.getEscapeHTMLParameter(request, "shopname");
    this.Area = ParamUtils.getEscapeHTMLParameter(request, "area");
    this.Peopleman = ParamUtils.getEscapeHTMLParameter(request, "peopleman");
    this.Mantel = ParamUtils.getEscapeHTMLParameter(request, "mantel");
    this.Shoptel = ParamUtils.getEscapeHTMLParameter(request, "shoptel");
    this.Usertype = ParamUtils.getIntParameter(request, "usertype");
    this.Status = FinalConstants.STATUS_NORMAL;
    saveToDb();
  }

  private void loadFromDb() throws ShopNotFoundException {
  Connection con = null;
  PreparedStatement pstmt = null;
  try {
    con = DbConnectionManager.getConnection();
    pstmt = con.prepareStatement(LOAD_SHOP_BY_ID);
    pstmt.setInt(1,Id);
    ResultSet rs = pstmt.executeQuery();
    if (!rs.next()) {
      throw new ShopNotFoundException("从数据表[SHOP]中读取用户数据失败,欲读取的用户ID:[ " +
                                       Id + "]!");
    }
     this.Id = rs.getInt("ID");
     this.Username = rs.getString("Username");
     this.Password = rs.getString("Password");
     this.Shopname = rs.getString("Shopname");
     this.Area = rs.getString("Area");
     this.Peopleman = rs.getString("Peopleman");
     this.Mantel = rs.getString("Mantel");
     this.Shoptel = rs.getString("Shoptel");
     this.Usertype = rs.getInt("Usertype");
     this.Createdate = rs.getString("Createdate");
     this.Status = rs.getInt("Status");
}
  catch (SQLException sqle) {
    throw new ShopNotFoundException("从数据表[SHOP]中读取用户数据失败,欲读取的用户ID:[ " +
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
      pstmt = con.prepareStatement(INSERT_SHOP);
      pstmt.setInt(1, this.Id);
      pstmt.setString(2,StringUtils.toChinese(this.Username));
      pstmt.setString(3,StringUtils.toChinese(this.Password));
      pstmt.setString(4,StringUtils.toChinese(this.Shopname));
      pstmt.setString(5,StringUtils.toChinese(this.Area));
      pstmt.setString(6,StringUtils.toChinese(this.Peopleman));
      pstmt.setString(7,StringUtils.toChinese(this.Mantel));
      pstmt.setString(8,StringUtils.toChinese(this.Shoptel));
      pstmt.setInt(9,this.Usertype);
      pstmt.setString(10,StringUtils.toChinese(this.Createdate));
      pstmt.setInt(11,this.Status);
      pstmt.executeUpdate();
    }
    catch (SQLException sqle) {
      System.err.println("错误位置: DbShop:insertIntoDb()-" + sqle);
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

  private  void saveToDb() {
  Connection con = null;
  PreparedStatement pstmt = null;
  try {
    con = DbConnectionManager.getConnection();
    pstmt = con.prepareStatement(UPDATE_SHOP);
    System.out.println(UPDATE_SHOP);
    pstmt.setString(1,StringUtils.toChinese(this.Username));
    pstmt.setString(2,StringUtils.toChinese(this.Password));
    pstmt.setString(3,StringUtils.toChinese(this.Shopname));
    pstmt.setString(4,StringUtils.toChinese(this.Area));
    pstmt.setString(5,StringUtils.toChinese(this.Peopleman));
    pstmt.setString(6,StringUtils.toChinese(this.Mantel));
    pstmt.setString(7,StringUtils.toChinese(this.Shoptel));
    pstmt.setInt(8, this.Usertype);
    pstmt.setInt(9, this.Status);
    pstmt.setInt(10, this.Id);
   // System.out.print("weiwei");
    pstmt.executeUpdate();
  }
  catch (SQLException sqle) {
    System.err.println("错误位置: DbShop.java:saveToDb(): " + sqle);
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
  pstmt = con.prepareStatement(Del_SHOP);
  System.out.println(Del_SHOP);
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
