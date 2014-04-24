package com.dao;

import java.sql.*;
import java.util.*;
import com.core.Database;
import com.core.FinalConstants;
import com.core.ParamUtils;
import com.core.StringUtils;
import com.jspsmart.upload.Request;
import com.model.Mend;

/**
 * <p>Title: </p>
 * <p>Description: </p>
 * <p>Copyright: Copyright (c) 2004</p>
 * <p>Company: MR</p>
 * @author BWM
 * @version 1.0
 */

public class Dbmend extends Mend {
    public Dbmend() {
    }

    public Dbmend(String sql) {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            con = Database.getConnection();
            ps = con.prepareStatement(FinalConstants.SELECT_MEND + sql,
                                      ResultSet.TYPE_SCROLL_INSENSITIVE,
                                      ResultSet.CONCUR_READ_ONLY);
            rs = ps.executeQuery();
            if (rs.next()) {
                m.setMid(rs.getInt("mid"));
                m.setPath(ParamUtils.getSqlString(rs.getString("path")));
                m.setSid(rs.getInt("sid"));
                m.setName(ParamUtils.getSqlString(rs.getString("name")));
                m.setState(rs.getInt("state"));
                m.setUptime(ParamUtils.getSqlString(rs.getString("uptime")));
                m.setCommend(rs.getInt("commend"));
                m.setLoadnum(rs.getInt("loadnum"));
                m.setFilesize(rs.getInt("filesize"));
                m.setResume(ParamUtils.getSqlString(rs.getString("resume")));
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
            e.printStackTrace();
        } finally {
            System.out.println(ps + " Dbmend(String sql) " + m.getMid());
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

    public Dbmend(Request request,String mid) {
        m.setPath(mid);
        m.setSid(ParamUtils.getIntParameter(request, "sid"));
        m.setName(ParamUtils.getRequestString(request, "name"));
        m.setUptime(ParamUtils.getRequestString(request, "uptime"));
        m.setCommend(ParamUtils.getIntParameter(request, "commend"));
        m.setLoadnum(ParamUtils.getIntParameter(request, "loanum"));
        m.setState(ParamUtils.getIntParameter(request, "state"));
        m.setFilesize(ParamUtils.getIntParameter(request, "filesize"));
        m.setResume(ParamUtils.getRequestString(request, "resume"));
    }

    private Mend m = new Mend();
    public boolean Insert() {
        boolean b = false;
        Connection con = null;
        PreparedStatement ps = null;
        try {
            con = Database.getConnection();
            ps = con.prepareStatement(FinalConstants.INSERT_MEND);
            ps.setInt(1, m.getSid());
            ps.setString(2,m.getName());
            ps.setString(3,StringUtils.toUnicode( m.getPath()));	//解决不能上传中文的问题
            ps.setInt(4, m.getState());
            ps.setInt(5, m.getCommend());
            ps.setInt(6, m.getLoadnum());
            ps.setInt(7, m.getFilesize());
            ps.setString(8, m.getResume());
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
            System.out.println(ps + " Dbmend.Insert()");
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
            ps = con.prepareStatement(FinalConstants.SELECT_MEND + sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Mend link = new Mend();
                link.setMid(rs.getInt("mid"));
                link.setSid(rs.getInt("sid"));
                link.setPath(rs.getString("path"));
                link.setName(ParamUtils.getSqlString(rs.getString("name")));
                link.setState(rs.getInt("state"));
                link.setUptime(ParamUtils.getSqlString(rs.getString("uptime")));
                link.setCommend(rs.getInt("commend"));
                link.setLoadnum(rs.getInt("loadnum"));
                link.setFilesize(rs.getInt("filesize"));
                link.setResume(ParamUtils.getSqlString(rs.getString("resume")));
                coll.add(link);
            }
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        } finally {
            System.out.println(ps + " Dbmend.Select(String sql) ");
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
            ps = con.prepareStatement(FinalConstants.SELECT_MEND + sql);
            rs = ps.executeQuery();
            if (tip <= 0) {
                rs.beforeFirst();
            } else {
                if (!rs.absolute(tip)) {
                    rs.beforeFirst();
                }
            }
            for (int i = 1; rs.next() && i <= FinalConstants.STEP; i++) {
                Mend link = new Mend();
                link.setMid(rs.getInt("mid"));
                link.setSid(rs.getInt("sid"));
                link.setPath(rs.getString("path"));
                link.setName(ParamUtils.getSqlString(rs.getString("name")));
                link.setState(rs.getInt("state"));
                link.setUptime(ParamUtils.getSqlString(rs.getString("uptime")));
                link.setCommend(rs.getInt("commend"));
                link.setLoadnum(rs.getInt("loadnum"));
                link.setFilesize(rs.getInt("filesize"));
                link.setResume(ParamUtils.getSqlString(rs.getString("resume")));
                coll.add(link);
            }
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        } finally {
            System.out.println(ps + " Dbmend.Select(int page,String sql) ");
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
            ps = con.prepareStatement(FinalConstants.UPDATE_MEND);
            ps.setInt(1, m.getSid());
            ps.setString(2, m.getName());
            ps.setInt(3, m.getState());
            ps.setInt(4, m.getCommend());
            ps.setInt(5, m.getLoadnum());
            ps.setInt(6, m.getFilesize());
            ps.setString(7, m.getResume());
            ps.setInt(8, m.getMid());
            if (ps.executeUpdate() > 0) {
                b = true;
            } else {
                b = false;
            }
        } catch (SQLException e) {
            b = false;
            e.printStackTrace();
        } finally {
            System.out.println(ps + " Dbmend.Update() ");
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
    //文件下载时应用的更新下载次数的方法
    private boolean Update_load() {
        boolean b = false;
        Connection con = null;
        PreparedStatement ps = null;
        try {
            con = Database.getConnection();
            ps = con.prepareStatement(FinalConstants.UPDATE_MEND_LOAD);
            ps.setInt(1, m.getLoadnum());
            ps.setInt(2, m.getMid());
            if (ps.executeUpdate() > 0) {
                b = true;
            } else {
                b = false;
            }
        } catch (SQLException e) {
            b = false;
            e.printStackTrace();
        } finally {
            System.out.println(ps + " Dbmend.Update_load() ");
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
    public int getMid() {
        return m.getMid();
    }

    public void setMid(int mid) {
        m.setMid(mid);
    }
    public String getPath() {
        return m.getPath();
    }

    public void setMid(String mid) {
        m.setPath(mid);
    }

    public int getSid() {
        return m.getSid();
    }

    public void setSid(int sid) {
        m.setSid(sid);
        this.Update();
    }

    public String getName() {
        return m.getName();
    }

    public void setName(String name) {
        m.setName(name);
        this.Update();
    }

    public int getState() {
        return m.getState();
    }

    public void setState(int state) {
        m.setState(state);
        this.Update();
    }

    public String getUptime() {
        return m.getUptime();
    }

    public void setUptime(String uptime) {
        m.setUptime(uptime);
    }

    public int getCommend() {
        return m.getCommend();
    }

    public void setCommend(int commend) {
        m.setCommend(commend);
        this.Update();
    }

    public int getLoadnum() {
        return m.getLoadnum();
    }

    public void setLoadnum(int loadnum) {
        m.setLoadnum(loadnum);
        this.Update_load();
    }

    public int getFilesize() {
        return m.getFilesize();
    }

    public void setFilesize(int filesize) {
        m.setFilesize(filesize);
        this.Update();
    }

    public String getResume() {
        return m.getResume();
    }

    public void setResume(String resume) {
        m.setResume(resume);
        this.Update();
    }

}