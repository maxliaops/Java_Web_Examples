package com.dao;

import org.hibernate.Session;
import java.util.List;
import org.hibernate.SQLQuery;
import com.actionForm.GoodsForm;
import com.actionForm.StorageForm;
import com.core.MySession;
import com.actionForm.GetUseForm;
import org.hibernate.Transaction;
import java.util.Date;
import java.text.NumberFormat;
import com.actionForm.LoanForm;
import javax.servlet.http.HttpServletRequest;
import org.hibernate.Query;
import javax.servlet.http.HttpSession;
import com.actionForm.BranchForm;
import com.actionForm.DamageForm;

public class OutStorageDAO {
    private Session session = null;
    //查询库存信息
    public List storage_query() {
        session = MySession.openSession(); //打开Session
        String sql = "select {goods.*},{storage.*} from tb_goods goods inner join tb_storage storage on goods.id=storage.goodsid"; //使用内连接查询库存信息
        List list = null;
        try {
            SQLQuery query = session.createSQLQuery(sql);
            query.addEntity("goods", GoodsForm.class); //将数据表与实体类关联在一起
            query.addEntity("storage", StorageForm.class);
            list = query.list();
        } catch (Exception e) {
            System.out.println("查询时的错误信息：" + e.getMessage());
        }
        return list;
    }

    //在部门报损时查询部门已领用物资信息
    public List getuseGoods_query() {
        session = MySession.openSession(); //打开Session
        //以下内容需重点介绍
        String sql = "select * from tb_goods where id in (select goodsid from tb_getuse group by goodsid)";
        List list = null;
        try {
            SQLQuery query = session.createSQLQuery(sql);
            query.addEntity("goods", GoodsForm.class); //将数据表与实体类关联在一起
            list = query.list();
        } catch (Exception e) {
            System.out.println("查询时的错误信息：" + e.getMessage());
        }
        return list;
    }

    //查询部门领用信息
    public List getuse_query() {
        session = MySession.openSession(); //打开Session
        String sql = "select {getuse.*},{branch.*},{goods.*} from tb_getuse getuse inner join tb_goods goods on getuse.goodsid=goods.id inner join tb_branch branch on getuse.branchid=branch.id"; //使用内连接查询部门领用信息
        List list = null;
        try {
            SQLQuery query = session.createSQLQuery(sql);
            query.addEntity("goods", GoodsForm.class); //将数据表与实体类关联在一起
            query.addEntity("getuse", GetUseForm.class);
            query.addEntity("branch", BranchForm.class);
            list = query.list();
        } catch (Exception e) {
            System.out.println("查询时的错误信息：" + e.getMessage());
        }
        return list;
    }

//添加部门领用信息
    public int getuseAdd(GetUseForm getUseForm) {
        session = MySession.openSession(); //打开Session
        Transaction tx = null;
        int rtn = 1;
        try {
            //保存部门领用信息
            tx = session.beginTransaction();
            int goodsid = getUseForm.getGoodsid();
            GoodsForm goodsForm = (GoodsForm) session.get(GoodsForm.class,
                    goodsid);
            getUseForm.setGoods(goodsForm);
            int branchid = getUseForm.getBranchid();
            BranchForm branchForm = (BranchForm) session.get(BranchForm.class,
                    branchid);
            getUseForm.setBranch(branchForm);
            getUseForm.setCreatetime(new Date());
            session.save(getUseForm);
            /*********生成领用单号*******************/
            NumberFormat formater = NumberFormat.getNumberInstance();
            int id = getUseForm.getId();
            formater.setMinimumIntegerDigits(5);
            java.util.Date createTime = getUseForm.getCreatetime();
            java.sql.Date date = new java.sql.Date(createTime.getTime());
            String gNo = "LY" + date +
                         formater.format(id).toString().replace(",", ""); //组合领用单号
            /**************************************/
//插入领用单号
            GetUseForm getUseF = (GetUseForm) session.get(
                    GetUseForm.class, id);
            getUseF.setGno(gNo);
            session.update(getUseF);
//修改库存信息
//            StorageForm storageF = (StorageForm) session.get(StorageForm.class,
//                    getUseForm.getGoodsid());
            List list = session.createQuery("FROM StorageForm WHERE goodsid=" +
                                            getUseForm.getGoodsid() + "").list();
            StorageForm storageF = (StorageForm) list.get(0);
            int storageNum = storageF.getNumber() - getUseForm.getNumber();
            if (storageNum >= 0) {
                storageF.setNumber(storageNum);
                session.update(storageF);
            } else { //库存数量不足

                rtn = 0;
            }
            if (rtn == 1) {
                tx.commit();
            } else {
                if (tx != null) {
                    tx.rollback();
                }
            }
        } catch (Exception e) {
            if (tx != null) {
                tx.rollback();
            }
            System.out.println("添加部门领用信息时的错误信息：" + e.getMessage());
            rtn = 0;
        } finally {
            MySession.closeSession(session); //关闭Session
        }
        return rtn;
    }

    //添加部门报损信息
    public int damageAdd(DamageForm damageForm) {
        session = MySession.openSession(); //打开Session
        Transaction tx = null;
        int rtn = 0;
        try {
            //保存部门报损信息
            tx = session.beginTransaction();
            int goodsid = damageForm.getGoodsid();
            GoodsForm goodsForm = (GoodsForm) session.get(GoodsForm.class,
                    goodsid);
            damageForm.setGoods(goodsForm);
            int branchid = damageForm.getBranchid();
            BranchForm branchForm = (BranchForm) session.get(BranchForm.class,
                    branchid);
            damageForm.setBranch(branchForm);
            damageForm.setCreatetime(new Date());
            session.save(damageForm);
            tx.commit();
            rtn = 1;
        } catch (Exception e) {
            if (tx != null) {
                tx.rollback();
            }
            System.out.println("添加部门报损信息时的错误信息：" + e.getMessage());
            rtn = 0;
        } finally {
            MySession.closeSession(session); //关闭Session
        }
        return rtn;
    }

    //添加物资借出信息
    public int loanAdd(LoanForm loanForm) {
        session = MySession.openSession(); //打开Session
        Transaction tx = null;
        int rtn = 0;
        try {
            //保存物资借出信息
            tx = session.beginTransaction();
            int goodsid = loanForm.getGoodsid();
            GoodsForm goodsForm = (GoodsForm) session.get(GoodsForm.class,
                    goodsid);
            loanForm.setGoods(goodsForm);
            loanForm.setCreatetime(new Date());
            session.save(loanForm);
            /*********生成借出单号*******************/
            NumberFormat formater = NumberFormat.getNumberInstance();
            int id = loanForm.getId();
            formater.setMinimumIntegerDigits(5);
            java.util.Date createTime = loanForm.getCreatetime();
            java.sql.Date date = new java.sql.Date(createTime.getTime());
            String lNo = "JC" + date +
                         formater.format(id).toString().replace(",", ""); //组合借出单号
            /**************************************/
//插入借出单号
            LoanForm loanF = (LoanForm) session.get(
                    LoanForm.class, id);
            loanF.setLno(lNo);
            session.update(loanF);
            tx.commit();
            rtn = 1;
        } catch (Exception e) {
            if (tx != null) {
                tx.rollback();
            }
            System.out.println("添加物资借出信息时的错误信息：" + e.getMessage());
            rtn = 0;
        } finally {
            MySession.closeSession(session); //关闭Session
        }
        return rtn;
    }

    //出库审核
    public int approveloanAdd(int id, HttpServletRequest request) {
        int rtn = 1;
        session = MySession.openSession(); //打开session
        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            LoanForm loanForm = (LoanForm) session.get(LoanForm.class, id);
            loanForm.setApprovetime(new Date());
            HttpSession httpsession = request.getSession();
            loanForm.setTaster((String) httpsession.getAttribute("username")); //设置审核员
            loanForm.setState(new Short("1")); //修改借出单状态为已审核
            session.update(loanForm); //保存借出审核信息
            //修改库存信息表
            GoodsForm goodsF = loanForm.getGoods();
            int goodsid = goodsF.getId();
            int goodsnumber = loanForm.getNumber();
            String hql_goods = "FROM StorageForm WHERE goodsid=" + goodsid + "";
            List list_goods = session.createQuery(hql_goods).list();
            System.out.println("LIST_GOODS.SIZE:" + list_goods.size() +
                               "********GOODSID:" + goodsid);
            if (list_goods.size() > 0) {
                StorageForm storageF = (StorageForm) list_goods.get(0);
                if (storageF.getNumber() - goodsnumber >= 0) {
                    String hql_up = "UPDATE StorageForm set number=number-" +
                                    goodsnumber + " WHERE goodsid=" + goodsid +
                                    "";
                    System.out.println("HQL_UP:" + hql_up);
                    session.createQuery(hql_up).executeUpdate();
                } else {
                    rtn = 2; //库存不足
                }
            } else {
                rtn = 0;
            }
            if (rtn == 1) {
                tx.commit();
            } else {
                if (tx != null) {
                    tx.rollback();
                }
            }

        } catch (Exception e) {
            System.out.println("借出审核时的错误信息：" + e.getMessage());
            e.printStackTrace();
            if (tx != null) {
                tx.rollback();
            }
            rtn = 0;
        } finally {
            MySession.closeSession(session); //关闭Session
        }
        return rtn;
    }
}
