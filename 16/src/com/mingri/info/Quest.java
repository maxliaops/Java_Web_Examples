package com.mingri.info;

import com.mingri.dbconn.DBResult;
import java.sql.*;
import java.io.*;

public class Quest
{
  private String cif="";//查询条件
  private String ccif="";//查询方法
  private String qvalue="";//查询关键字
  private String andor;
  private String sdate;
  private String edate;
  public String getCif() {
    return cif;
  }
  public void setCif(String cif) {
    this.cif = cif;
  }
  public String getCcif() {
    return ccif;
  }
  public void setCcif(String ccif) {
    this.ccif = ccif;
  }
  public String getQvalue() {
    return qvalue;
  }
  public void setQvalue(String qvalue) {
    this.qvalue = qvalue;
  }
  public String getAndor() {
    return andor;
  }
  public void setAndor(String andor) {
    this.andor = andor;
  }
  public String getSdate() {
    return sdate;
  }
  public void setSdate(String sdate) {
    this.sdate = sdate;
  }
  public String getEdate() {
    return edate;
  }
  public void setEdate(String edate) {
    this.edate = edate;
  }
  public String getString(String topsize, String table)
 {
  if(ccif.equals("="))
  {
   String strSql="select top "+topsize+" * from "+table+" where"+" "+cif+"="+"'"+qvalue+"'";
   return strSql;
  }
  else if(ccif.equals("LIKE"))
  {
   String strSql="select top "+topsize+" * from "+table+" where"+" "+cif+" "+"like"+" "+"'%"+qvalue+"%'";
   return strSql;
  }
  else if(ccif.equals("ALL"))
  {
   String strSql="select top "+topsize+" * from "+table;
   return strSql;
  }
  else if(ccif.equals("<"))
  {
   String strSql="select top "+topsize+" * from "+table+" where "+cif+" < '"+qvalue+"'";
   return strSql;
  }
  return null;
 }

 public String getCount(String table)
 {
  if(ccif.equals("="))
  {
   String strSql="select count(*) from "+table+" where"+" "+cif+"="+"'"+qvalue+"'";
   return strSql;
  }
  else if(ccif.equals("LIKE"))
  {
   String strSql="select count(*) from "+table+" where"+" "+cif+" "+"like"+" "+"'%"+qvalue+"%'";
   return strSql;
  }
  else if(ccif.equals("ALL"))
  {
   String strSql="select count(*) from "+table;
   return strSql;
  }
  else if(ccif.equals("<"))
  {
   String strSql="select count(*) from "+table+" where "+cif+" < '"+qvalue+"'";
   return strSql;
  }
  return null;
 }
 public String getDateCount(String table)
 {
   if(ccif.equals("="))
   {
     String strSql="select count(*) from "+table+" where "+cif+" = '"+qvalue+"'"+
               andor+" xsdate between '"+sdate+"' and '"+edate+"'";
     return strSql;
   }
   else if(ccif.equals("LIKE"))
   {
     String strSql="select count(*) from "+table+" where "+cif+" like '%"+qvalue+"%'"+
               andor+" xsdate between '"+sdate+"' and '"+edate+"'";
     return strSql;
   }
   else if(ccif.equals("ALL"))
   {
    String strSql="select count(*) from "+table;
    return strSql;
   }
   return null;
 }
 public String getDateString(String topsize, String table)
 {
   if(ccif.equals("="))
   {
     String strSql="select top "+topsize+" * from "+table+" where "+cif+" = '"+qvalue+"'"+
               andor+" xsdate between '"+sdate+"' and '"+edate+"'";
     return strSql;
   }
   else if(ccif.equals("LIKE"))
   {
     String strSql="select top "+topsize+" * from "+table+" where "+cif+" like '%"+qvalue+"%'"+
               andor+" xsdate between '"+sdate+"' and '"+edate+"'";
     return strSql;
   }
   else if(ccif.equals("ALL"))
   {
    String strSql="select top "+topsize+" * from "+table;
    return strSql;
   }
   return null;
 }
}

