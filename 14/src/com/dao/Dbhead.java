package com.dao;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.ResultSet;
import java.sql.Connection;
import java.util.Collection;
import java.util.ArrayList;
import com.jspsmart.upload.Request;
import com.model.Head;

import com.core.Database;
import com.core.FinalConstants;
import com.core.ParamUtils;
import com.core.StringUtils;
/**
 * <p>Title: </p>
 * <p>Description: </p>
 * <p>Copyright: Copyright (c) 2004</p>
 * <p>Company: MR</p>
 * @author BWM
 * @version 1.0
 */

public class Dbhead extends Head{
    private Head h=new Head();
    public Dbhead() {
    }
    public Dbhead(String iid,String path,int state) {
        h.setIid(ParamUtils.getSqlString(iid));
        h.setPath(path);
        h.setState(state);
    }
    public Dbhead(String sql) {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            con = Database.getConnection();
            ps = con.prepareStatement(FinalConstants.SELECT_HEAD+sql,ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
            rs = ps.executeQuery();
            System.out.println(FinalConstants.SELECT_HEAD+sql+"]aa");
            if (rs.next()) {
            System.out.println(FinalConstants.SELECT_HEAD+sql+"]aa");
                h.setIid(ParamUtils.getSqlString(rs.getString("iid")));
                h.setPath(ParamUtils.getSqlString(rs.getString("path")));
                h.setAtime(ParamUtils.getSqlString(rs.getString("atime")));
                h.setState(rs.getInt("state"));
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
            e.printStackTrace();
        } finally {
        System.out.println(ps+" Dbhead "+FinalConstants.SELECT_HEAD+sql);
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
            ps = con.prepareStatement(FinalConstants.INSERT_HEAD);
            ps.setString(1, h.getIid());
            ps.setString(2, StringUtils.toUnicode(h.getPath()));
            ps.setInt(3, h.getState());
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
        System.out.println(ps+" Dbhead.Insert() ");
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
            rs = ps.executeQuery();
            while(rs.next()) {
                Head head=new Head();
                head.setIid(ParamUtils.getSqlString(rs.getString("iid")));
                head.setPath(ParamUtils.getSqlString(rs.getString("path")));
                head.setAtime(ParamUtils.getSqlString(rs.getString("atime")));
                head.setState(rs.getInt("state"));
                coll.add(head);
            }
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        } finally {
        System.out.println(ps+" Dbhead.Select(String sql) ");
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
    public Collection Select(int page, String sql) {
        Collection coll = new ArrayList();
        Connection con = null;
        ResultSet rs = null;
        PreparedStatement ps = null;
        int tip = FinalConstants.STEP * (page - 1);
        try {
            con = Database.getConnection();
            ps = con.prepareStatement(FinalConstants.SELECT_HEAD + sql);
            rs = ps.executeQuery();
            if (tip <= 0) {
                rs.beforeFirst();
            } else {
                if (!rs.absolute(tip)) {
                    rs.beforeFirst();
                }
            }
            for (int i = 1; rs.next() && i <= FinalConstants.STEP; i++) {
                Head head=new Head();
                head.setIid(ParamUtils.getSqlString(rs.getString("iid")));
                head.setPath(ParamUtils.getSqlString(rs.getString("path")));
                System.out.println(head.getPath()+"]");
                head.setAtime(ParamUtils.getSqlString(rs.getString("atime")));
                head.setState(rs.getInt("state"));
                coll.add(head);
            }
        } catch (SQLException ex) {
            System.out.println(ex.getMessage()+" Dbhead.Select(int page,String sql) ");
        } finally {
        System.out.println(ps+" Dbhead.Select(int page,String sql) ");
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
    public String getIid() {
        return h.getIid();
    }
    public void setIid(String iid) {
        h.setIid(iid);
    }
    public String getPath() {
        return h.getPath();
    }
    public void setPath(String path) {
        h.setPath(path);
    }
    public String getAtime() {
        return h.getAtime();
    }
    public void setAtime(String atime) {
        h.setAtime(atime);
    }
    public int getState() {
        return h.getState();
    }
    public void setState(int state) {
        h.setState(state);
    }
}