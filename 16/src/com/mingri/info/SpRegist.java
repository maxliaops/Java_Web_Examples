package com.mingri.info;

import com.mingri.dbconn.DBResult;
import java.sql.*;

public class SpRegist
{
  private SpinfoBean spinfo;
  DBResult rst=new DBResult();

  public void setSpinfo(SpinfoBean spinfo)
  {
    this.spinfo=spinfo;
  }

  public void regist() throws Exception
  {
    String sql="insert into tb_brand values(?,?,?,?,?,?,?,?,?,?,?)";
    String str="select max(id) as maxint from tb_brand";
    ResultSet rs=rst.getResult(str);
    String newmax=null;
    while(rs.next())
    {
      String max = rs.getString("maxint"); //获得最大的字段
      String maxi = max.substring(2, max.length()); //截取子字符串
      newmax = "SP" + String.valueOf(Integer.parseInt(maxi) + 1);
    }
    try
    {
      PreparedStatement pstmt = rst.getPreparedStatement(sql);
      pstmt.setString(1, newmax);
      pstmt.setString(2, spinfo.getSpname());
      pstmt.setString(3, spinfo.getJc());
      pstmt.setString(4, spinfo.getCd());
      pstmt.setString(5, spinfo.getDw());
      pstmt.setString(6, spinfo.getGg());
      pstmt.setString(7, spinfo.getBz());
      pstmt.setString(8, spinfo.getPh());
      pstmt.setString(9, spinfo.getPzwh());
      pstmt.setString(10, spinfo.getGysname());
      pstmt.setString(11, spinfo.getMemo());
      pstmt.executeUpdate();
    }
    catch (Exception e) {
      e.printStackTrace();
      throw e;
    }
  }
}
