package electric.dbs;
import java.sql.*;
import javax.servlet.http.*;
import electric.*;
import electric.electricUtils.*;
/**
 * <p>Title: </p>
 * <p>Description: </p>
 * <p>Copyright: Copyright (c) 2005</p>
 * <p>Company: </p>
 * @author not attributable
 * @version 1.0
 */
public class product
          {
  private int Id;
  private String Productname;
  private String Productprice;
  private String Productform;
  private String Productnote;
  private String Pic;
  private int Status;
  public product()
  {}
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
  }
  public void setProductname(String Productname)
   {
     this.Productname=Productname;
   }
   public void setProductprice(String Productprice)
   {
      this.Productprice=Productprice;
   }
   public void setProductform(String Productform)
   {
      this.Productform=Productform;
   }
   public void setProductnote(String Productnote)
  {
     this.Productnote=Productnote;
  }
   public void setPic(String Pic)
  {
      this.Pic=Pic;
  }
 public void setStatus(int Status)
 {
    this.Status=Status;
 }
////////////////////////////////////////////////////////////////////////////////
}

