package com.dao;

import org.hibernate.Session;
import java.util.List;
import org.hibernate.Query;
import com.actionForm.GoodsForm;
import org.hibernate.Transaction;
import com.core.MySession;

public class GoodsDAO {
    private Session session = null;
    public List query(String strif, int del) {
        session = MySession.openSession(); //打开Session
        String hql = "";
        if (strif != "all" && strif != null && strif != "") { //条件查询
            hql = "FROM GoodsForm goods WHERE " + strif + "";
        } else { //查询全部数据
            hql = "FROM GoodsForm goods WHERE ifdel=" + del + " ORDER BY ifdel";
        }
        System.out.println(hql);
        List list=null;
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

    //修改商品信息时的查询
    public GoodsForm query(int id) {
        session = MySession.openSession(); //打开Session
        GoodsForm goodsForm = null;
        try {
            goodsForm = (GoodsForm) session.get(GoodsForm.class, id);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            MySession.closeSession(session); //关闭Session
        }
        return goodsForm;
    }

    public int insert(GoodsForm goodsForm) {
        int ret = 0;
        Transaction tx = null;
        String str = "name='" + goodsForm.getName() + "' AND spec='" +
                     goodsForm.getSpec() + "'";
        List list = query(str, 0);
        if (list.size() > 0) { //存在该信息
            ret = 2;
        } else {
            session = MySession.openSession(); //打开Session
            try {
                tx = session.beginTransaction();
                session.save(goodsForm);
                tx.commit();
                ret = 1;
            } catch (Exception e) {
                if (tx != null) {
                    tx.rollback();
                }
                System.out.println("添加物资信息时的错误信息：" + e.getMessage());
                return ret = 0;
            } finally {
                MySession.closeSession(session); //关闭Session
            }
        }
        return ret;
    }

    // 修改物资信息
    public int update(GoodsForm goodsForm) {
        session = MySession.openSession(); //打开Session
        int ret = 0;
        Transaction tx = null;
        try {
            tx = session.beginTransaction();
//            ChStr chStr=new ChStr();
            GoodsForm goodsF = (GoodsForm) session.get(GoodsForm.class,
                    goodsForm.getId());
            goodsF.setSpec(goodsForm.getSpec());
            goodsF.setUnit(goodsForm.getUnit());
            goodsF.setPrice(goodsForm.getPrice());
            goodsF.setProducer(goodsForm.getProducer());
//            goodsF.setSpec(chStr.toChinese(goodsForm.getSpec()));
//            goodsF.setUnit(chStr.toChinese(goodsForm.getUnit()));
//            goodsF.setPrice(goodsForm.getPrice());
//            goodsF.setProducer(chStr.toChinese(goodsForm.getProducer()));
            session.update(goodsF);
            tx.commit();
            ret = 1;
        } catch (Exception e) {
            if (tx != null) {
                tx.rollback();
            }
            System.out.println("修改物资信息时的错误信息：" + e.getMessage());
            return ret = 0;
        } finally {
            MySession.closeSession(session); //关闭Session
        }
        return ret;
    }

    public int del(int id, byte val) {
        session = MySession.openSession(); //打开Session
        int ret = 0;
        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            GoodsForm goodsF = (GoodsForm) session.get(GoodsForm.class, id);
            goodsF.setIfdel(val);
            System.out.println(val + "*********" + id);
            session.update(goodsF);
            tx.commit();
            ret = 1;
        } catch (Exception e) {
            if (tx != null) {
                tx.rollback();
            }
            System.out.println("删除/恢复物资信息时的错误信息：" + e.getMessage());
            return ret = 0;
        } finally {
            MySession.closeSession(session); //关闭Session
        }
        return ret;
    }
}
