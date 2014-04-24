package com.dao;

import java.sql.*;
import java.util.Collection;
import java.util.ArrayList;
import javax.servlet.http.HttpServletRequest;
import com.core.Database;
import com.core.FinalConstants;
import com.core.ParamUtils;
import com.model.User;

/**
 * <p>Title: </p>
 * <p>Description: </p>
 * <p>Copyright: Copyright (c) 2004</p>
 * <p>Company: MR</p>
 * @author BWM
 * @version 1.0
 */

public class Dbuser extends User {
    private User u = new User();
    //不使初始化select
    public Dbuser(){}
    //使用数据库始化update
    public Dbuser(String sql) {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            con = Database.getConnection();
            ps = con.prepareStatement(FinalConstants.SELECT_USER+sql,ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
            rs = ps.executeQuery();
            if (rs.next()) {
                u.setUid(ParamUtils.getSqlString(rs.getString("uid")));
                u.setPassword(ParamUtils.getSqlString(rs.getString("password")));
                u.setName(ParamUtils.getSqlString(rs.getString("name")));
                u.setRegqu(ParamUtils.getSqlString(rs.getString("regqu")));
                u.setReganswer(ParamUtils.getSqlString(rs.getString("reganswer")));
                u.setIid(ParamUtils.getSqlString(rs.getString("iid")));
                u.setSex(rs.getInt("sex"));
                u.setAge(rs.getInt("age"));
                u.setTel(ParamUtils.getSqlString(rs.getString("tel")));
                u.setEmail(ParamUtils.getSqlString(rs.getString("email")));
                u.setQq(ParamUtils.getSqlString(rs.getString("qq")));
                u.setRegtime(ParamUtils.getSqlString(rs.getString("regtime")));
                u.setAddress(ParamUtils.getSqlString(rs.getString("address")));
                u.setHttp(ParamUtils.getSqlString(rs.getString("http")));
                u.setStatus(rs.getInt("status"));
                u.setState(rs.getInt("state"));
                u.setResume(ParamUtils.getSqlString(rs.getString("resume")));
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
            e.printStackTrace();
        } finally {
            System.out.println(ps+" Dbuser(String sql) "+u.getUid());
            try {
                if (ps != null) {
                    ps.close();
                    ps = null;
                }
            } catch (SQLException e) {
                ps = null;
            }
            try {
                if (con != null) {
                    con.close();
                    con = null;
                }
            } catch (SQLException e) {
                con = null;
            }
        }
    }
    //使用内建对像初始化insert
    public Dbuser(HttpServletRequest request) {
        u.setUid(ParamUtils.getRequestString(request, "uid"));
        u.setPassword(ParamUtils.getRequestString(request, "password"));
        u.setName(ParamUtils.getRequestString(request, "name"));
        u.setRegqu(ParamUtils.getRequestString(request, "regqu"));
        u.setReganswer(ParamUtils.getRequestString(request, "reganswer"));
        u.setSex(ParamUtils.getIntParameter(request, "sex"));
        u.setAge(ParamUtils.getIntParameter(request, "age"));
        u.setIid(ParamUtils.getRequestString(request, "iid"));
        u.setTel(ParamUtils.getRequestString(request, "tel"));
        u.setEmail(ParamUtils.getRequestString(request, "email"));
        u.setQq(ParamUtils.getRequestString(request, "qq"));
        u.setAddress(ParamUtils.getRequestString(request, "address"));
        u.setHttp(ParamUtils.getRequestString(request, "http"));
        u.setStatus(ParamUtils.getIntParameter(request, "status"));
        u.setState(ParamUtils.getIntParameter(request, "state"));
        u.setResume(ParamUtils.getRequestString(request, "resume"));
    }

    //注册时间插入系统时间
    public boolean Insert() {
        boolean b = false;
        Connection con = null;
        PreparedStatement ps = null;
        try {
            con = Database.getConnection();
            ps = con.prepareStatement(FinalConstants.INSERT_USER);
            System.out.println("Dbuser.java中:"+FinalConstants.INSERT_USER+"结束");
            ps.setString(1, u.getUid());
            ps.setString(2, u.getPassword());
            ps.setString(3, u.getName());
            ps.setString(4, u.getRegqu());
            ps.setString(5, u.getReganswer());
            ps.setString(6, u.getIid());
            ps.setInt(7, u.getSex());
            ps.setInt(8, u.getAge());
            ps.setString(9, u.getTel());
            ps.setString(10, u.getEmail());
            ps.setString(11, u.getQq());
            ps.setString(12, u.getAddress());
            ps.setString(13, u.getHttp());
            ps.setInt(14, u.getStatus());
            ps.setInt(15, u.getState());
            ps.setString(16, u.getResume());
            if (ps.executeUpdate() > 0) {
                b = true;
            } else {
                b = false;
            }
        } catch (SQLException e) {
            b = false;
            System.out.println(e.getMessage());
            e.printStackTrace();
        } finally {
        System.out.println(ps+" Dbuser.Insert()");
           try {
                if (ps != null) {
                    ps.close();
                }
            } catch (SQLException e) {
                ps = null;
            }
            try {
                if (con != null) {
                    con.close();
                }
            } catch (SQLException e) {
                con = null;
            }
        }
        return b;
    }

     private boolean Update() {
        boolean b = false;
        Connection con = null;
        PreparedStatement ps = null;
        try {
            con = Database.getConnection();
            ps = con.prepareStatement(FinalConstants.UPDATE_USER);
            ps.setString(1, u.getPassword());
            ps.setString(2, u.getName());
            ps.setString(3, u.getIid());
            ps.setInt(4, u.getSex());
            ps.setInt(5, u.getAge());
            ps.setString(6, u.getTel());
            ps.setString(7, u.getEmail());
            ps.setString(8, u.getQq());
            ps.setString(9, u.getAddress());
            ps.setString(10, u.getHttp());
            ps.setInt(11, u.getStatus());
            ps.setInt(12, u.getState());
            ps.setString(13, u.getResume());
            ps.setString(14, u.getUid());
            if (ps.executeUpdate() > 0) {
                b = true;
            } else {
                b = false;
            }
        } catch (SQLException e) {
            b = false;
            e.printStackTrace();
        } finally {
            System.out.println(ps+" Dbuser.Update() ");
            try {
                if (ps != null) {
                    ps.close();
                }
            } catch (SQLException e) {
                ps = null;
            }
            try {
                if (con != null) {
                    con.close();
                }
            } catch (SQLException e) {
                con = null;
            }
        }
        return b;
    }
     private boolean Update_m() {
         boolean b = false;
         Connection con = null;
         PreparedStatement ps = null;
         try {
             con = Database.getConnection();
             ps = con.prepareStatement(FinalConstants.UPDATE_USER_M);
             ps.setInt(1, u.getStatus());
             ps.setInt(2, u.getState());
             ps.setString(3, u.getUid());
             if (ps.executeUpdate() > 0) {
                 b = true;
             } else {
                 b = false;
             }
         } catch (SQLException e) {
             b = false;
             e.printStackTrace();
         } finally {
             System.out.println(ps+" Dbuser.Update_m() ");
             try {
                 if (ps != null) {
                     ps.close();
                 }
             } catch (SQLException e) {
                 ps = null;
             }
             try {
                 if (con != null) {
                     con.close();
                 }
             } catch (SQLException e) {
                 con = null;
             }
         }
         return b;
     }
    public Collection Select(String sql) {
        Collection coll = new ArrayList();
        Connection con = null;
        ResultSet rs = null;
        PreparedStatement ps = null;
        try {
            con = Database.getConnection();
            ps = con.prepareStatement(FinalConstants.SELECT_HEAD + sql);
            System.out.print("SQLHead_wgh："+FinalConstants.SELECT_USER + sql);
            rs = ps.executeQuery();
            while(rs.next()) {
                User user = new User();
                user.setUid(ParamUtils.getSqlString(rs.getString("uid")));
                user.setPassword(ParamUtils.getSqlString(rs.getString("password")));
                user.setName(ParamUtils.getSqlString(rs.getString("name")));
                user.setRegqu(ParamUtils.getSqlString(rs.getString("regqu")));
                user.setReganswer(ParamUtils.getSqlString(rs.getString("reganswer")));
                user.setIid(ParamUtils.getSqlString(rs.getString("iid")));
                user.setSex(rs.getInt("sex"));
                user.setAge(rs.getInt("age"));
                user.setTel(ParamUtils.getSqlString(rs.getString("tel")));
                user.setEmail(ParamUtils.getSqlString(rs.getString("email")));
                user.setQq(ParamUtils.getSqlString(rs.getString("qq")));
                user.setRegtime(ParamUtils.getSqlString(rs.getString("regtime")));
                user.setAddress(ParamUtils.getSqlString(rs.getString("address")));
                user.setHttp(ParamUtils.getSqlString(rs.getString("http")));
                user.setStatus(rs.getInt("status"));
                user.setState(rs.getInt("state"));
                user.setResume(ParamUtils.getSqlString(rs.getString("resume")));
                coll.add(user);
            }
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        } finally {
        System.out.println(ps+" Dbuser.Select(String sql) ");
            try {
                if (ps != null) {
                    ps.close();
                    ps = null;
                }
            } catch (SQLException e) {
                ps = null;
            }
            try {
                if (con != null) {
                    con.close();
                    con = null;
                }
            } catch (SQLException e) {
                con = null;
            }
        }
        return coll;
    }

    //页数+SQL条件
    public Collection Select(int page, String sql) {
        Collection coll = new ArrayList();
        Connection con = null;
        ResultSet rs = null;
        PreparedStatement ps = null;
        int tip = FinalConstants.STEP * (page - 1);
        try {
            con = Database.getConnection();
            ps = con.prepareStatement(FinalConstants.SELECT_USER + sql);
            System.out.print("SQL_wgh："+FinalConstants.SELECT_USER + sql);
            rs = ps.executeQuery();
            if (tip <= 0) {
                rs.beforeFirst();
            } else {
                if (!rs.absolute(tip)) {
                    rs.beforeFirst();
                }
            }
            for (int i = 1; rs.next() && i <= FinalConstants.STEP; i++) {
                User user = new User();
                user.setUid(ParamUtils.getSqlString(rs.getString("uid")));
                user.setPassword(ParamUtils.getSqlString(rs.getString("password")));
                user.setName(ParamUtils.getSqlString(rs.getString("name")));
                user.setRegqu(ParamUtils.getSqlString(rs.getString("regqu")));
                user.setReganswer(ParamUtils.getSqlString(rs.getString("reganswer")));
                user.setIid(ParamUtils.getSqlString(rs.getString("iid")));
                user.setSex(rs.getInt("sex"));
                user.setAge(rs.getInt("age"));
                user.setTel(ParamUtils.getSqlString(rs.getString("tel")));
                user.setEmail(ParamUtils.getSqlString(rs.getString("email")));
                user.setQq(ParamUtils.getSqlString(rs.getString("qq")));
                user.setRegtime(ParamUtils.getSqlString(rs.getString("regtime")));
                user.setAddress(ParamUtils.getSqlString(rs.getString("address")));
                user.setHttp(ParamUtils.getSqlString(rs.getString("http")));
                user.setStatus(rs.getInt("status"));
                user.setState(rs.getInt("state"));
                user.setResume(ParamUtils.getSqlString(rs.getString("resume")));
                coll.add(user);
            }
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        } finally {
        System.out.println(ps+" Dbuser.Select(int page,String sql) "+FinalConstants.SELECT_USER + sql);
            try {
                if (ps != null) {
                    ps.close();
                    ps = null;
                }
            } catch (SQLException e) {
                ps = null;
            }
            try {
                if (con != null) {
                    con.close();
                    con = null;
                }
            } catch (SQLException e) {
                con = null;
            }
        }
        return coll;
    }

    public String getPassword() {
        return u.getPassword();
    }

    public void setPassword(String password) {
        u.setPassword(password);
        Update();
    }

    public String getName() {
        return u.getName();
    }

    public void setName(String name) {
        u.setName(name);
        Update();
    }

    public String getRegqu() {
        return u.getRegqu();
    }

    public void setRegqu(String regqu) {
        u.setRegqu(regqu);
        Update();
    }

    public String getReganswer() {
        return u.getReganswer();
    }

    public void setReganswer(String reganswer) {
        u.setReganswer(reganswer);
        Update();
    }

    public int getSex() {
        return u.getSex();
    }

    public void setSex(int sex) {
        u.setSex(sex);
        Update();
    }

    public int getAge() {
        return u.getAge();
    }

    public void setAge(int age) {
        u.setAge(age);
        Update();
    }

    public String getTel() {
        return u.getTel();
    }

    public void setTel(String tel) {
        u.setTel(tel);
        Update();
    }

    public String getEmail() {
        return u.getEmail();
    }

    public void setEmail(String email) {
        u.setEmail(email);
        Update();
    }

    public String getQq() {
        return u.getQq();
    }

    public void setQq(String qq) {
        u.setQq(qq);
        Update();
    }

    public String getRegtime() {
        return u.getRegtime();
    }

    public String getAddress() {
        return u.getAddress();
    }

    public void setAddress(String address) {
        u.setAddress(address);
        Update();
    }

    public String getHttp() {
        return u.getHttp();
    }

    public void setHttp(String http) {
        u.setHttp(http);
        Update();
    }

    public String getResume() {
        return u.getResume();
    }

    public void setResume(String resume) {
        u.setResume(resume);
        Update();
    }

    public int getStatus() {
        return u.getStatus();
    }

    public void setStatus(int status) {
        u.setStatus(status);
        Update_m();
    }

    public int getState() {
        return u.getState();
    }

    public void setState(int state) {
        u.setState(state);
        Update_m();
    }
    public String getIid() {
        return u.getIid();
    }
    public void setIid(String iid) {
        u.setIid(iid);
        Update();
    }
    public String getUid() {
        return u.getUid();
    }
    public void setUid(String Uid) {
        u.setUid(Uid);
    }

}
