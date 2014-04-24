package com.dao;

import com.core.ConnDB;
import java.sql.*;
import com.actionForm.LibraryForm;
/**
 * <p>Title: LibraryManage</p>
 *
 * <p>Description: </p>
 *
 * <p>Copyright: Copyright (c) 2011</p>
 *
 * <p>Company:mr </p>
 *
 * @author:wgh
 */
public class LibraryDAO {
    ConnDB conn=null;
    public LibraryDAO() {
        conn=new ConnDB();
    }
    public LibraryForm query(){
        LibraryForm libraryForm1=null;
        String sql = "select * from tb_library where id=1";
        ResultSet rs =conn.executeQuery(sql);
        try {
            while (rs.next()) {
                libraryForm1 = new LibraryForm();
                libraryForm1.setId(Integer.valueOf(rs.getString(1)));
                libraryForm1.setLibraryname(rs.getString(2));
                libraryForm1.setCurator(rs.getString(3));
                libraryForm1.setTel(rs.getString(4));
                libraryForm1.setAddress(rs.getString(5));
                libraryForm1.setEmail(rs.getString(6));
                libraryForm1.setUrl(rs.getString(7));
                libraryForm1.setCreateDate(rs.getString(8));
                libraryForm1.setIntroduce(rs.getString(9));
            }
        } catch (Exception ex) {
        }
        conn.close();
        return libraryForm1;
    }
    public int update(LibraryForm libraryForm){
        String sql="UPDATE tb_library SET libraryname='"+libraryForm.getLibraryname()+"',curator='"+libraryForm.getCurator()+"',tel='"+libraryForm.getTel()+"',address='"+libraryForm.getAddress()+"',email='"+libraryForm.getEmail()+"',url='"+libraryForm.getUrl()+"',createDate='"+libraryForm.getCreateDate()+"',introduce='"+libraryForm.getIntroduce()+"' where id=1";
        int ret=0;
        try{
        	ret=conn.executeUpdate(sql);
        }catch(Exception e){
        	System.out.println("修改图书馆信息："+e.getMessage());
        }
        System.out.println("修改图书馆信息时的SQL："+sql);
        conn.close();
        return ret;
    }


}
