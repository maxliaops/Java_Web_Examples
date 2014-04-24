package com.mingri.dbconn;

import java.sql.*;

import javax.naming.*;
import javax.sql.DataSource;

public class DBResult {
	public static Connection conn = null;
	private static String driverClass = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
	private static String URL = "jdbc:sqlserver://localhost:1433;DatabaseName=db_shopping";
	private static String user="sa";
	private static String pwd = "";
	static{
		try {
			Class.forName(driverClass);
			conn = DriverManager.getConnection(URL, user, pwd);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	/**
	 * 用于获得执行SQL语句的ResultSet对象
	 */
	public ResultSet getResult(String sql) {
		try {
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			return rs;
		} catch (Exception e) {
		}
		return null;
	}

	/**
	 * 用于执行SQL语句没有返回值
	 */
	public void doExecute(String sql) {
		try {
			Statement stmt = conn.createStatement();
			stmt.executeQuery(sql);
		} catch (Exception e) {
		}
	}

	/**
	 * 用于获得执行SQL语句的PreparedStatement(预处理)对象
	 */
	public PreparedStatement getPreparedStatement(String sql) {
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			return pstmt;
		} catch (Exception e) {
		}
		return null;
	}

}
