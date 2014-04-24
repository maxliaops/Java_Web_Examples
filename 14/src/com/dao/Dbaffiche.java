package com.dao;

import java.sql.*;
import java.util.*;
import javax.servlet.http.HttpServletRequest;
import com.core.*;
import com.model.Affiche;

/**
 * <p>Title: </p>
 * <p>Description: </p>
 * <p>Copyright: Copyright (c) 2004</p>
 * <p>Company: MR</p>
 * @author BWM
 * @version 1.0
 */

public class Dbaffiche extends Affiche {
    private Affiche a = new Affiche();
    public Dbaffiche() {
    }

    public Dbaffiche(String sql) {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            con = Database.getConnection();
            ps = con.prepareStatement(FinalConstants.SELECT_AFFICHE + sql,
                                      ResultSet.TYPE_SCROLL_INSENSITIVE,
                                      ResultSet.CONCUR_READ_ONLY);
            rs = ps.executeQuery();
            if (rs.next()) {
                a.setAid(rs.getInt("aid"));
                a.setUid(ParamUtils.getSqlString(rs.getString("uid")));
                a.setTitle(ParamUtils.getSqlString(rs.getString("title")));
                a.setAtime(ParamUtils.getSqlString(rs.getString("atime")));
                a.setContent(ParamUtils.getSqlString(rs.getString("content")));
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
            e.printStackTrace();
        } finally {
            System.out.println(ps + " Dbaffiche(String sql) " + a.getAid());
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

    public Dbaffiche(HttpServletRequest request) {
        a.setUid(ParamUtils.getRequestString(request, "uid"));
        a.setTitle(ParamUtils.getRequestString(request, "title"));
        a.setContent(ParamUtils.getRequestString(request, "content"));
    }

    public boolean Insert() {
        boolean b = false;
        Connection con = null;
        PreparedStatement ps = null;
        try {
            con = Database.getConnection();
            ps = con.prepareStatement(FinalConstants.INSERT_AFFICHE);
            ps.setString(1, a.getUid());
            ps.setString(2, a.getTitle());
            ps.setString(3, a.getContent());
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
            System.out.println(ps + " Dbaffiche.Insert()");
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
            ps = con.prepareStatement(FinalConstants.SELECT_AFFICHE + sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Affiche affiche = new Affiche();
                affiche.setAid(rs.getInt("aid"));
                affiche.setUid(ParamUtils.getSqlString(rs.getString("uid")));
                affiche.setTitle(ParamUtils.getSqlString(rs.getString("title")));
                affiche.setAtime(ParamUtils.getSqlString(rs.getString("atime")));
                affiche.setContent(ParamUtils.getSqlString(rs.getString("content")));
                coll.add(affiche);
            }
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        } finally {
            System.out.println(ps + " Dbaffiche.Select(String sql) "+FinalConstants.SELECT_AFFICHE + sql);
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
            ps = con.prepareStatement(FinalConstants.SELECT_AFFICHE + sql);
            rs = ps.executeQuery();
            if (tip <= 0) {
                rs.beforeFirst();
            } else {
                if (!rs.absolute(tip)) {
                    rs.beforeFirst();
                }
            }
            for (int i = 1; rs.next() && i <= FinalConstants.STEP; i++) {
                Affiche affiche = new Affiche();
                affiche.setAid(rs.getInt("aid"));
                affiche.setUid(ParamUtils.getSqlString(rs.getString("uid")));
                affiche.setTitle(ParamUtils.getSqlString(rs.getString("title")));
                affiche.setAtime(ParamUtils.getSqlString(rs.getString("atime")));
                affiche.setContent(ParamUtils.getSqlString(rs.getString("content")));
                coll.add(affiche);
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

    private boolean Update() {
        boolean b = false;
        Connection con = null;
        PreparedStatement ps = null;
        try {
            con = Database.getConnection();
            ps = con.prepareStatement(FinalConstants.UPDATE_AFFICHE);
            ps.setString(1,  a.getTitle());
            ps.setString(2, a.getContent());
            ps.setInt(3, a.getAid());
            if (ps.executeUpdate() > 0) {
                b = true;
            } else {
                b = false;
            }
        } catch (SQLException e) {
            b = false;
            e.printStackTrace();
        } finally {
            System.out.println(ps + " Dbaffiche.Update() ");
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

    public int getAid() {
        return a.getAid();
    }

    public void setAid(int aid) {
        a.setAid(aid);
    }

    public String getUid() {
        return a.getUid();
    }

    public void setUid(String uid) {
        a.setUid(uid);
    }

    public String getTitle() {
        return a.getTitle();
    }

    public void setTitle(String title) {
        a.setTitle(title);
        Update();
    }

    public String getAtime() {
        return a.getAtime();
    }

    public void setAtime(String atime) {
        a.setAtime(atime);
    }

    public String getContent() {
        return a.getContent();
    }

    public void setContent(String content) {
        a.setContent(content);
        Update();
    }

}