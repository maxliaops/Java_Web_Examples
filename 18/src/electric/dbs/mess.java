package electric.dbs;
import java.sql.*;
import javax.servlet.http.*;
import electric.*;
import java.text.SimpleDateFormat;
import electric.electricUtils.*;
public class mess
          {
  private int Id;
  private String Mname;
  private String Mtext;
  private String Mnote;
  private String CreateDate;
  private int Status;
  public mess()
  {}
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
  }
  public void setMname(String Mname)
  {
    this.Mname=Mname;
  }
  public void setMtext(String Mtext)
  {
    this.Mtext=Mtext;
  }
   public void setMnote(String Mnote)
  {
    this.Mnote=Mnote;
  }
 public void setCreateDate(String CreateDate)
 {
    this.CreateDate=CreateDate;
 }
 public void setStatus(int Status)
 {
    this.Status=Status;
 }
////////////////////////////////////////////////////////////////////////////////
}
