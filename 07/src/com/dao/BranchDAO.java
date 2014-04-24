package com.dao;

import org.hibernate.Session;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Transaction;
import com.actionForm.BranchForm;
import com.core.MySession;

public class BranchDAO {
    private Session session = null;
    public List query(String strif) {
        session = MySession.openSession(); //打开Session
        String hql = "";
        if (strif != "all" && strif != null && strif != "") { //条件查询
            hql = "FROM BranchForm branch WHERE " + strif +
                  "";
        } else { //查询全部数据
            hql = "FROM BranchForm branch";
        }
        System.out.println(hql);
        List list = null;
        try {
            Query query = session.createQuery(hql);
            list = query.list();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            MySession.closeSession(session); //关闭Session
        }
        return list;
    }

//保存部门信息
    public int insert(BranchForm branchForm) {
        int ret = 0;
        Transaction tx = null;
//    ChStr chStr=new ChStr();
//    branchForm.setName(chStr.toChinese(branchForm.getName()));
//    branchForm.setMemo(chStr.toChinese(branchForm.getMemo()));
        String str = "name='" + branchForm.getName() + "'";
        List list = query(str);
        if (list.size() > 0) { //存在该信息
            ret = 2;
        } else {
            session = MySession.openSession(); //打开Session
            try {
                tx = session.beginTransaction();
                session.save(branchForm);
                tx.commit();
                ret = 1;
            } catch (Exception e) {
                if (tx != null) {
                    tx.rollback();
                }
                System.out.println("添加部门信息时的错误信息：" + e.getMessage());
                return ret = 0;
            } finally {
                MySession.closeSession(session); //关闭Session
            }
        }
        return ret;
    }

//删除部门信息
    public int del(int id) {
        session = MySession.openSession(); //打开Session
        int ret = 0;
        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            BranchForm branchF = (BranchForm) session.get(BranchForm.class, id);
            session.delete(branchF);
            tx.commit();
            ret = 1;
        } catch (Exception e) {
            if (tx != null) {
                tx.rollback();
            }
            System.out.println("删除部门信息时的错误信息：" + e.getMessage());
            return ret = 0;
        } finally {
            MySession.closeSession(session); //关闭Session
        }
        return ret;
    }


}
