package com.dao;

import java.util.List;
import com.actionForm.StockMainViewForm;
import com.core.MySession;
import org.hibernate.Query;
import com.actionForm.LoanForm;
import com.actionForm.IfForm;
import org.hibernate.Session;
import com.actionForm.GoodsForm;
import com.actionForm.BranchForm;
import com.actionForm.DamageForm;
import org.hibernate.SQLQuery;
import com.actionForm.GetUseForm;
import java.util.Set;

public class QueryDAO {
    private Session session = null;
    //查询采购单详细信息
    public StockMainViewForm stockDetail(int id) {
        session = MySession.openSession(); //打开Session
        StockMainViewForm stockMVF = new StockMainViewForm();
        try {
            stockMVF = (StockMainViewForm) session.get(StockMainViewForm.class,
                    id);
            System.out.println("采购详细信息的大小：" + stockMVF.getStockDetail().size());
        } catch (Exception e) {
            System.out.println("查询采购单详细信息时出错：" + e.getMessage());
        } finally {
            MySession.closeSession(session);
        }
        return stockMVF;
    }

    //查询借出单详细信息
    public LoanForm loanDetail(int id) {
        session = MySession.openSession(); //打开Session
        LoanForm loanF = null;
        try {
            loanF = (LoanForm) session.get(LoanForm.class,
                                           id);
        } catch (Exception e) {
            System.out.println("查询借出单详细信息时出错：" + e.getMessage());
        } finally {
            MySession.closeSession(session);
        }
        return loanF;
    }

//查询部门报损信息
    public List damageQuery(IfForm ifForm) {
        session = MySession.openSession(); //打开Session
        String str = ifCompose(ifForm);
        String sql = "select {damage.*},{goods.*},{branch.*} from tb_damage damage inner join tb_goods goods on damage.goodsid=goods.id inner join tb_branch branch on damage.branchid=branch.id ";
        List list = null;
        if (str == null) {
            sql = sql + " order by damage.createTime desc";
        } else {
            sql = sql + " WHERE " + str +
                  " order by damage.createTime desc";
        }
        session = MySession.openSession(); //打开Session
        System.out.println("SQL=" + sql);
        try {
            SQLQuery query = session.createSQLQuery(sql);
            query.addEntity("goods", GoodsForm.class); //将数据表与实体类关联在一起
            query.addEntity("damage", DamageForm.class);
            query.addEntity("branch", BranchForm.class);
            list = query.list();
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("查询时出现的错误信息：" + e.getMessage());
        } finally {
            MySession.closeSession(session); //关闭Session
        }
        return list;
    }

    //查询部门领用信息
    public List getuseQuery(IfForm ifForm) {
        session = MySession.openSession(); //打开Session
        String str = ifCompose(ifForm);
        String sql = "select {getuse.*},{goods.*},{branch.*} from tb_getuse getuse inner join tb_goods goods on getuse.goodsid=goods.id inner join tb_branch branch on getuse.branchid=branch.id ";
        List list = null;
        if (str == null) {
            sql = sql + " order by getuse.createTime desc";
        } else {
            sql = sql + " WHERE " + str +
                  " order by getuse.createTime desc";
        }
        session = MySession.openSession(); //打开Session
        System.out.println("SQL=" + sql);
        try {
            SQLQuery query = session.createSQLQuery(sql);
            query.addEntity("goods", GoodsForm.class); //将数据表与实体类关联在一起
            query.addEntity("getuse", GetUseForm.class);
            query.addEntity("branch", BranchForm.class);
            list = query.list();
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("查询时出现的错误信息：" + e.getMessage());
        } finally {
            MySession.closeSession(session); //关闭Session
        }
        return list;
    }

    //部门领用、报损信息汇总
    public List getusedamageTotal(IfForm ifForm,String form,String cfield) {
        session = MySession.openSession(); //打开Session
        String str = ifCompose(ifForm);
        String sql="";
        List list = null;
        if (str == null) {
            sql = "select sum(form."+cfield+") as amount,b.name,g.name,g.spec,g.price,g.unit,g.producer "+
                     "FROM "+form+" form JOIN form.branch b JOIN form.goods g "+
                     "GROUP BY b.name,g.name,g.spec,g.price,g.unit,g.producer";
        } else {
            sql ="select sum(form."+cfield+") as amount,b.name,g.name,g.spec,g.price,g.unit,g.producer "+
                     "FROM "+form+" form JOIN form.branch b JOIN form.goods g WHERE "+str+" "+
                     "GROUP BY b.name,g.name,g.spec,g.price,g.unit,g.producer";
        }
        System.out.println("****************:"+sql);
        session = MySession.openSession(); //打开Session
        System.out.println("SQL=" + sql);
        try {
            list = session.createQuery(sql).list();
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("查询时出现的错误信息：" + e.getMessage());
        } finally {
            MySession.closeSession(session); //关闭Session
        }
        return list;
    }
   // 查询部门汇总信息
        public List branchTotal(IfForm ifForm) {
            session = MySession.openSession(); //打开Session
            String str = ifCompose(ifForm);
            List list = null;
            String sql="select  g.name,g.spec,g.unit,g.price,t.branchname,t.lyamount,t.bsamount,(t.lyamount-t.bsamount) zyamount from tb_goods g inner join ( "+
                       "select goodsid,branchname,sum(bsamount) bsamount,sum(lyamount) lyamount from(" +
                       "select getuse.goodsid,0 as bsamount,sum(getuse.number) as lyamount,branch.name as branchname from tb_getuse getuse inner join  " +
                       " tb_branch branch on getuse.branchid=branch.id group by branch.name,getuse.goodsid " +
                       "union " +
                       "select damage.goodsid,sum(damage.damagenum) as bsamount,0 as lyamount,branch.name as branchname from tb_damage damage inner join  " +
                       " tb_branch branch on damage.branchid=branch.id group by branch.name,damage.goodsid " +
                       ") as t group by goodsid,branchname) as t on g.id=t.goodsid";

        if (str != null) {
            sql="select  g.name,g.spec,g.unit,g.price,t.branchname,t.lyamount,t.bsamount,(t.lyamount-t.bsamount) zyamount from tb_goods g inner join ( "+
              "select goodsid,branchname,sum(bsamount) bsamount,sum(lyamount) lyamount from(" +
               "select getuse.goodsid,0 as bsamount,sum(getuse.number) as lyamount,branch.name as branchname from tb_getuse getuse inner join  " +
               " tb_branch branch on getuse.branchid=branch.id and getuse."+str+"  group by branch.name,getuse.goodsid " +
               "union " +
               "select damage.goodsid,sum(damage.damagenum) as bsamount,0 as lyamount,branch.name as branchname from tb_damage damage inner join  " +
               " tb_branch branch on damage.branchid=branch.id and damage."+str+"  group by branch.name,damage.goodsid " +
               ") as t group by goodsid,branchname) as t on g.id=t.goodsid";
//            sql="select goods.name,goods.spec,goods.unit,goods.price,totle.branchname,totle.lyamount,totle.bsamount,totle.zyamount  from tb_goods goods inner join ( "+
//           " select ly.*, isnull(bsamount,0) as bsamount,(ly.lyamount-isnull(bsamount,0))as zyamount from (select getuse.goodsid,count(getuse.number)"+
//           "  as lyamount,branch.name as branchname from tb_getuse getuse"+
//           "  inner join  tb_branch branch on getuse.branchid=branch.id group by branch.name,getuse.goodsid) as ly left join "+
//           " (select damage.goodsid,count(damage.damagenum) as bsamount,branch.name as branchname from tb_damage damage inner join"+
//           "   tb_branch branch on damage.branchid=branch.id and damage."+str+" group by branch.name,damage.goodsid) as bs on ly.goodsid=bs.goodsid and ly.branchname=bs.branchname) as totle on goods.id=totle.goodsid";
}
        try {
        SQLQuery query = session.createSQLQuery(sql);
           list=query.list();
                 for(int i=0;i<list.size();i++){
                     System.out.println(list.get(i));

                 }
            } catch (Exception e) {
                e.printStackTrace();
                System.out.println("查询时出现的错误信息：" + e.getMessage());
            } finally {
                MySession.closeSession(session); //关闭Session
            }
            return list;
    }
//通用查询
    public List stockQuery(IfForm ifForm, String tablename, int state) {
        String str = ifCompose(ifForm);
        System.out.println("STR=" + str + "******************" + tablename);
        String hql = "";
        List list = null;
        if (str == null) {
            if (state == 3) { //state为3时代表查询全部数据
                hql = "From " + tablename + " order by createTime desc";
            } else {
                hql = "From " + tablename + " where state=" + state +
                      " order by createTime desc";
            }
        } else {
            hql = "From " + tablename + " WHERE " + str +
                  " order by createTime desc";
        }
        session = MySession.openSession(); //打开Session
        System.out.println("HQL=" + hql);
        try {
            Query query = session.createQuery(hql);
            list = query.list();
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("查询时出现的错误信息：" + e.getMessage());
        } finally {
            MySession.closeSession(session); //关闭Session
        }
        return list;
    }

    /***************************组合查询条件字符串的方法***************************************/
    //组合查询条件字符串的方法
    public String ifCompose(IfForm ifForm) {
        String str = null;
        String flag[] = ifForm.getFlag(); //定义一个字符型数组，获取表单中复选框提交的数据
        if (flag != null) {
            str = "";
            for (int i = 0; i < flag.length; i++) {
                str = str + oneIf(ifForm, flag[i]);
                if (i < flag.length - 1) {
                    str = str + " and ";
                }
            }
        }
        return str;
    }

    //根据传递的参数组合单个条件的方法
    public String oneIf(IfForm ifForm, String flagv) {
        String str = null;
        if ("a".equals(flagv)) { //按指定字段查询
            if (ifForm.getF() != null) {
                str = ifForm.getF() + " like '%" +
                      ifForm.getKey() + "%'"; //此处需要进行转码
            }
            System.out.println("按指定字段查询：" + str);
        }
        if ("b".equals(flagv)) { //按时间段查询
            String sdate = ifForm.getSdate();
            String edate = ifForm.getEdate();
            if (sdate != null && edate != null) {
                str = "createTime between '" + sdate + "' and '" + edate +
                      " 23:59:59'";
            }
            System.out.println("日期" + str);
        }
        if ("c".equals(flagv)) { //按状态查询
            int state = ifForm.getState();
            str = "state=" + state + "";
            System.out.println("状态：" + str);
        }
        return str;
    }
    /***************************************************************************/

}
