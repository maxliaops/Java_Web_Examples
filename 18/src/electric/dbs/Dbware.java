package electric.dbs;
import java.sql.*;
import javax.servlet.http.*;
import electric.*;
import java.text.SimpleDateFormat;
import electric.electricUtils.*;

/**
 * <p>Title: </p>
 * <p>Description: </p>
 * <p>Copyright: Copyright (c) 2005</p>
 * <p>Company: </p>
 * @author not attributable
 * @version 1.0
 */

public class Dbware
     {

  private static final String LOAD_WARE_BY_ID =
      "SELECT * FROM [WARE] WHERE [Id]=?";

  private static final String INSERT_WARE =
      "INSERT INTO [WARE] ([Id],[Pname],[Pmodel],[Pcost],[Pheft]," +
      "[Pfacturer],[Pnote],[Createdate],[STATUS]) VALUES " +
      "(?,?,?,?,?,?,?,?,?)";

  private static final String UPDATE_WARE =
      "UPDATE [WARE] SET [Pname]=?,[Pmodel]=?,[Pcost]=?,[Pheft]=?," +
      "[Pfacturer]=?,[Pnote]=?,[Status]=? WHERE [Id]=?";

  private static final String Del_ware =
      "UPDATE [WARE] SET [Status]=? WHERE [Id]=?";

  private static final String CLEAR_WARE = "DELETE FROM [WARE] WHERE STATUS=" +
      FinalConstants.STATUS_DELETE;

  private int Id;
  private String Pname;
  private String Pmodel;
  private String Pcost;
  private String Pheft;
  private String Pfacturer;
  private String Pnote;
  private String Createdate;
  private int Status;
  public Dbware(HttpServletRequest request) {
    this.Id = DbSequenceManager.nextID(FinalConstants.T_WARE);
    this.Pname = ParamUtils.getEscapeHTMLParameter(request, "pname");
    this.Pmodel = ParamUtils.getEscapeHTMLParameter(request, "pmodel");
    this.Pcost = ParamUtils.getEscapeHTMLParameter(request, "pcost");
    this.Pheft = ParamUtils.getEscapeHTMLParameter(request, "pheft");
    this.Pfacturer = ParamUtils.getEscapeHTMLParameter(request, "pfacturer");
    this.Pnote = ParamUtils.getEscapeHTMLParameter(request, "pnote");
    SimpleDateFormat simpleDate = new SimpleDateFormat("yyyyMMdd");
    String shiftDateToDate = simpleDate.format(new java.util.Date());
    this.Createdate = shiftDateToDate;
    this.Status = FinalConstants.STATUS_NORMAL;
    insertIntoDb();
  }
  public Dbware()
  {}
  public Dbware(int Id) throws WareNotFoundException {
  this.Id = Id;
  if (Id <= 0) {
    return;
  }
  loadFromDb();
}

public static Dbware getInstance(int Id) throws
    WareNotFoundException {
  return new Dbware(Id);
}

protected void delete() {
  setStatus(FinalConstants.STATUS_DELETE);
}

protected static void clear() {
  Connection con = null;
  PreparedStatement pstmt = null;
  try {
    con = DbConnectionManager.getConnection();
    pstmt = con.prepareStatement(CLEAR_WARE);
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

  public String getPname()
  {
    return this.Pname;
  }

  public String getPmodel()
  {
    return this.Pmodel;
  }

  public String getPcost()
  {
    return this.Pcost;
  }

  public String getPheft()
  {
    return this.Pheft;
  }

  public String getPfacturer()
  {
    return this.Pfacturer;
  }

  public String getPnote()
  {
    return this.Pnote;
  }
  public String getCreateDate()
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
  public void setPname(String Pname)
  {
    this.Pname=Pname;
     saveToDb();
  }
   public void setPmodel(String Pmodel)
    {
      this.Pmodel=Pmodel;
      saveToDb();
    }

    public void setPcost(String Pcost)
    {
      this.Pcost=Pcost;
      saveToDb();
    }

    public  void setPheft(String Pheft)
    {
      this.Pheft=Pheft;
      saveToDb();
    }

    public void setPfacturer(String Pfacturer)
    {
      this.Pfacturer=Pfacturer;
      saveToDb();
    }

    public void setPnote(String pnote)
    {
      this.Pnote=Pnote;
      saveToDb();
    }
    public void setCreateDate(String CreateDate)
    {
    this.Createdate=CreateDate;
     saveToDb();
    }
    public void setStatus(int status)
   {
    this.Status=status;
     DELToDb();
   }
////////////////////////////////////////////////////////////////////////////////

public void modify(HttpServletRequest request) {
    this.Id = ParamUtils.getIntParameter(request, "id");
    this.Pname = ParamUtils.getEscapeHTMLParameter(request, "pname");
    this.Pmodel = ParamUtils.getEscapeHTMLParameter(request, "pmodel");
    this.Pcost = ParamUtils.getEscapeHTMLParameter(request, "pcost");
    this.Pheft = ParamUtils.getEscapeHTMLParameter(request, "pheft");
    this.Pfacturer = ParamUtils.getEscapeHTMLParameter(request, "pfacturer");
    this.Pnote = ParamUtils.getEscapeHTMLParameter(request, "pnote");
    this.Status = FinalConstants.STATUS_NORMAL;
    saveToDb();
  }

  private void loadFromDb() throws WareNotFoundException {
  Connection con = null;
  PreparedStatement pstmt = null;
  try {
    con = DbConnectionManager.getConnection();
    pstmt = con.prepareStatement(LOAD_WARE_BY_ID);
    pstmt.setInt(1,Id);
    ResultSet rs = pstmt.executeQuery();
    if (!rs.next()) {
      throw new WareNotFoundException("从数据表[ware]中读取用户数据失败,欲读取的用户ID:[ " +
                                       Id + "]!");
    }

    this.Id = rs.getInt("Id");
    this.Pname= rs.getString("Pname");
    this.Pmodel=rs.getString("Pmodel");
    this.Pcost=rs.getString("Pcost");
    this.Pheft=rs.getString("Pheft");
    this.Pfacturer=rs.getString("Pfacturer");
    this.Pnote=rs.getString("Pnote");
    this.Createdate=rs.getString("Createdate");
    this.Status=rs.getInt("Status");
}
  catch (SQLException sqle) {
    throw new WareNotFoundException("从数据表[WARE]中读取用户数据失败,欲读取的用户ID:[ " +
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
      pstmt = con.prepareStatement(INSERT_WARE);
      pstmt.setInt(1, this.Id);
      pstmt.setString(2,StringUtils.toChinese(this.Pname));
      pstmt.setString(3,StringUtils.toChinese(this.Pmodel));
      pstmt.setString(4, StringUtils.toChinese(this.Pcost));
      pstmt.setString(5, StringUtils.toChinese(this.Pheft));
      pstmt.setString(6, StringUtils.toChinese(this.Pfacturer));
      pstmt.setString(7, StringUtils.toChinese(this.Pnote));
      pstmt.setString(8, StringUtils.toChinese(this.Createdate));
      pstmt.setInt(9, this.Status);
      pstmt.executeUpdate();
    }
    catch (SQLException sqle) {
      System.err.println("错误位置: Dbware:insertIntoDb()-" + sqle);
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
    pstmt = con.prepareStatement(UPDATE_WARE);
    System.out.println(UPDATE_WARE);
    pstmt.setString(1, StringUtils.toChinese(this.Pname));
    pstmt.setString(2, StringUtils.toChinese(this.Pmodel));
    pstmt.setString(3, StringUtils.toChinese(this.Pcost));
    pstmt.setString(4, StringUtils.toChinese(this.Pheft));
    pstmt.setString(5, StringUtils.toChinese(this.Pfacturer));
    pstmt.setString(6, StringUtils.toChinese(this.Pnote));
    pstmt.setInt(7, this.Status);
    pstmt.setInt(8, this.Id);
    pstmt.executeUpdate();
  }
  catch (SQLException sqle) {
    System.err.println("错误位置: DbWare.java:saveToDb(): " + sqle);
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
  pstmt = con.prepareStatement(Del_ware);
  System.out.println(Del_ware);
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



