package com.dao;

import org.hibernate.Transaction;
import com.core.MySession;
import org.hibernate.Session;
import org.hibernate.Query;

public class SysDAO {
    public SysDAO(){
    }
    private Session session = null;
    public int sysinitialize(){
        session = MySession.openSession(); //打开Session
        Transaction tx = null;
        int rtn = 0;
        try {
            tx=session.beginTransaction();
            session.createQuery("DELETE UserForm where name<>'mr'").executeUpdate();      //删除用户信息
            session.createQuery("DELETE GetUseForm").executeUpdate();      //清空部门领用信息表
            session.createQuery("DELETE DamageForm").executeUpdate();      //清空部门报损信息表
            session.createQuery("DELETE CheckForm").executeUpdate();      //清空审核信息表
            session.createQuery("DELETE InStorageForm").executeUpdate();      //清空入库信息表
            session.createQuery("DELETE StockDetailForm").executeUpdate();      //清空采购明细表
            session.createQuery("DELETE StockMainForm").executeUpdate();      //清空采购主表
            session.createQuery("DELETE ProviderForm").executeUpdate();      //清空供应商信息表
            session.createQuery("DELETE LoanForm").executeUpdate();      //清空物资借出信息表
            session.createQuery("DELETE StorageForm").executeUpdate();      //清空库存信息表
            session.createQuery("DELETE BranchForm").executeUpdate();      //清空部门信息表
            session.createQuery("DELETE GoodsForm").executeUpdate();      //清空商品信息表
            rtn=1;
            tx.commit();
        }catch(Exception e){
            if(tx!=null){
                tx.rollback();
            }
            e.printStackTrace();
            System.out.println("系统初使化时的错误信息："+e.getMessage());
            rtn=0;
        } finally {
            MySession.closeSession(session);
        }
        return rtn;
    }
}
