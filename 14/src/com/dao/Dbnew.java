package com.dao;

import java.sql.*;
import java.util.*;
import javax.servlet.http.HttpServletRequest;
import com.core.Database;
import com.core.FinalConstants;
import com.core.ParamUtils;
import com.model.New;

/**
 * <p>Title: </p>
 * <p>Description: </p>
 * <p>Copyright: Copyright (c) 2004</p>
 * <p>Company: MR</p>
 * @author BWM
 * @version 1.0
 */

public class Dbnew extends New {
    private New n=new New();
    public Dbnew() {
    }
    public Dbnew(String sql) {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            con = Database.getConnection();
            ps = con.prepareStatement(FinalConstants.SELECT_NEW + sql,
                                      ResultSet.TYPE_SCROLL_INSENSITIVE,
                                      ResultSet.CONCUR_READ_ONLY);
            rs = ps.executeQuery();
            if (rs.next()) {
                n.setNid(rs.getInt("nid"));
                n.setUid(ParamUtils.getSqlString(rs.getString("uid")));
                n.setTitle(ParamUtils.getSqlString(rs.getString("title")));
                n.setNtime(ParamUtils.getSqlString(rs.getString("ntime")));
                n.setFromto(ParamUtils.getSqlString(rs.getString("fromto")));
                n.setContent(ParamUtils.getSqlString(rs.getString("content")));
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
            e.printStackTrace();
        } finally {
            System.out.println(ps + " Dbnew(String sql) " + n.getNid());
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
    public Dbnew(HttpServletRequest request) {
        n.setUid(ParamUtils.getRequestString(request, "uid"));
        n.setTitle(ParamUtils.getRequestString(request, "title"));
        n.setFromto(ParamUtils.getRequestString(request, "fromto"));
        n.setContent(ParamUtils.getRequestString(request, "content"));
    }
    public boolean Insert() {
        boolean b = false;
        Connection con = null;
        PreparedStatement ps = null;
        try {
            con = Database.getConnection();
            ps = con.prepareStatement(FinalConstants.INSERT_NEW);
            ps.setString(1, n.getUid());
            ps.setString(2, n.getTitle());
            ps.setString(3, n.getFromto());
            ps.setString(4, n.getContent());
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
            System.out.println(ps + " Dbnew.Insert()");
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
            ps = con.prepareStatement(FinalConstants.SELECT_NEW + sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                New nw= new New();
                nw.setNid(rs.getInt("nid"));
                nw.setUid(ParamUtils.getSqlString(rs.getString("uid")));
                nw.setTitle(ParamUtils.getSqlString(rs.getString("title")));
                nw.setNtime(ParamUtils.getSqlString(rs.getString("ntime")));
                nw.setFromto(ParamUtils.getSqlString(rs.getString("fromto")));
                nw.setContent(ParamUtils.getSqlString(rs.getString("content")));
                coll.add(nw);
            }
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        } finally {
            System.out.println(ps + " Dbnew.Select(String sql) ");
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

    //Ò³Êý+SQLÌõ¼þ
    public Collection Select(int page, String sql) {
        Collection coll = new ArrayList();
        Connection con = null;
        ResultSet rs = null;
        PreparedStatement ps = null;
        int tip = FinalConstants.STEP * (page - 1);
        try {
            con = Database.getConnection();
            ps = con.prepareStatement(FinalConstants.SELECT_NEW + sql);
            rs = ps.executeQuery();
            if (tip <= 0) {
                rs.beforeFirst();
            } else {
                if (!rs.absolute(tip)) {
                    rs.beforeFirst();
                }
            }
            for (int i = 1; rs.next() && i <= FinalConstants.STEP; i++) {
                New nw= new New();
                nw.setNid(rs.getInt("nid"));
                nw.setUid(ParamUtils.getSqlString(rs.getString("uid")));
                nw.setTitle(ParamUtils.getSqlString(rs.getString("title")));
                nw.setNtime(ParamUtils.getSqlString(rs.getString("ntime")));
                nw.setFromto(ParamUtils.getSqlString(rs.getString("fromto")));
                nw.setContent(ParamUtils.getSqlString(rs.getString("content")));
                coll.add(nw);
            }
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        } finally {
            System.out.println(ps + " Dbaffiche.Select(int page,String sql) ");
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
    public int getNid() {
        return n.getNid();
    }
    public void setNid(int nid) {
        n.setNid(nid);
    }
    public String getUid() {
        return n.getUid();
    }
    public void setUid(String uid) {
        n.setUid(uid);
    }
    public String getNtime() {
        return n.getNtime();
    }
    public void setNtime(String ntime) {
        n.setNtime(ntime);
    }
    public String getFromto() {
        return n.getFromto();
    }
    public void setFromto(String fromto) {
        n.setFromto(fromto);
    }
    public String getContent() {
        return n.getContent();
    }
    public void setContent(String content) {
        n.setContent(content);
    }
    public String getTitle() {
        return n.getTitle();
    }
    public void setTitle(String title) {
        n.setTitle(title);
    }
}