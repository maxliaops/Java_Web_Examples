package electric.dbs;
import java.sql.*;
import javax.servlet.http.*;
import electric.*;
import java.text.SimpleDateFormat;
import electric.electricUtils.*;
public class news
          {
  private int Id;
  private String Motif;
  private String Kithepeople;
  private String Content;
  private String CreateDate;
  private int Createpeople;
  private int Status;
  public news()
  {}

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
  }
  public void setMotif(String Motif)
  {
    this.Motif=Motif;
  }
  public void setKithepeople(String Kithepeople)
  {
    this.Kithepeople=Kithepeople;
  }
   public void setContent(String Content)
  {
    this.Content=Content;
  }
 public void setCreateDate(String CreateDate)
 {
    this.CreateDate=CreateDate;
 }
 public void setCreatepeople(int Createpeople)
 {
    this.Createpeople=Createpeople;
 }
 public void setStatus(int Status)
 {
    this.Status=Status;
 }
////////////////////////////////////////////////////////////////////////////////
}
