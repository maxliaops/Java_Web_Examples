package com.bwm.db;

import java.sql.*;

/**
 *class explain:Database connection
 *set up name:	crazyadept
 *set up time:	11/22/2004
 */
public class Conn {
    private static Connection con;
    private Statement stmt;
    private ResultSet rs;
    private static final String drivername =
        "com.microsoft.sqlserver.jdbc.SQLServerDriver";
    private static final String url = "jdbc:sqlserver://127.0.0.1:1433;DatabaseName=db_Job;user=sa;password=;";

    /**
     *method explain:   Get Connection DataBase
     *modify time:	12/20/2004
     */
    public static synchronized Connection getCon() throws Exception {
        try {
            Class.forName(drivername);
            con = DriverManager.getConnection(url);
            return con;
        } catch (SQLException e) {
            System.err.println(e.getMessage());
            throw e;
        }
    }

    /**
     *output parameter:	in order select in SQL
     *modify time:	12/20/2004
     */
    public Statement getStmtread() {
        try {
            con = getCon();
            stmt = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,
                                       ResultSet.CONCUR_READ_ONLY);
            return stmt;
        } catch (Exception e) {
            System.err.println(e.getMessage());
            e.printStackTrace();
        }
        return null;
    }

    /**
     *output parameter: Data
     *input parameter:  SQL select sentence
     *modify time:      11/29/2004
     */
    public ResultSet getRs(String sql) {
        try {
            stmt = getStmtread();
            rs = stmt.executeQuery(sql);
            return rs;
        } catch (Exception e) {
            System.err.println(e.getMessage());
            e.printStackTrace();
        }
        return null;
    }

    /**
     *output parameter: not in order select in str SQL
     *modify time:      11/29/2004
     */
    public Statement getStmt() {
        try {
            con = getCon();
            stmt = con.createStatement();
            return stmt;
        } catch (Exception e) {
            System.err.println(e.getMessage());
            e.printStackTrace();
        }
        return null;
    }

    /**
     *method explain:   Close DataBase Connection
     *modify time:      11/29/2004
     */
    public synchronized void close() {
        try {
            if (rs != null) {
                rs.close();
                rs = null;
            }
        } catch (Exception e) {
            System.err.println(e.getMessage());
            e.printStackTrace();
        }
        try {
            if (stmt != null) {
                stmt.close();
                stmt = null;
            }
        } catch (Exception e) {
            System.err.println(e.getMessage());
            e.printStackTrace();
        }
        try {
            if (con != null) {
                con.close();
                con = null;
            }
        } catch (Exception e) {
            System.err.println(e.getMessage());
            e.printStackTrace();
        }
    }
}