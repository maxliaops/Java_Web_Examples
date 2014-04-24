package com.bwm.db;

import java.sql.*;

/**
 *class explain:DM
 *set up name:	crazyadept
 *set up time:	11/29/2004
 */
public class Data {

    private Conn con = new Conn();
    private Statement stmt;
    private ResultSet rs;

    /**
     *input parameter:  DataBase table name
     *output parameter: count = -2 ;Exception
     *		        count = -1 ;Error
     *			count = 0  ;Nothing
     *			count > 0  ;Right
     *modify time:	11/29/2004
     */
    public int getRowCount(String strSql) {
        int intCount = 0;
        try {
            stmt = con.getStmtread();
            rs = stmt.executeQuery("SELECT COUNT(*) FROM " + strSql);
            if (rs.next()) {
                intCount = rs.getInt(1);
            } else {
                intCount = -1;
            }
        } catch (Exception e) {
            intCount = -2;
            System.err.println(e.getMessage());
            e.printStackTrace();
        } finally {
            con.close();
            return intCount;
        }
    }

    /**
     *input parameter:	insert SQL
     *output parameter:	count = -2 >Exception
     *			count = 0  >nothing
     *			count > 1  >right
     *modify time:	11/29/2004
     */
    public int insert(String sql) {
        int count = 0;
        stmt = con.getStmt();
        try {
            count = stmt.executeUpdate(sql);
        } catch (Exception e) {
            count = -2;
            System.err.println(e.getMessage());
            e.printStackTrace();
        } finally {
            con.close();
            return count;
        }
    }

    /**
     *input parameter:	update SQL
     *output parameter:	count = -2 >Exception
     *			count = 0  >nothing
     *			count > 1  >right
     *modify time:	11/29/2004
     */
    public int update(String sql) {
        int count = 0;
        stmt = con.getStmt();
        try {
            count = stmt.executeUpdate(sql);
        } catch (Exception e) {
            count = -2;
            System.err.println(e.getMessage());
            e.printStackTrace();
        } finally {
            con.close();
            return count;
        }
    }

    /**
     *input parameter:	delete SQL
     *output parameter:	count = -2 >Exception
     *			count = 0  >nothing
     *			count > 1  >right
     *modify time:	11/29/2004
     */
    public int delete(String sql) {
        int count = 0;
        stmt = con.getStmt();
        try {
            count = stmt.executeUpdate(sql);
        } catch (Exception e) {
            count = -2;
            System.err.println(e.getMessage());
            e.printStackTrace();
        } finally {
            con.close();
            return count;
        }
    }
}