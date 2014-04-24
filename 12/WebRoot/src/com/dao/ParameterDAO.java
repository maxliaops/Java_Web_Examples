package com.dao;

import com.core.ConnDB;
import com.actionForm.ParameterForm;
import java.sql.ResultSet;

public class ParameterDAO {
    ConnDB conn=null;
public ParameterDAO() {
    conn=new ConnDB();
}
public ParameterForm query(){
    ParameterForm libraryForm1=null;
    String sql = "select * from tb_parameter where id=1";
    ResultSet rs =conn.executeQuery(sql);
    try {
        while (rs.next()) {
            libraryForm1 = new ParameterForm();
            libraryForm1.setId(Integer.valueOf(rs.getString(1)));
            libraryForm1.setCost(rs.getInt(2));
            libraryForm1.setValidity(rs.getInt(3));

        }
    } catch (Exception ex) {
    }
    conn.close();
    return libraryForm1;
}
public int update(ParameterForm parameterForm){
    String sql="UPDATE tb_parameter SET cost="+parameterForm.getCost()+",validity="+parameterForm.getValidity()+" where id=1";
    int ret=conn.executeUpdate(sql);
    System.out.println("修改参数设置信息时的SQL："+sql);
    conn.close();
    return ret;
}

}
