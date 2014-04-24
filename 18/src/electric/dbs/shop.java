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
public class shop
          {
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
  public shop()
  {}
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
}
 public void setUsername(String Username){
    this.Username=Username;
}
 public void setPassword(String Password){
    this.Password=Password;
}
 public void setShopname(String Shopname){
     this.Shopname=Shopname;
}
   public void setArea(String Area){
     this.Area=Area;
}


 public void setPeopleman(String Peopleman){
    this.Peopleman=Peopleman;
 }
 public void setMantel(String Mantel){
    this.Mantel=Mantel;
 }
 public void setShoptel(String Shoptel){
    this.Shoptel=Shoptel;
 }
 public void setUsertypee(int Usertype){
   this.Usertype=Usertype;
}
 public void setCreatedate(String Createdate){
    this.Createdate=Createdate;
 }
 public void setStatus(int Status){
    this.Status=Status;
 }
////////////////////////////////////////////////////////////////////////////////
}
