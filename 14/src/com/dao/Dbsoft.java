package com.dao;

import java.sql.*;
import java.util.*;
import com.model.Soft;
import com.core.*;
import com.jspsmart.upload.Request;

/**
 * <p>Title: </p>
 * <p>Description: </p>
 * <p>Copyright: Copyright (c) 2008</p>
 * <p>Company: MR</p>
 * @author wgh
 * @version 2.0
 */

public class Dbsoft extends Soft {
    private Soft s = new Soft();
    public Dbsoft() {
    }

    public Dbsoft(String sql) {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            con = Database.getConnection();
            ps = con.prepareStatement(FinalConstants.SELECT_SOFT + sql,
                                      ResultSet.TYPE_SCROLL_INSENSITIVE,
                                      ResultSet.CONCUR_READ_ONLY);
            rs = ps.executeQuery();
            if (rs.next()) {
                s.setSfid(rs.getInt("sfid"));
                s.setName(ParamUtils.getSqlString(rs.getString("name")));
                s.setEdition(ParamUtils.getSqlString(rs.getString("edition")));
                s.setPrice(rs.getFloat("price"));
                s.setUptime(ParamUtils.getSqlString(rs.getString("uptime")));
                s.setUid(ParamUtils.getSqlString(rs.getString("uid")));
                s.setIid(ParamUtils.getSqlString(rs.getString("iid")));
                s.setSid(rs.getInt("sid"));
                s.setEnvironment(ParamUtils.getSqlString(rs.getString("environment")));
                s.setFilesize(rs.getInt("filesize"));
                s.setCommend(rs.getInt("commend"));
                s.setLoadnum(rs.getInt("loadnum"));
                s.setRegular(rs.getInt("regular"));
                s.setIntroduce(ParamUtils.getSqlString(rs.getString("introduce")));
                s.setPath(ParamUtils.getSqlString(rs.getString("path")));
                s.setResume(ParamUtils.getSqlString(rs.getString("resume")));
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
            e.printStackTrace();
        } finally {
            System.out.println(ps + " Dbsoft(String sql) " +FinalConstants.SELECT_SOFT + sql);
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

    public Dbsoft(Request request,String path) {
        s.setName(ParamUtils.getRequestString(request, "name"));
        s.setEdition(ParamUtils.getRequestString(request, "edition"));
        s.setPrice(new Float(ParamUtils.getRequestString(request,"price")).floatValue());
        s.setUptime(ParamUtils.getRequestString(request,"uptime"));
        s.setUid(ParamUtils.getRequestString(request,"uid"));
        s.setIid(ParamUtils.getRequestString(request,"iid"));
        s.setSid(ParamUtils.getIntParameter(request,"sid"));
        s.setEnvironment(ParamUtils.getRequestString(request,"environment"));
        s.setFilesize(ParamUtils.getIntParameter(request,"filesize"));
        s.setCommend(ParamUtils.getIntParameter(request,"commend"));
        s.setLoadnum(ParamUtils.getIntParameter(request,"loadnum"));
        s.setRegular(ParamUtils.getIntParameter(request,"regular"));
        s.setIntroduce(ParamUtils.getRequestString(request,"introduce"));
        s.setPath(ParamUtils.nullToString(path));
        s.setResume(ParamUtils.getRequestString(request,"resume"));
    }

    public boolean Insert() {
        boolean b = false;
        Connection con = null;
        PreparedStatement ps = null;
        try {
            con = Database.getConnection();
            ps = con.prepareStatement(FinalConstants.INSERT_SOFT);
            ps.setString(1, s.getName());
            ps.setString(2, s.getEdition());
            ps.setFloat(3, s.getPrice());
            ps.setString(4, s.getUid());
            ps.setString(5, s.getIid());
            ps.setInt(6, s.getSid());
            ps.setString(7, s.getEnvironment());
            ps.setInt(8, s.getFilesize());
            ps.setInt(9, s.getCommend());
            ps.setInt(10, s.getLoadnum());
            ps.setInt(11, s.getRegular());
            ps.setString(12, s.getIntroduce());
            ps.setString(13, s.getPath());
            ps.setString(14, s.getResume());
            //System.out.print("getname:值"+StringUtils.StringtoSql(s.getName()));
            System.out.print("getname:值"+(s.getName()));
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
            System.out.println(ps + " Dbsoft.Insert()");
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
            ps = con.prepareStatement(FinalConstants.SELECT_SOFT + sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Soft link = new Soft();
                link.setSfid(rs.getInt("sfid"));
                link.setName(ParamUtils.getSqlString(rs.getString("name")));
                link.setEdition(ParamUtils.getSqlString(rs.getString("edition")));
                link.setPrice(rs.getFloat("price"));
                link.setUptime(ParamUtils.getSqlString(rs.getString("uptime")));
                link.setUid(ParamUtils.getSqlString(rs.getString("uid")));
                link.setIid(ParamUtils.getSqlString(rs.getString("iid")));
                link.setSid(rs.getInt("sid"));
                link.setEnvironment(ParamUtils.getSqlString(rs.getString("environment")));
                link.setFilesize(rs.getInt("filesize"));
                link.setCommend(rs.getInt("commend"));
                link.setLoadnum(rs.getInt("loadnum"));
                link.setRegular(rs.getInt("regular"));
                link.setIntroduce(ParamUtils.getSqlString(rs.getString("introduce")));
                link.setPath(ParamUtils.getSqlString(rs.getString("path")));
                link.setResume(ParamUtils.getSqlString(rs.getString("resume")));
                coll.add(link);
            }
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        } finally {
            System.out.println(ps + " Dbsoft.Select(String sql) "+FinalConstants.SELECT_SOFT + sql);
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
            ps = con.prepareStatement(FinalConstants.SELECT_SOFT + sql);
            rs = ps.executeQuery();
            if (tip <= 0) {
                rs.beforeFirst();
            } else {
                if (!rs.absolute(tip)) {
                    rs.beforeFirst();
                }
            }
            for (int i = 1; rs.next() && i <= FinalConstants.STEP; i++) {
                Soft link = new Soft();
                link.setSfid(rs.getInt("sfid"));
                link.setName(ParamUtils.getSqlString(rs.getString("name")));
                link.setEdition(ParamUtils.getSqlString(rs.getString("edition")));
                link.setPrice(rs.getFloat("price"));
                link.setUptime(ParamUtils.getSqlString(rs.getString("uptime")));
                link.setUid(ParamUtils.getSqlString(rs.getString("uid")));
                link.setIid(ParamUtils.getSqlString(rs.getString("iid")));
                link.setSid(rs.getInt("sid"));
                link.setEnvironment(ParamUtils.getSqlString(rs.getString("environment")));
                link.setFilesize(rs.getInt("filesize"));
                link.setCommend(rs.getInt("commend"));
                link.setLoadnum(rs.getInt("loadnum"));
                link.setRegular(rs.getInt("regular"));
                link.setIntroduce(ParamUtils.getSqlString(rs.getString("introduce")));
                link.setPath(ParamUtils.getSqlString(rs.getString("path")));
                link.setResume(ParamUtils.getSqlString(rs.getString("resume")));
                coll.add(link);
            }
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        } finally {
            System.out.println(ps + " Dbsoft.Select(int page,String sql) ");
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
            ps = con.prepareStatement(FinalConstants.UPDATE_SOFT);
            ps.setString(1, s.getName());
            ps.setString(2, s.getEdition());
            ps.setFloat(3, s.getPrice());
            ps.setString(4, s.getIid());
            ps.setInt(5, s.getSid());
            ps.setString(6, s.getEnvironment());
            ps.setInt(7, s.getFilesize());
            ps.setInt(8, s.getCommend());
            ps.setInt(9, s.getLoadnum());
            ps.setInt(10, s.getRegular());
            ps.setString(11, s.getIntroduce());
            ps.setString(12, StringUtils.toUnicode(s.getPath()));
            ps.setString(13, s.getResume());
            ps.setInt(14, s.getSfid());
            if (ps.executeUpdate() > 0) {
                b = true;
            } else {
                b = false;
            }
        } catch (SQLException e) {
            b = false;
            e.printStackTrace();
        } finally {
            System.out.println(ps + " Dbsoft.Update() ");
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
    private boolean Update_load() {
        boolean b = false;
        Connection con = null;
        PreparedStatement ps = null;
        try {
            con = Database.getConnection();
            ps = con.prepareStatement(FinalConstants.UPDATE_SOFT_LOAD);
            ps.setInt(1, s.getLoadnum());
            ps.setInt(2, s.getSfid());
            if (ps.executeUpdate() > 0) {
                b = true;
            } else {
                b = false;
            }
        } catch (SQLException e) {
            b = false;
            e.printStackTrace();
        } finally {
            System.out.println(ps + " Dbsoft.Update() ");
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
    public int getSfid() {
        return s.getSfid();
    }

    public void setSfid(int sfid) {
        s.setSfid(sfid);
    }

    public String getName() {
        return s.getName();
    }

    public void setName(String name) {
        s.setName(name);
        Update();
    }

    public String getEdition() {
        return s.getEdition();
    }

    public void setEdition(String edition) {
        s.setEdition(edition);
        Update();
    }

    public float getPrice() {
        return s.getPrice();
    }

    public void setPrice(float price) {
        s.setPrice(price);
        Update();
    }

    public String getUptime() {
        return s.getUptime();
    }

    public void setUptime(String uptime) {
        s.setUptime(uptime);
    }

    public String getUid() {
        return s.getUid();
    }

    public void setUid(String uid) {
        s.setUid(uid);
        Update();
    }

    public String getIid() {
        return s.getIid();
    }

    public void setIid(String iid) {
        s.setIid(iid);
        Update();
    }

    public int getSid() {
        return s.getSid();
    }

    public void setSid(int sid) {
        s.setSid(sid);
        Update();
    }

    public String getEnvironment() {
        return s.getEnvironment();
    }

    public void setEnvironment(String environment) {
        s.setEnvironment(environment);
        Update();
    }

    public int getFilesize() {
        return s.getFilesize();
    }

    public void setFilesize(int filesize) {
        s.setFilesize(filesize);
        Update();
    }

    public int getCommend() {
        return s.getCommend();
    }

    public void setCommend(int commend) {
        s.setCommend(commend);
        Update();
    }

    public int getLoadnum() {
        return s.getLoadnum();
    }

    public void setLoadnum(int loadnum) {
        s.setLoadnum(loadnum);
        Update_load();
    }

    public int getRegular() {
        return s.getRegular();
    }

    public void setRegular(int regular) {
        s.setRegular(regular);
        Update();
    }

    public String getIntroduce() {
        return s.getIntroduce();
    }

    public void setIntroduce(String introduce) {
        s.setIntroduce(introduce);
        Update();
    }

    public String getPath() {
        return s.getPath();
    }

    public void setPath(String path) {
        s.setPath(path);
        Update();
    }

    public String getResume() {
        return s.getResume();
    }

    public void setResume(String resume) {
        s.setResume(resume);
        Update();
    }
}
