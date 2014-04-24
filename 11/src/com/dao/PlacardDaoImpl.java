package com.dao;


import com.model.Placard;
import com.tools.ChStr;
import com.tools.ConnDB;

public class PlacardDaoImpl implements PlacardDao{
  ConnDB conn=new ConnDB();
  ChStr chStr=new ChStr();
  public int insert(Placard p) {
    int ret=-1;
    try{
      String sql = "insert into tb_bbs (title,content) values('" +
          chStr.chStr(p.getTitle()) + "','" + chStr.chStr(p.getContent()) +
          "')";
      ret = conn.executeUpdate(sql);
    }catch (Exception e){
      ret=0;
    }
    return ret;
  }

}
