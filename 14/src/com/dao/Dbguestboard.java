package com.dao;

import java.sql.*;
import java.util.*;
import javax.servlet.http.HttpServletRequest;
import com.core.*;
import com.model.Guestboard;

/**
 * <p>Title: </p>
 * <p>Description: </p>
 * <p>Copyright: Copyright (c) 2004</p>
 * <p>Company: MR</p>
 * @author BWM
 * @version 1.0
 */

public class Dbguestboard extends Guestboard {
    private Guestboard g = new Guestboard();  //实例化Guestboard的一个对象
    public Dbguestboard() {  //构造方法
    }
//通过SQL语句获取留言信息
    public Dbguestboard(String sql) {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            con = Database.getConnection();
            ps = con.prepareStatement(FinalConstants.SELECT_GUESTBOARD + sql,
                                      ResultSet.TYPE_SCROLL_INSENSITIVE,
                                      ResultSet.CONCUR_READ_ONLY);
            rs = ps.executeQuery();
            if (rs.next()) {
                g.setGid(rs.getInt("gid"));
                g.setTitle(ParamUtils.getSqlString(rs.getString("title")));
                g.setGuest(ParamUtils.getSqlString(rs.getString("guest")));
                g.setGtime(ParamUtils.getSqlString(rs.getString("gtime")));
                g.setContent(ParamUtils.getSqlString(rs.getString("content")));
                g.setGflag(rs.getInt("gflag"));
                g.setRtime(ParamUtils.getSqlString(rs.getString("rtime")));
                g.setRecontent(ParamUtils.getSqlString(rs.getString("recontent")));
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
            e.printStackTrace();
        } finally {
            System.out.println(ps + " Dbguestboard(String sql) " +
                               FinalConstants.SELECT_GUESTBOARD + sql);
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
//从表单中获取留言信息
    public Dbguestboard(HttpServletRequest request) {
        g.setTitle(ParamUtils.getRequestString(request, "title"));
        g.setGuest(ParamUtils.getRequestString(request, "guest"));
        g.setContent(ParamUtils.getRequestString(request, "content"));
        g.setGflag(ParamUtils.getIntParameter(request, "gflag"));
        g.setRecontent(ParamUtils.getRequestString(request, "recontent"));
    }
//添加留言信息
    public boolean Insert() {
        boolean b = false;
        Connection con = null;
        PreparedStatement ps = null;
        try {
            con = Database.getConnection();
            ps = con.prepareStatement(FinalConstants.INSERT_GUESTBOARD);
            ps.setString(1, g.getTitle());
            ps.setString(2, g.getGuest());
            ps.setString(3, g.getContent());
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
            System.out.println(ps + " Dbguestboard.Insert()");
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
    //通过SQL语句查询留言信息
    public Collection Select(String sql) {
        Collection coll = new ArrayList();
        Connection con = null;
        ResultSet rs = null;
        PreparedStatement ps = null;
        try {
            con = Database.getConnection();
            ps = con.prepareStatement(FinalConstants.SELECT_GUESTBOARD + sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Guestboard gb = new Guestboard();
                gb.setGid(rs.getInt("gid"));
                gb.setTitle(ParamUtils.getSqlString(rs.getString("title")));
                gb.setGuest(ParamUtils.getSqlString(rs.getString("guest")));
                gb.setGtime(ParamUtils.getSqlString(rs.getString("gtime")));
                gb.setContent(ParamUtils.getSqlString(rs.getString("content")));
                gb.setGflag(rs.getInt("gflag"));
                gb.setRtime(ParamUtils.getSqlString(rs.getString("rtime")));
                gb.setRecontent(ParamUtils.getSqlString(rs.getString("recontent")));
                coll.add(gb);
            }
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        } finally {
            System.out.println(ps + " Dbguestboard.Select(String sql) ");
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

    //根据页数+SQL条件查询留言信息
    public Collection Select(int page, String sql) {
        Collection coll = new ArrayList();
        Connection con = null;
        ResultSet rs = null;
        PreparedStatement ps = null;
        int tip = FinalConstants.STEP * (page - 1);
        try {
            con = Database.getConnection();
            ps = con.prepareStatement(FinalConstants.SELECT_GUESTBOARD + sql);
            rs = ps.executeQuery();
            if (tip <= 0) {
                rs.beforeFirst();
            } else {
                if (!rs.absolute(tip)) {
                    rs.beforeFirst();
                }
            }
            for (int i = 1; rs.next() && i <= FinalConstants.STEP; i++) {
                Guestboard gb = new Guestboard();
                gb.setGid(rs.getInt("gid"));
                gb.setTitle(ParamUtils.getSqlString(rs.getString("title")));
                gb.setGuest(ParamUtils.getSqlString(rs.getString("guest")));
                gb.setGtime(ParamUtils.getSqlString(rs.getString("gtime")));
                gb.setContent(ParamUtils.getSqlString(rs.getString("content")));
                gb.setGflag(rs.getInt("gflag"));
                gb.setRtime(ParamUtils.getSqlString(rs.getString("rtime")));
                gb.setRecontent(ParamUtils.getSqlString(rs.getString("recontent")));
                coll.add(gb);
            }
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        } finally {
            System.out.println(ps + " Dbguestboard.Select(int page,String sql) ");
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
//添加回复信息
    private boolean Update() {
        boolean b = false;
        Connection con = null;
        PreparedStatement ps = null;
        try {
            con = Database.getConnection();
            ps = con.prepareStatement(FinalConstants.UPDATE_GUESTBOARD);
            ps.setString(1, g.getRecontent());
            ps.setInt(2, g.getGid());
            if (ps.executeUpdate() > 0) {
                b = true;
            } else {
                b = false;
            }
        } catch (SQLException e) {
            b = false;
            e.printStackTrace();
        } finally {
            System.out.println(ps + " Dbguestboard.Update() ");
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
//设置留言ID
    public void setGid(int gid) {
        g.setGid(gid);
    }
//获取留言ID
    public int getGid() {
        return g.getGid();
    }

    public String getTitle() {
        return g.getTitle();
    }

    public void setTitle(String title) {
        g.setTitle(title);
    }

    public String getGuest() {
        return g.getGuest();
    }

    public void setGuest(String guest) {
        g.setGuest(guest);
    }

    public String getGtime() {
        return g.getGtime();
    }

    public void setGtime(String gtime) {
        g.setGtime(gtime);
    }

    public String getContent() {
        return g.getContent();
    }

    public void setContent(String content) {
        g.setContent(content);
    }
//获取是否回复标记
    public int getGflag() {
        return g.getGflag();
    }
//设置是否回复标记
    public void setGflag(int gflag) {
        g.setGflag(gflag);
        Update();   //更新回复标记字段
    }
//获取回复时间
    public String getRtime() {
        return g.getRtime();
    }
//设置回复时间
    public void setRtime(String rtime) {
        g.setRtime(rtime);  //此处不用添加Update();语句，更新回复时间的工作由系统自动完成，因在更新语句中加入了now()方法
    }
//获取回复内容
    public String getRecontent() {
        return g.getRecontent();
    }
//设置回复内容
    public void setRecontent(String recontent) {
        g.setRecontent(recontent);
        Update();   //保存回复信息
    }
}
