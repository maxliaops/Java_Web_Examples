package com.dao;

import com.core.ConnDB;
import java.util.*;
import java.sql.*;
import com.actionForm.PublishingForm;

public class PublishingDAO {
    private ConnDB conn=new ConnDB();
//²éÑ¯Êý¾Ý
public Collection query(String strif){
PublishingForm pubForm=null;
Collection pubColl=new ArrayList();
String sql="";
if(strif!="all" && strif!=null && strif!=""){
    sql="select * from tb_publishing where "+strif+"";
}else{
    sql="select * from tb_publishing";
}
ResultSet rs=conn.executeQuery(sql);
try {
    while (rs.next()) {
        pubForm=new PublishingForm();
        pubForm.setIsbn(rs.getString(1));
        pubForm.setPubname(rs.getString(2));
        pubColl.add(pubForm);
    }
} catch (SQLException ex) {
}
conn.close();
return pubColl;
}

}
