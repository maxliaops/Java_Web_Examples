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

public class ware
     {
  private int Id;
  private String Pname;
  private String Pmodel;
  private String Pcost;
  private String Pheft;
  private String Pfacturer;
  private String Pnote;
  private String Createdate;
  private int Status;
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
  }
  public void setPname(String Pname)
  {
    this.Pname=Pname;
  }
   public void setPmodel(String Pmodel)
    {
      this.Pmodel=Pmodel;
    }

    public void setPcost(String Pcost)
    {
      this.Pcost=Pcost;
    }

    public  void setPheft(String Pheft)
    {
      this.Pheft=Pheft;
    }

    public void setPfacturer(String Pfacturer)
    {
      this.Pfacturer=Pfacturer;
    }

    public void setPnote(String pnote)
    {
      this.Pnote=Pnote;
    }
    public void setCreateDate(String CreateDate)
    {
    this.Createdate=CreateDate;
    }
    public void setStatus(int status)
   {
    this.Status=status;
   }
}



