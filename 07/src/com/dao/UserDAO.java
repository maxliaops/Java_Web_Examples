package com.dao;

import org.hibernate.Transaction;
import com.actionForm.UserForm;
import org.hibernate.Query;
import java.util.List;
import org.hibernate.Session;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import com.core.MySession;

public class UserDAO {
    private Session session = null;
    public List query(String strif) {
        session=MySession.openSession();    //打开Session
        String hql = "";
        if (strif != "all" && strif != null && strif != "") { //条件查询
            hql = "FROM UserForm user WHERE " + strif +
                  "";
        } else { //查询全部数据
            hql = "FROM UserForm user";
        }
        System.out.println(hql);
        List list=null;
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
    //保存用户信息
    public int insert(UserForm userForm) {
        int ret = 0;
        Transaction tx = null;
        String str="name='" + userForm.getName() + "'";
        List list = query(str);

        if (list.size()> 0) { //存在该信息
            ret = 2;
        } else {
            session=MySession.openSession();    //打开Session
            try {
                tx = session.beginTransaction();
                session.save(userForm);
                tx.commit();
                ret = 1;
            } catch (Exception e) {
                if (tx != null) {
                    tx.rollback();
                }
                e.printStackTrace();
                System.out.println("添加用户信息时的错误信息：" + e.getMessage());
                return ret = 0;
            } finally {
                MySession.closeSession(session);   //关闭Session
            }
        }
        return ret;
    }
    public String login(UserForm userForm,HttpServletRequest request){
        String rtn="";
        String name=userForm.getName();
        String pwd=userForm.getPwd();
        String str="name='"+name+"'";
        List list = query(str);
        if(list.size()==1){
            UserForm m=(UserForm)list.get(0);
            String username=m.getName();
             if(pwd.equals(m.getPwd())){
                rtn="ok";
                //********将登录的用户名称保存到HttpSession中****
                HttpSession httpsession=request.getSession();
                httpsession.setAttribute("username",username);
                //********************************************
                System.out.println("登录成功！");
            }else{
                rtn="您输入的密码错误！";
                System.out.println("密码错误！");
            }
        }else{
            rtn="您输入的用户名称错误！";
            System.out.println("您输入的用户名称错误！");
        }
        return rtn;
    }
    //查询要修改的用户信息
    public UserForm query(int id) {
        session = MySession.openSession(); //打开Session
        UserForm userForm =null;
        try{
            userForm = (UserForm) session.get(UserForm.class, id);
        }catch(Exception e){
            e.printStackTrace();
        }finally{
            MySession.closeSession(session);  //关闭Session
        }
        return userForm;
    }

    //修改用户信息
    public int Modify(UserForm userForm,int flag) {
        int id = userForm.getId();
        int ret = 0;
        Transaction tx = null;
        session=MySession.openSession();    //打开Session
        try {
            tx = session.beginTransaction();
             UserForm userF=(UserForm)session.get(UserForm.class,id);
             if(flag==1){
                 userF.setPwd(userForm.getPwd());
             }else{
                 userF.setSetInstorage(userForm.getSetInstorage());
                 userF.setSetOutstorage(userForm.getSetOutstorage());
                 userF.setSetDeal(userForm.getSetDeal());
                 userF.setSetQuery(userForm.getSetQuery());
                 userF.setSetBasic(userForm.getSetBasic());
                 userF.setSetSys(userForm.getSetSys());
             }
            session.update(userF);
            tx.commit();
            ret = 1;
        } catch (Exception e) {
            if (tx != null) {
                tx.rollback();
            }
            System.out.println("修改用户信息时的错误信息：" + e.getMessage());
            return ret = 0;
        } finally {
            MySession.closeSession(session);   //关闭Session
        }
        return ret;
    }

    //删除用户信息
    public int del(int id) {
        session=MySession.openSession();    //打开Session
        int ret = 0;
        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            UserForm userForm = (UserForm) session.get(UserForm.class, id);
            session.delete(userForm);
            tx.commit();
            ret = 1;
        } catch (Exception e) {
            if (tx != null) {
                tx.rollback();
            }
            System.out.println("删除用户信息时的错误信息：" + e.getMessage());
            return ret = 0;
        } finally {
            MySession.closeSession(session);   //关闭Session
        }
        return ret;
    }

}
