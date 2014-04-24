package com.dao;


import com.model.Member;
import com.tools.ChStr;
import com.tools.ConnDB;

import java.util.List;
import java.util.ArrayList;
import java.sql.*;

public class MemberDaoImpl
    implements MemberDao {
  private ConnDB conn = new ConnDB();
  ChStr chStr = new ChStr();  
  //执行插入操作
  public int insert(Member m) {
    int ret = -1;
    try {
      String sql = "Insert into tb_Member (UserName,TrueName,PassWord,City,address,postcode,CardNO,CardType,Tel,Email) values('" +
          chStr.chStr(m.getUsername()) + "','" + chStr.chStr(m.getTruename()) +
          "','" + chStr.chStr(m.getPwd()) +
          "','" + chStr.chStr(m.getCity()) + "','" + chStr.chStr(m.getAddress()) +
          "','" +
          chStr.chStr(m.getPostcode()) +
          "','" + chStr.chStr(m.getCardno()) + "','" +
          chStr.chStr(m.getCardtype()) + "','" + chStr.chStr(m.getTel()) +
          "','" + chStr.chStr(m.getEmail()) + "')";
      ret = conn.executeUpdate(sql);
    }
    catch (Exception e) {
      ret = 0;
    }
    conn.close();
    return ret;
  }

  //执行修改操作
  public int update(Member m) {
    int ret = -1;
    try {
      String sql = "update tb_member set TrueName='" +
          chStr.chStr(m.getTruename()) +
          "',PassWord='" + chStr.chStr(m.getPwd()) + "',City='" +
          chStr.chStr(m.getCity()) + "',address='" + chStr.chStr(m.getAddress()) +
          "',postcode='" + chStr.chStr(m.getPostcode()) +
          "',CardNO='" + chStr.chStr(m.getCardno()) + "',CardType='" +
          chStr.chStr(m.getCardtype()) + "',Tel='" + chStr.chStr(m.getTel()) +
          "',Email='" + chStr.chStr(m.getEmail()) + "' where ID=" + m.getID();
      ret = conn.executeUpdate(sql);
    }
    catch (Exception e) {
      ret = 0;
    }
    conn.close();
    return ret;
  }

  //执行删除操作
  public int delete(Member m) {
    String sql = "delect from tb_member where ID=" + m.getID();
    int ret = conn.executeUpdate(sql);
    conn.close();
    return 0;
  }

  //执行查询操作
  public List select() {
    Member form = null;
    List list = new ArrayList();
    String sql = "select * from tb_member";
    ResultSet rs = conn.executeQuery(sql);
    try {
      while (rs.next()) {
        form = new Member();
        form.setID(Integer.valueOf(rs.getString(1)));

        list.add(form);
      }
    }
    catch (SQLException ex) {
    }
    conn.close();
    return list;
  }

  public Member select1() {
    return null;
  }

}
