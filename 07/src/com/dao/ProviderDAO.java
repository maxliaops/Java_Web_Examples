package com.dao;

import org.hibernate.Session;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Transaction;
import com.actionForm.ProviderForm;
import com.core.MySession;

public class ProviderDAO {
    private Session session = null;
    public List query(String strif) {
        session = MySession.openSession();  //打开Session
        List list=null;
            String hql = "";
            if (strif != "all" && strif != null && strif != "") { //条件查询
                hql = "FROM ProviderForm provider WHERE " + strif +
                      "";
            } else { //查询全部数据
                hql = "FROM ProviderForm provider";
            }
            System.out.println(hql);
        try{
            Query query = session.createQuery(hql);
            list = query.list();
        }catch(Exception e){
            e.printStackTrace();
        }finally{
            MySession.closeSession(session);  //关闭Session
        }
        return list;
    }

public int insert(ProviderForm providerForm){
    int ret=0;
    Transaction tx=null;
//    ChStr chStr=new ChStr();
//    providerForm.setName(chStr.toChinese(providerForm.getName()));
//    providerForm.setAddress(chStr.toChinese(providerForm.getAddress()));
//    providerForm.setBankName(chStr.toChinese(providerForm.getBankName()));
//    providerForm.setMemo(chStr.toChinese(providerForm.getMemo()));
    String str="name='" + providerForm.getName() + "'";
    List list = query(str);
        if (list.size()> 0) { //存在该信息
        ret=2;
    }else{
        session=MySession.openSession(); //打开Session
        try {
            tx = session.beginTransaction();
            session.save(providerForm);
            tx.commit();
            ret = 1;
        } catch (Exception e) {
            if (tx != null) {
                 tx.rollback();
            }
            System.out.println("添加供应商信息时的错误信息：" + e.getMessage());
            return ret = 0;
        } finally {
             MySession.closeSession(session); //关闭Session
        }
    }
    return ret;
}
//查询要修改的供应商信息
public ProviderForm query(int id){
    session=MySession.openSession();     //打开Session
    ProviderForm providerForm=null;
    try{
        providerForm=(ProviderForm)session.get(ProviderForm.class,id);

    }catch(Exception e){
        e.printStackTrace();
    }finally{
        MySession.closeSession(session); //关闭Session
    }
    return providerForm;
}
//修改供应商信息
public int Modify(ProviderForm providerForm){
 session=MySession.openSession();    //打开Session
 int id=providerForm.getId();
 int ret = 0;
 Transaction tx = null;
 try {
     tx = session.beginTransaction();
    // ProviderForm providerF=(ProviderForm)session.get(ProviderForm.class,id);

     session.update(providerForm);
     tx.commit();
     ret = 1;
 } catch (Exception e) {
     if (tx != null) {
         tx.rollback();
     }
     System.out.println("修改供应商信息时的错误信息：" + e.getMessage());
     return ret = 0;
 } finally {
     MySession.closeSession(session);   //关闭Session
 }
 return ret;
    }
//删除供应商信息
public int del(int id){
     session=MySession.openSession(); //打开Session
     int ret = 0;
     Transaction tx = null;
     try {
         tx = session.beginTransaction();
         ProviderForm providerF=(ProviderForm)session.get(ProviderForm.class,id);
         session.delete(providerF);
         tx.commit();
         ret = 1;
     } catch (Exception e) {
         if (tx != null) {
             tx.rollback();
         }
         System.out.println("删除供应商信息时的错误信息：" + e.getMessage());
         return ret = 0;
     } finally {
         MySession.closeSession(session); //关闭Session
     }
     return ret;
    }


}
