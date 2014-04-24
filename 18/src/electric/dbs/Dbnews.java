package electric.dbs;
import java.sql.*;
import javax.servlet.http.*;
import electric.*;
import java.text.SimpleDateFormat;
import electric.electricUtils.*;
public class Dbnews{
  private static final String LOAD_NEWS_BY_ID =
      "SELECT * FROM [NEWS] WHERE [ID]=?";

  private static final String INSERT_NEWS =
      "INSERT INTO [NEWS] ([Id],[Motif],[Kithepeople],[Content],[Createdate],[Createpeople],[Status]) VALUES " +
      "(?,?,?,?,?,?,?)";

  private static final String UPDATE_NEWS =
      "UPDATE [NEWS] SET [Motif]=?,[Kithepeople]=?,[Content]=?,[Createdate]=?," +
      "[Createpeople]=?,[Status]=?" +
      " WHERE [Id]=?";

  private static final String DEL_NEWS =
      "UPDATE [NEWS] SET [Status]=? WHERE [Id]=?";

  private static final String CLEAR_NEWS = "DELETE FROM [NEWS] WHERE STATUS=" +
      FinalConstants.STATUS_DELETE;

  private int Id;
  private String Motif;
  private String Kithepeople;
  private String Content;
  private String CreateDate;
  private int Createpeople;
  private int Status;
  public Dbnews()
  {}
  public Dbnews(HttpServletRequest request) {
    this.Id = DbSequenceManager.nextID(FinalConstants.T_NEWS);
    this.Motif = ParamUtils.getEscapeHTMLParameter(request, "motif");
    this.Kithepeople = ParamUtils.getEscapeHTMLParameter(request, "kithepeople");
    this.Content = ParamUtils.getEscapeHTMLParameter(request, "content");
    SimpleDateFormat simpleDate = new SimpleDateFormat("yyyyMMdd");
    String shiftDateToDate = simpleDate.format(new java.util.Date());
    this.CreateDate = shiftDateToDate;
    this.Createpeople = this.Id;
    this.Status = FinalConstants.STATUS_NORMAL;
    insertIntoDb();
  }

 public Dbnews(int Id) throws NewsNotFoundException {
  this.Id = Id;
  if (Id <= 0) {
    return;
  }
  loadFromDb();

}

protected static Dbnews getInstance(int Id) throws
    NewsNotFoundException {
  return new Dbnews(Id);
}

protected void delete() {
  setStatus(FinalConstants.STATUS_DELETE);
}

protected static void clear() {
  Connection con = null;
  PreparedStatement pstmt = null;
  try {
    con = DbConnectionManager.getConnection();
    pstmt = con.prepareStatement(CLEAR_NEWS);
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
  public String getMotif()
  {
    return this.Motif;
  }
  public String getKithepeople()
  {
    return this.Kithepeople;
  }
  public String getContent()
  {
    return this.Content;
  }
  public String getCreateDate()
 {
   return this.CreateDate;
 }
 public int getCreatepeople()
 {
   return this.Createpeople;
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
  public void setMotif(String Motif)
  {
    this.Motif=Motif;
     saveToDb();
  }
  public void setKithepeople(String Kithepeople)
  {
    this.Kithepeople=Kithepeople;
     saveToDb();
  }
   public void setContent(String Content)
  {
    this.Content=Content;
     saveToDb();
  }
 public void setCreateDate(String CreateDate)
 {
    this.CreateDate=CreateDate;
     saveToDb();
 }
 public void setCreatepeople(int Createpeople)
 {
    this.Createpeople=Createpeople;
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
    this.Motif = ParamUtils.getEscapeHTMLParameter(request, "Motif");
    this.Kithepeople = ParamUtils.getEscapeHTMLParameter(request, "Kithepeople");
    this.Content = ParamUtils.getEscapeHTMLParameter(request, "Content");
    this.Createpeople =this.Id;
    this.Status = FinalConstants.STATUS_NORMAL;
    saveToDb();
  }

  private void loadFromDb() throws NewsNotFoundException {
  Connection con = null;
  PreparedStatement pstmt = null;
  try {
    con = DbConnectionManager.getConnection();
    pstmt = con.prepareStatement(LOAD_NEWS_BY_ID);
    pstmt.setInt(1,Id);
    ResultSet rs = pstmt.executeQuery();
    if (!rs.next()) {
      throw new NewsNotFoundException("从数据表[NEWS]中读取用户数据失败,欲读取的用户ID:[ " +
                                       Id + "]!");
    }
     this.Id = rs.getInt("ID");
     this.Motif = rs.getString("Motif");
     this.Kithepeople = rs.getString("Kithepeople");
     this.Content=rs.getString("Content");
     this.CreateDate = rs.getString("CREATEDATE");
     this.Createpeople = rs.getInt("CREATEPEOPLE");
     this.Status = rs.getInt("STATUS");
}
  catch (SQLException sqle) {
    throw new NewsNotFoundException("从数据表[NEWS]中读取用户数据失败,欲读取的用户ID:[ " +
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
      pstmt = con.prepareStatement(INSERT_NEWS);
      pstmt.setInt(1, this.Id);
      pstmt.setString(2,StringUtils.toChinese(this.Motif));
      pstmt.setString(3, StringUtils.toChinese(this.Kithepeople));
      pstmt.setString(4, StringUtils.toChinese(this.Content));
      pstmt.setString(5, StringUtils.toChinese(this.CreateDate));
      pstmt.setInt(6, this.Createpeople);
      pstmt.setInt(7, this.Status);
      pstmt.executeUpdate();
    }
    catch (SQLException sqle) {
      System.err.println("错误位置: DbNews:insertIntoDb()-" + sqle);
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
    pstmt = con.prepareStatement(UPDATE_NEWS);
    pstmt.setString(1, StringUtils.toChinese(this.Motif));
    pstmt.setString(2, StringUtils.toChinese(this.Kithepeople));
    pstmt.setString(3, StringUtils.toChinese(this.Content));
    pstmt.setString(4, StringUtils.toChinese(this.CreateDate));
    pstmt.setInt(5, this.Createpeople);
    pstmt.setInt(6, this.Status);
    pstmt.setInt(7, this.Id);
    pstmt.executeUpdate();
  }
  catch (SQLException sqle) {
    System.err.println("错误位置: DbNews.java:saveToDb(): " + sqle);
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
  pstmt = con.prepareStatement(DEL_NEWS);
  System.out.println(DEL_NEWS);
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
