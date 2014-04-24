package com.mingri.info;

import com.mingri.dbconn.DBResult;
import java.sql.*;

public class GysRegist
{
  private GysinfoBean gysinfo;
  DBResult rst=new DBResult();
  public void setGysinfo(GysinfoBean gysinfo)
  {
    this.gysinfo=gysinfo;
  }
  public void regist()throws Exception
  {
    String sql="insert into tb_supplier values(?,?,?,?,?,?,?,?,?,?)";
    try
    {
      PreparedStatement pstmt=rst.getPreparedStatement(sql);
      pstmt.setString(1,gysinfo.getGysname());
      pstmt.setString(2,gysinfo.getJc());
      pstmt.setString(3,gysinfo.getAddress());
      pstmt.setString(4,gysinfo.getPostcode());
      pstmt.setString(5,gysinfo.getTel());
      pstmt.setString(6,gysinfo.getFax());
      pstmt.setString(7,gysinfo.getLxr());
      pstmt.setString(8,gysinfo.getLxrtel());
      pstmt.setString(9,gysinfo.getKhyh());
      pstmt.setString(10,gysinfo.getEamil());
      pstmt.executeUpdate();
    }
    catch(Exception e)
    {
      e.printStackTrace();
      throw e;
    }
  }
}
