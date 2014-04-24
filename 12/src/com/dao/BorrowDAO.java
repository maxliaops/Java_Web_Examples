package com.dao;

import com.core.ConnDB;
import java.util.*;
import com.actionForm.BorrowForm;
import java.sql.*;
import com.actionForm.ReaderForm;
import com.actionForm.BookForm;
import java.util.Date;

public class BorrowDAO {
    ConnDB conn = new ConnDB();
    public int insert() {
        String sql = "INSERT INTO tb_borrow (bookid) vlaues(1) ";
        int ret = conn.executeUpdate(sql);
        return ret;
    }
    //*****************************图书借阅******************************
    public int insertBorrow(ReaderForm readerForm,BookForm bookForm,String operator){
        //获取系统日期
        Date dateU=new Date();
        java.sql.Date date=new java.sql.Date(dateU.getTime());
       String sql1="select t.days from tb_bookinfo b left join tb_booktype t on b.typeid=t.id where b.id="+bookForm.getId()+"";
        ResultSet rs=conn.executeQuery(sql1);
        int days=0;
        try {
            if (rs.next()) {
                days = rs.getInt(1);
            }
        } catch (SQLException ex) {
        }
        //计算归还时间
          String date_str=String.valueOf(date);
          String dd = date_str.substring(8,10);
          String DD = date_str.substring(0,8)+String.valueOf(Integer.parseInt(dd) + days);
          java.sql.Date backTime= java.sql.Date.valueOf(DD);

          String sql ="Insert into tb_borrow (readerid,bookid,borrowTime,backTime,operator) values("+readerForm.getId()+","+bookForm.getId()+",'"+date+"','"+backTime+"','"+operator+"')";
           int falg = conn.executeUpdate(sql);
          System.out.println("添加图书借阅信息的SQL：" + sql);
          conn.close();
          return falg;
}
      //*************************************图书继借*********************************
      public int renew(int id){
          String sql0="SELECT bookid FROM tb_borrow WHERE id="+id+"";
          ResultSet rs1=conn.executeQuery(sql0);
          int flag=0;
          try {
            if (rs1.next()) {
                //获取系统日期
                Date dateU = new Date();
                java.sql.Date date = new java.sql.Date(dateU.getTime());
                String sql1 = "select t.days from tb_bookinfo b left join tb_booktype t on b.typeid=t.id where b.id=" +
                              rs1.getInt(1) + "";
                ResultSet rs = conn.executeQuery(sql1);
                int days = 0;
                try {
                    if (rs.next()) {
                        days = rs.getInt(1);
                    }
                } catch (SQLException ex) {
                }
                //计算归还时间
                String date_str = String.valueOf(date);
                String dd = date_str.substring(8, 10);
                String DD = date_str.substring(0, 8) +
                            String.valueOf(Integer.parseInt(dd) + days);
                java.sql.Date backTime = java.sql.Date.valueOf(DD);

                String sql = "UPDATE tb_borrow SET backtime='" + backTime +
                             "' where id=" + id + "";
                flag = conn.executeUpdate(sql);
            }
          } catch (Exception ex1) {}
          conn.close();
          return flag;
      }
      //*************************************图书归还*********************************
      public int back(int id,String operator){
          String sql0="SELECT readerid,bookid FROM tb_borrow WHERE id="+id+"";
          ResultSet rs1=conn.executeQuery(sql0);
          int flag=0;
        try {
            if (rs1.next()) {
                //获取系统日期
                Date dateU = new Date();
                java.sql.Date date = new java.sql.Date(dateU.getTime());
                int readerid=rs1.getInt(1);
                int bookid=rs1.getInt(2);
                String sql1="INSERT INTO tb_giveback (readerid,bookid,backTime,operator) VALUES("+readerid+","+bookid+",'"+date+"','"+operator+"')";
                int ret=conn.executeUpdate(sql1);
                if(ret==1){
                    String sql2 = "UPDATE tb_borrow SET ifback=1 where id=" + id +
                                 "";
                    flag = conn.executeUpdate(sql2);
                }else{
                    flag=0;
                }
            }
        } catch (Exception ex1) {
        }
          conn.close();
          return flag;
      }
    //*****************************查询图书借阅信息************************
      public Collection borrowinfo(String str){
      String sql="select borr.*,book.bookname,book.price,pub.pubname,bs.name bookcasename,r.barcode from (select * from tb_borrow where ifback=0) as borr left join tb_bookinfo book on borr.bookid=book.id join tb_publishing pub on book.isbn=pub.isbn join tb_bookcase bs on book.bookcase=bs.id join tb_reader r on borr.readerid=r.id where r.barcode='"+str+"'";
      ResultSet rs=conn.executeQuery(sql);
      Collection coll=new ArrayList();
      BorrowForm form=null;
      try {
          while (rs.next()) {
              form = new BorrowForm();
              form.setId(Integer.valueOf(rs.getInt(1)));
              form.setBorrowTime(rs.getString(4));
              form.setBackTime(rs.getString(5));
              form.setBookName(rs.getString(8));
              form.setPrice(Float.valueOf(rs.getFloat(9)));
              form.setPubName(rs.getString(10));
              form.setBookcaseName(rs.getString(11));
              coll.add(form);
          }
      } catch (SQLException ex) {
          System.out.println("借阅信息："+ex.getMessage());
      }
      conn.close();
      return coll;
      }
      //*************************到期提醒******************************************
    public Collection bremind(){
    Date dateU = new Date();
    java.sql.Date date = new java.sql.Date(dateU.getTime());
    String sql="select borr.borrowTime,borr.backTime,book.barcode,book.bookname,r.name readername,r.barcode readerbarcode from tb_borrow borr join tb_bookinfo book on book.id=borr.bookid join tb_reader r on r.id=borr.readerid where borr.backTime <='"+date+"'";
    ResultSet rs=conn.executeQuery(sql);
    System.out.println("到时提醒的SQL："+sql);
    Collection coll=new ArrayList();
    BorrowForm form=null;
    try {
        while (rs.next()) {
            form = new BorrowForm();
            form.setBorrowTime(rs.getString(1));
            form.setBackTime(rs.getString(2));
            form.setBookBarcode(rs.getString(3));
            form.setBookName(rs.getString(4));
            form.setReaderName(rs.getString(5));
            form.setReaderBarcode(rs.getString(6));
            coll.add(form);
            System.out.println("图书条形码："+rs.getString(3));
        }
    } catch (SQLException ex) {
        System.out.println(ex.getMessage());
    }
    conn.close();
    return coll;
}
//*************************图书借阅查询******************************************
public Collection borrowQuery(String strif){
    String sql="";
    if(strif!="all" && strif!=null && strif!=""){
        sql="select * from (select borr.borrowTime,borr.backTime,book.barcode,book.bookname,r.name readername,r.barcode readerbarcode,borr.ifback from tb_borrow borr join tb_bookinfo book on book.id=borr.bookid join tb_reader r on r.id=borr.readerid) as borr where borr."+strif+"";
    }else{
        sql="select * from (select borr.borrowTime,borr.backTime,book.barcode,book.bookname,r.name readername,r.barcode readerbarcode,borr.ifback from tb_borrow borr join tb_bookinfo book on book.id=borr.bookid join tb_reader r on r.id=borr.readerid) as borr";
}
ResultSet rs=conn.executeQuery(sql);
System.out.println("图书借阅查询的SQL："+sql);
Collection coll=new ArrayList();
BorrowForm form=null;
try {
    while (rs.next()) {
        form = new BorrowForm();
        form.setBorrowTime(rs.getString(1));
        form.setBackTime(rs.getString(2));
        form.setBookBarcode(rs.getString(3));
        form.setBookName(rs.getString(4));
        form.setReaderName(rs.getString(5));
        form.setReaderBarcode(rs.getString(6));
        form.setIfBack(rs.getInt(7));
        coll.add(form);
    }
} catch (SQLException ex) {
    System.out.println(ex.getMessage());
}
conn.close();
return coll;
    }
      //*************************图书借阅排行******************************************
    public Collection bookBorrowSort() {
       String sql = "select * from (SELECT bookid,count(bookid) as degree FROM tb_borrow group by bookid) as borr join (select b.*,c.name as bookcaseName,p.pubname,t.typename from tb_bookinfo b left join tb_bookcase c on b.bookcase=c.id join tb_publishing p on b.ISBN=p.ISBN join tb_booktype t on b.typeid=t.id where b.del=0) as book on borr.bookid=book.id order by borr.degree desc limit 10 ";
        System.out.println("图书借阅排行："+sql);
        Collection coll = new ArrayList();
        BorrowForm form = null;
        ResultSet rs = conn.executeQuery(sql);


        try {
            while (rs.next()) {
                form = new BorrowForm();
                form.setBookId(rs.getInt(1));
                form.setDegree(rs.getInt(2));
                form.setBookBarcode(rs.getString(3));
                form.setBookName(rs.getString(4));
                form.setAuthor(rs.getString(6));
                form.setPrice(Float.valueOf(rs.getString(9)));
          
                form.setBookcaseName(rs.getString(16));
                form.setPubName(rs.getString(17));
                form.setBookType(rs.getString(18));
                coll.add(form);
                System.out.print("RS："+rs.getString(4));
            }
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }
        conn.close();
        return coll;
    }
}
