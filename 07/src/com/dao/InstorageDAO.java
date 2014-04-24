package com.dao;

import org.hibernate.Session;
import com.core.MySession;
import com.actionForm.StockGoodsForm;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.LinkedList;
import com.actionForm.StockMainForm;
import org.hibernate.Transaction;
import java.text.NumberFormat;
import com.actionForm.StockDetailForm;
import java.util.Set;
import java.util.HashSet;
import com.actionForm.IfForm;
import org.hibernate.Query;
import com.actionForm.StockMainViewForm;
import java.util.Date;
import com.actionForm.GoodsForm;
import com.actionForm.InStorageForm;
import com.actionForm.StorageForm;
import com.actionForm.CheckForm;
import com.actionForm.LoanForm;

public class InstorageDAO {
    private Session session = null;
    //       session=MySession.openSession();   //打开Session
//       MySession.closeSession(session);    //关闭Session
    public void cart_add(StockGoodsForm goodsForm, HttpServletRequest request) {
        HttpSession httpsession = request.getSession();
        System.out.println("******************:" +
                           httpsession.getAttribute("stockgoods") +
                           "**********");
        if (httpsession.getAttribute("stockgoods") != null &&
            !httpsession.getAttribute("stockgoods").equals("")) {
            List list = (List) httpsession.getAttribute("stockgoods");
            boolean flag = true;
            for (int i = 0; i < list.size(); i++) { //判断是否已经添加了该记录
                StockGoodsForm goodsF = (StockGoodsForm) list.get(i);
                if (goodsF.getId() == goodsForm.getId()) { //已经采购
                    goodsF.setNumber(goodsF.getNumber() + goodsForm.getNumber());
                    list.set(i, goodsF); //重新设定指定位置i处的元素
                    flag = false;
                    break;
                }
            }
            if (flag) {
                list.add(goodsForm);
            }
            httpsession.setAttribute("stockgoods", list);
        } else {
            System.out.println("goodsForm:" + goodsForm);
            List list = new LinkedList();
            list.add(goodsForm);
            httpsession.setAttribute("stockgoods", list);
        }
    }

    public void cart_remove(int id, HttpServletRequest request) {
        HttpSession httpsession = request.getSession();
        List list = (List) httpsession.getAttribute("stockgoods");
        if (list.size() > 1) {
            list.remove(id); //移去指定的物资信息
            httpsession.setAttribute("stockgoods", list);
        } else {
            httpsession.removeAttribute("stockgoods");
        }
    }

    //清空保存物资信息的Session
    public void cart_clear(HttpServletRequest request) {
        HttpSession httpsession = request.getSession();
        httpsession.removeAttribute("stockgoods");
    }

//添加采购单信息
    public int stockadd(StockMainForm stockMainForm, HttpServletRequest request) {
        int rtn = 1;
        HttpSession httpsession = request.getSession();
        List list = (List) httpsession.getAttribute("stockgoods");
        Transaction tx = null;
        if (list.size() <= 0) {
            rtn = 0;
        } else {
            session = MySession.openSession(); //打开Session
            try {
                tx = session.beginTransaction();
                System.out.println("供应商ID：" + stockMainForm.getProviderid());

                for (int i = 0; i < list.size(); i++) {
                    StockDetailForm stockDetailForm = new StockDetailForm();
                    StockGoodsForm stockGoods = (StockGoodsForm) list.get(i);
                    stockMainForm.setCreateTime(new Date());

                    int goodsid = stockGoods.getId();
                    GoodsForm goodsForm = (GoodsForm) session.get(GoodsForm.class,
                            goodsid);
                    stockDetailForm.setGoods(goodsForm);
//                    System.out.println("GOODSID:"+goodsForm.getId());

//                    stockDetailForm.setGoodsid(stockGoods.getId());
                    stockDetailForm.setNumber(stockGoods.getNumber());
                    stockDetailForm.setPrice(stockGoods.getPrice());
                    stockMainForm.getStockDetail().add(stockDetailForm);
                    stockDetailForm.setStockMain(stockMainForm);
                    System.out.println("goods.getId:" + stockGoods.getId() +
                                       "**********" +
                                       stockDetailForm.getGoodsid());
                }
                session.save(stockMainForm);

                /*********生成采购单号*******************/
                NumberFormat formater = NumberFormat.getNumberInstance();
                int id = stockMainForm.getId();
                formater.setMinimumIntegerDigits(5);
                java.util.Date createTime = stockMainForm.getCreateTime();
                java.sql.Date date = new java.sql.Date(createTime.getTime());
                String sNo = "CG" + date +
                             formater.format(id).toString().replace(",", ""); //组合采购单号
                /**************************************/
                //插入采购单号
                StockMainForm stockmaniF = (StockMainForm) session.get(
                        StockMainForm.class, id);
                stockmaniF.setSno(sNo);
                session.update(stockmaniF);
                tx.commit();
                httpsession.removeAttribute("stockgoods");
                rtn=1;
            } catch (Exception e) {
                if (tx != null) {
                    tx.rollback();
                }
                rtn=0;
                e.printStackTrace();
                System.out.println("保存采购信息时的错误提示：" + e.getMessage());
            } finally {
                MySession.closeSession(session); //关闭Session
            }
        }
        return rtn;
    }

    //添加审核入库信息
    public int eligibleAdd(int id, HttpServletRequest request) {
        int rtn = 1;
        session = MySession.openSession(); //打开session
        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            InStorageForm inStorageForm = new InStorageForm();
            inStorageForm.setStockid(id);
            inStorageForm.setCreateTime(new Date());
            HttpSession httpsession = request.getSession();
            inStorageForm.setUsername((String) httpsession.getAttribute(
                    "username")); //设置操作员
            session.save(inStorageForm); //保存审核入库信息
            /********生成审核入库单信息***********/
            NumberFormat formater = NumberFormat.getNumberInstance();
            int iid = inStorageForm.getId();
            formater.setMinimumIntegerDigits(5);
            java.util.Date inTime = inStorageForm.getCreateTime();
            java.sql.Date date = new java.sql.Date(inTime.getTime());
            String ino = "RK" + date +
                         formater.format(iid).toString().replace(",", ""); //组合入库单号
            /**********************************/
            //插入入库单号
            InStorageForm inStorageF = (InStorageForm) session.get(
                    InStorageForm.class, iid);
            inStorageF.setIno(ino);
            session.update(inStorageF);
            //修改采购单状态为已入库
            StockMainForm stockMainForm = (StockMainForm) session.get(
                    StockMainForm.class, id);
            stockMainForm.setState(1);
            session.update(stockMainForm);
            //修改库存信息表
            String hql = "FROM StockDetailForm WHERE stockid=" + id + "";
            System.out.println("HQL:" + hql);
            List list = null;
            Query query = session.createQuery(hql);
            list = query.list();
            System.out.println("入库审核的list.size:" + list.size());
            int goodsid = 0;
            int goodsnumber = 0;
            String sql = "";
            for (int i = 0; i < list.size(); i++) {
                StockDetailForm stockdetailF = (StockDetailForm) list.get(i);
                goodsid = stockdetailF.getGoods().getId(); //商品ID
                goodsnumber = stockdetailF.getNumber(); //采购数量
                //判断是否已经存在要入库的商品
                String hql_goods = "FROM StorageForm WHERE goodsid=" + goodsid +
                                   "";
                List list_goods = session.createQuery(hql_goods).list();
                if (list_goods.size() > 0) {
                    String hql_up = "UPDATE StorageForm set number=number+" +
                                    goodsnumber + " WHERE goodsid=" + goodsid +
                                    "";
                    System.out.println("HQL_UP:" + hql_up);
                    session.createQuery(hql_up).executeUpdate();

                } else { //不存在时
                    StorageForm storageF = new StorageForm();
                    storageF.setGoodsid(goodsid);
                    storageF.setNumber(goodsnumber);
                    session.save(storageF);
                    System.out.println("添加");
                }

            }
            tx.commit();
        } catch (Exception e) {
            System.out.println("审核入库时的错误信息：" + e.getMessage());
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

    //审核不合格处理
    public int uneligibleAdd(int id, HttpServletRequest request) {
        int rtn = 1;
        session = MySession.openSession(); //打开session
        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            CheckForm checkForm = new CheckForm();
            checkForm.setStockid(id);
            checkForm.setCheckTime(new Date());
            HttpSession httpsession = request.getSession();
            checkForm.setChecker((String) httpsession.getAttribute("username")); //设置操作员
            session.save(checkForm); //保存审核不合格信息
            //修改采购单状态为不合格
            StockMainForm stockMainForm = (StockMainForm) session.get(
                    StockMainForm.class, id);
            stockMainForm.setState(2);
            session.update(stockMainForm);
            tx.commit();
        } catch (Exception e) {
            System.out.println("审核不合格时的错误信息：" + e.getMessage());
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

//借出归还
    public int backloan(int id, HttpServletRequest request) {
        int rtn = 1;
        session = MySession.openSession(); //打开session
        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            LoanForm loanForm = (LoanForm) session.get(LoanForm.class, id);
            loanForm.setBacktime(new Date());
            HttpSession httpsession = request.getSession();
            loanForm.setBackperson((String) httpsession.getAttribute("username")); //设置归还人
            loanForm.setState(new Short("2")); //修改借出单状态为已归还
            session.update(loanForm); //保存借出归还信息
            //修改库存信息表
            GoodsForm goodsF = loanForm.getGoods();
            int goodsid = goodsF.getId();
            int goodsnumber = loanForm.getNumber();
            String hql_goods = "FROM StorageForm WHERE goodsid=" + goodsid + "";
            List list_goods = session.createQuery(hql_goods).list();
            if (list_goods.size() > 0) {
                String hql_up = "UPDATE StorageForm set number=number+" +
                                goodsnumber + " WHERE goodsid=" + goodsid +
                                "";
                System.out.println("HQL_UP:" + hql_up);
                session.createQuery(hql_up).executeUpdate();
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
            System.out.println("借出归还时的错误信息：" + e.getMessage());
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
