package com.dao;


import com.model.SuperType;
import com.tools.ChStr;
import com.tools.ConnDB;

public class SuperTypeDaoImpl implements SupertypeDao {
  ConnDB conn=new ConnDB();
  ChStr chStr=new ChStr();
  public int insert(SuperType spt) {
  int ret=-1;
  try{
    String sql = "insert into tb_superType (typename) values('" + chStr.chStr(spt.gettypename()) +
        "')";
    ret = conn.executeUpdate(sql);
  }catch (Exception e){
    ret=0;
  }
  return ret;
}

}
