package electric.dbs;
import java.sql.*;
import javax.servlet.http.*;
import electric.*;
import java.text.SimpleDateFormat;
import electric.electricUtils.*;
public class sell
          {
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

  public sell()
  {}

/////////////////////////////////////////////////////////////////
  public int getId() {
    return this.Id;
  }
  public int getShopid() {
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
 }
 public void setShopid(int Shopid)
{
  this.Shopid=Shopid;
}

 public void setProductid(int Productid)
{
   this.Productid=Productid;
}
public void setProcolor(String Procolor)
{
  this.Procolor=Procolor;
}
public void setProtype(int Protype)
{
  this.Protype=Protype;
}
public void setPronumber(int Pronumber)
{
  this.Pronumber=Pronumber;
}
public void setPropeople(String Propeople)
{
  this.Propeople=Propeople;
}
public void setPtime(String Ptime)
{
  this.Ptime=Ptime;
}
public void setCraetedate(String Createdate)
{
  this.Createdate=Createdate;
}
public void setStatus(int Status)
{
   this.Status=Status;
}

////////////////////////////////////////////////////////////////////////////////
}
