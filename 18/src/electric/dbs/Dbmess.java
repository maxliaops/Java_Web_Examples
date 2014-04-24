package electric.dbs;
import java.sql.*;
import javax.servlet.http.*;
import electric.*;
import java.text.SimpleDateFormat;
import electric.electricUtils.*;
public class Dbmess
          {

  private static final String LOAD_MESS_BY_ID =
      "SELECT * FROM [MESS] WHERE [ID]=?";

  private static final String INSERT_MESS =
      "INSERT INTO [MESS] ([Id],[Mname],[Mtext],[Mnote],[Createdate],[Status]) VALUES " +
      "(?,?,?,?,?,?)";

  private static final String UPDATE_MESS =
      "UPDATE [MESS] SET [Mname]=?,[Mtext]=?,[Mnote]=?,[Createdate]=?," +
      "[Status]=?" + " WHERE [Id]=?";

  private static final String DEL_MESS =
      "UPDATE [MESS] SET [Status]=? WHERE [Id]=?";

  private static final String CLEAR_MESS = "DELETE FROM [MESS] WHERE STATUS=" +
      FinalConstants.STATUS_DELETE;

  private int Id;
  private String Mname;
  private String Mtext;
  private String Mnote;
  private String CreateDate;
  private int Status;
  public Dbmess()
  {}
  public Dbmess(HttpServletRequest request) {
    this.Id = DbSequenceManager.nextID(FinalConstants.T_MESS);
    this.Mname = ParamUtils.getEscapeHTMLParameter(request, "mname");
    this.Mtext = ParamUtils.getEscapeHTMLParameter(request, "mtext");
    this.Mnote = ParamUtils.getEscapeHTMLParameter(request, "mnote");
    SimpleDateFormat simpleDate = new SimpleDateFormat("yyyyMMdd");
    String shiftDateToDate = simpleDate.format(new java.util.Date());
    this.CreateDate = shiftDateToDate;
    this.Status = FinalConstants.STATUS_NORMAL;
    insertIntoDb();
  }

 public Dbmess(int Id) throws MessNotFoundException {
  this.Id = Id;
  if (Id <= 0) {
    return;
  }
  loadFromDb();

}

protected static Dbmess getInstance(int Id) throws
    MessNotFoundException {
  return new Dbmess(Id);
}

protected void delete() {
  setStatus(FinalConstants.STATUS_DELETE);
}

protected static void clear() {
  Connection con = null;
  PreparedStatement pstmt = null;
  try {
    con = DbConnectionManager.getConnection();
    pstmt = con.prepareStatement(CLEAR_MESS);
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
  public String getMname()
  {
    return this.Mname;
  }
  public String getMtext()
  {
    return this.Mtext;
  }
  public String getMnote()
  {
    return this.Mnote;
  }
  public String getCreateDate()
 {
   return this.CreateDate;
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
  public void setMname(String Mname)
  {
    this.Mname=Mname;
     saveToDb();
  }
  public void setMtext(String Mtext)
  {
    this.Mtext=Mtext;
     saveToDb();
  }
   public void setMnote(String Mnote)
  {
    this.Mnote=Mnote;
     saveToDb();
  }
 public void setCreateDate(String CreateDate)
 {
    this.CreateDate=CreateDate;
     saveToDb();
 }
 public void setStatus(int Status)
 {
    this.Status=Status;
     DELToDb();
 }
////////////////////////////////////////////////////////////////////////////////
 private void loadFromDb() throws MessNotFoundException {
  Connection con = null;
  PreparedStatement pstmt = null;
  try {
    con = DbConnectionManager.getConnection();
    pstmt = con.prepareStatement(LOAD_MESS_BY_ID);
    pstmt.setInt(1,Id);
    ResultSet rs = pstmt.executeQuery();
    if (!rs.next()) {
      throw new MessNotFoundException("从数据表[MESS]中读取用户数据失败,欲读取的用户ID:[ " +
                                       Id + "]!");
    }
     this.Id = rs.getInt("ID");
     this.Mname = rs.getString("Mname");
     this.Mtext = rs.getString("Mtext");
     this.Mnote=rs.getString("Mnote");
     this.CreateDate = rs.getString("CREATEDATE");
     this.Status = rs.getInt("STATUS");
}
  catch (SQLException sqle) {
    throw new MessNotFoundException("从数据表[MESS]中读取用户数据失败,欲读取的用户ID:[ " +
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
      pstmt = con.prepareStatement(INSERT_MESS);
      pstmt.setInt(1, this.Id);
      pstmt.setString(2,StringUtils.toChinese(this.Mname));
      pstmt.setString(3, StringUtils.toChinese(this.Mtext));
      pstmt.setString(4, StringUtils.toChinese(this.Mnote));
      pstmt.setString(5, StringUtils.toChinese(this.CreateDate));
      pstmt.setInt(6, this.Status);
      pstmt.executeUpdate();
    }
    catch (SQLException sqle) {
      System.err.println("错误位置: DbMess:insertIntoDb()-" + sqle);
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
    pstmt = con.prepareStatement(UPDATE_MESS);
    pstmt.setString(1, StringUtils.toChinese(this.Mname));
    pstmt.setString(2, StringUtils.toChinese(this.Mtext));
    pstmt.setString(3, StringUtils.toChinese(this.Mnote));
    pstmt.setString(4, StringUtils.toChinese(this.CreateDate));
    pstmt.setInt(5, this.Status);
    pstmt.setInt(6, this.Id);
    pstmt.executeUpdate();
  }
  catch (SQLException sqle) {
    System.err.println("错误位置: DbMess.java:saveToDb(): " + sqle);
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
  pstmt = con.prepareStatement(DEL_MESS);
  System.out.println(DEL_MESS);
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
