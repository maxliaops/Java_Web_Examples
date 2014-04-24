package com.dao;

import java.sql.*;
import java.util.*;
import com.core.Database;
import com.core.FinalConstants;
import com.core.ParamUtils;
import com.jspsmart.upload.Request;
import com.model.Resolvent;

/**
 * <p>Title: </p>
 * <p>Description: </p>
 * <p>Copyright: Copyright (c) 2004</p>
 * <p>Company: MR</p>
 * @author BWM
 * @version 1.0
 */

public class Dbresolvent extends Resolvent {
    private Resolvent r = new Resolvent();
    public Dbresolvent() {
    }

    public Dbresolvent(Request request, String iid) {
        r.setSid(ParamUtils.getIntParameter(request, "sid"));
        r.setUid(ParamUtils.getRequestString(request, "uid"));
        r.setSfid(ParamUtils.getIntParameter(request, "sfid"));
        r.setName(ParamUtils.getRequestString(request, "name"));
        r.setIid(ParamUtils.nullToString(iid));
        r.setContent(ParamUtils.getRequestString(request, "content"));
    }

    public Dbresolvent(String sql) {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            con = Database.getConnection();
            ps = con.prepareStatement(FinalConstants.SELECT_RESOLVENT + sql,
                                      ResultSet.TYPE_SCROLL_INSENSITIVE,
                                      ResultSet.CONCUR_READ_ONLY);
            rs = ps.executeQuery();
            if (rs.next()) {
                r.setRid(rs.getInt("rid"));
                r.setSid(rs.getInt("sid"));
                r.setUid(ParamUtils.getSqlString(rs.getString("uid")));
                r.setSfid(rs.getInt("sfid"));
                r.setName(ParamUtils.getSqlString(rs.getString("name")));
                r.setUptime(ParamUtils.getSqlString(rs.getString("uptime")));
                r.setIid(ParamUtils.getSqlString(rs.getString("iid")));
                r.setContent(ParamUtils.getSqlString(rs.getString("content")));
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
            e.printStackTrace();
        } finally {
            System.out.println(ps + " Dbresolvent(String sql) " + FinalConstants.SELECT_RESOLVENT + sql);
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

    public boolean Insert() {
        boolean b = false;
        Connection con = null;
        PreparedStatement ps = null;
        try {
            con = Database.getConnection();
            ps = con.prepareStatement(FinalConstants.INSERT_RESOLVENT);
            ps.setInt(1, r.getSid());
            ps.setString(2, r.getUid());
            ps.setInt(3, r.getSfid());
            ps.setString(4, r.getName());
            ps.setString(5, r.getIid());
            ps.setString(6, r.getContent());
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
            System.out.println(ps + " Dbresolvent.Insert()");
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
            ps = con.prepareStatement(FinalConstants.SELECT_RESOLVENT + sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Resolvent res = new Resolvent();
                res.setRid(rs.getInt("rid"));
                res.setSid(rs.getInt("sid"));
                res.setUid(ParamUtils.getSqlString(rs.getString("uid")));
                res.setSfid(rs.getInt("sfid"));
                res.setName(ParamUtils.getSqlString(rs.getString("name")));
                res.setUptime(ParamUtils.getSqlString(rs.getString("uptime")));
                res.setIid(ParamUtils.getSqlString(rs.getString("iid")));
                res.setContent(ParamUtils.getSqlString(rs.getString("content")));
                coll.add(res);
            }
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        } finally {
            System.out.println(ps + " Dbresolvent.Select(String sql) ");
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
            ps = con.prepareStatement(FinalConstants.SELECT_RESOLVENT + sql);
            rs = ps.executeQuery();
            if (tip <= 0) {
                rs.beforeFirst();
            } else {
                if (!rs.absolute(tip)) {
                    rs.beforeFirst();
                }
            }
            for (int i = 1; rs.next() && i <= FinalConstants.STEP; i++) {
                Resolvent res = new Resolvent();
                res.setRid(rs.getInt("rid"));
                res.setSid(rs.getInt("sid"));
                res.setUid(ParamUtils.getSqlString(rs.getString("uid")));
                res.setSfid(rs.getInt("sfid"));
                res.setName(ParamUtils.getSqlString(rs.getString("name")));
                res.setUptime(ParamUtils.getSqlString(rs.getString("uptime")));
                res.setIid(ParamUtils.getSqlString(rs.getString("iid")));
                res.setContent(ParamUtils.getSqlString(rs.getString("content")));
                coll.add(res);
            }
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        } finally {
            System.out.println(ps + " Dbresolvent.Select(int page,String sql) ");
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
            ps = con.prepareStatement(FinalConstants.UPDATE_RESOLVENT);
            ps.setInt(1, r.getSid());
            ps.setInt(2, r.getSfid());
            ps.setString(3, r.getName());
            ps.setString(4, r.getContent());
            ps.setInt(5, r.getRid());
            if (ps.executeUpdate() > 0) {
                b = true;
            } else {
                b = false;
            }
        } catch (SQLException e) {
            b = false;
            e.printStackTrace();
        } finally {
            System.out.println(ps + " Dbresolvent.Update() ");
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

    public int getRid() {
        return r.getRid();
    }

    public void setRid(int rid) {
        r.setRid(rid);
    }

    public int getSid() {
        return r.getSid();
    }

    public void setSid(int sid) {
        r.setSid(sid);
        Update();
    }

    public int getSfid() {
        return r.getSfid();
    }

    public void setSfid(int sfid) {
        r.setSfid(sfid);
        Update();
    }

    public String getUid() {
        return r.getUid();
    }

    public void setUid(String uid) {
        r.setUid(uid);
    }

    public String getName() {
        return r.getName();
    }

    public void setName(String name) {
        r.setName(name);
        Update();
    }

    public String getUptime() {
        return r.getUptime();
    }

    public void setUptime(String uptime) {
        r.setUptime(uptime);
    }

    public String getIid() {
        return r.getIid();
    }

    public void setIid(String iid) {
        r.setIid(iid);
    }

    public String getContent() {
        return r.getContent();
    }

    public void setContent(String content) {
        r.setContent(content);
        Update();
    }

}