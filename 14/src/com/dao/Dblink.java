package com.dao;

import java.sql.*;
import java.util.*;
import javax.servlet.http.HttpServletRequest;
import com.core.Database;
import com.core.FinalConstants;
import com.core.ParamUtils;
import com.model.Link;

/**
 * <p>Title: </p>
 * <p>Description: </p>
 * <p>Copyright: Copyright (c) 2004</p>
 * <p>Company: MR</p>
 * @author BWM
 * @version 1.0
 */

public class Dblink extends Link {
    private Link l = new Link();
    public Dblink() {
    }

    public Dblink(String sql) {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            con = Database.getConnection();
            ps = con.prepareStatement(FinalConstants.SELECT_LINK + sql,
                                      ResultSet.TYPE_SCROLL_INSENSITIVE,
                                      ResultSet.CONCUR_READ_ONLY);
            rs = ps.executeQuery();
            if (rs.next()) {
                l.setLid(rs.getInt("lid"));
                l.setName(ParamUtils.getSqlString(rs.getString("name")));
                l.setLtime(ParamUtils.getSqlString(rs.getString("ltime")));
                l.setUrl(ParamUtils.getSqlString(rs.getString("url")));
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
            e.printStackTrace();
        } finally {
            System.out.println(ps + " Dblink(String sql) " + l.getLid());
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

    public Dblink(HttpServletRequest request) {
        l.setName(ParamUtils.getRequestString(request, "name"));
        l.setUrl(ParamUtils.getRequestString(request, "url"));
    }

    public boolean Insert() {
        boolean b = false;
        Connection con = null;
        PreparedStatement ps = null;
        try {
            con = Database.getConnection();
            ps = con.prepareStatement(FinalConstants.INSERT_LINK);
            ps.setString(1, l.getName());
            ps.setString(2, l.getUrl());
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
            System.out.println(ps + " Dblink.Insert()");
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
            ps = con.prepareStatement(FinalConstants.SELECT_LINK + sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Link link = new Link();
                link.setLid(rs.getInt("lid"));
                link.setName(ParamUtils.getSqlString(rs.getString("name")));
                link.setLtime(ParamUtils.getSqlString(rs.getString("ltime")));
                link.setUrl(ParamUtils.getSqlString(rs.getString("url")));
                coll.add(link);
            }
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        } finally {
            System.out.println(ps + " Dblink.Select(String sql) ");
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
            ps = con.prepareStatement(FinalConstants.SELECT_LINK + sql);
            rs = ps.executeQuery();
            if (tip <= 0) {
                rs.beforeFirst();
            } else {
                if (!rs.absolute(tip)) {
                    rs.beforeFirst();
                }
            }
            for (int i = 1; rs.next() && i <= FinalConstants.STEP; i++) {
                Link link = new Link();
                link.setLid(rs.getInt("lid"));
                link.setName(ParamUtils.getSqlString(rs.getString("name")));
                link.setLtime(ParamUtils.getSqlString(rs.getString("ltime")));
                link.setUrl(ParamUtils.getSqlString(rs.getString("url")));
                coll.add(link);
            }
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        } finally {
            System.out.println(ps + " Dblink.Select(int page,String sql) ");
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

    private boolean Update() {
        boolean b = false;
        Connection con = null;
        PreparedStatement ps = null;
        try {
            con = Database.getConnection();
            ps = con.prepareStatement(FinalConstants.UPDATE_LINK);
            ps.setString(1, l.getName());
            ps.setString(2, l.getUrl());
            ps.setInt(3, l.getLid());
            if (ps.executeUpdate() > 0) {
                b = true;
            } else {
                b = false;
            }
        } catch (SQLException e) {
            b = false;
            e.printStackTrace();
        } finally {
            System.out.println(ps + " Dblink.Update() ");
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

    public int getLid() {
        return l.getLid();
    }

    public void setLid(int lid) {
        l.setLid(lid);
    }

    public String getName() {
        return l.getName();
    }

    public void setName(String name) {
        l.setName(name);
        Update();
    }

    public String getLtime() {
        return l.getLtime();
    }

    public void setLtime(String ltime) {
        l.setLtime(ltime);
    }

    public String getUrl() {
        return l.getUrl();
    }

    public void setUrl(String url) {
        l.setUrl(url);
        Update();
    }

}