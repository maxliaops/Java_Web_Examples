package com.dao;


import com.model.SubType;
import com.tools.ChStr;
import com.tools.ConnDB;

public class SubtypeDaoImpl implements SubtypeDao {
  public SubtypeDaoImpl() {
  }
ConnDB conn=new ConnDB();
ChStr chStr=new ChStr();
public int insert(SubType st) {
int ret=-1;
try{
  String sql = "insert into tb_subType (superType,typename) values("+st.getsuperid()+",'" + chStr.chStr(st.gettypename()) +
      "')";
  ret = conn.executeUpdate(sql);
}catch (Exception e){
  ret=0;
}
return ret;
}

}

