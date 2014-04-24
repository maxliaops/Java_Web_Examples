package com.wy.tools;

import java.sql.*;

public class JDBConnection {
	private final String dbDriver = "com.microsoft.sqlserver.jdbc.SQLServerDriver"; // 设置SQL
	// Server2005数据库驱动名称
	private final String url = "jdbc:sqlserver://127.0.0.1:1433;DatabaseName=db_photo"; // 设置连接SQL
	// Servlet2005的utl地址
	private final String userName = "sa"; // 设置登录数据库的用户
	private final String password = "111"; // 设置登录用户的密码
	private Connection con = null; // 设置连接对象，并赋值为null
	// 通过构造方法加载数据库驱动
	public JDBConnection() {
		try {
			Class.forName(dbDriver).newInstance(); // 通过Java反射机制进行加载数据库驱动操作
		} catch (Exception ex) {
			System.out.println("数据库加载失败");
		}
	}
	// 创建数据库连接
	public boolean creatConnection() {
		try {
			con = DriverManager.getConnection(url, userName, password); // 根据用户名，url地址以及密码进行数据连接操作
			con.setAutoCommit(true); // 设置系统的自动连接操作
			return true;
		} catch (SQLException e) {
			System.out.println(e.getMessage());
			System.out.println("creatConnectionError!");
			return false;
		}
	}
	// 对数据库的增加、修改和删除的操作
	public boolean executeUpdate(String sql) {
		if (con == null) { // 当con对象为空，进行creatConnection()方法，实现数据库连接操作
			creatConnection();
		}
		try {
			Statement stmt = con.createStatement();
			int iCount = stmt.executeUpdate(sql); // 执行参数SQL语句
			System.out.println("操作成功，所影响的记录数为" + String.valueOf(iCount)); // 在控制台中显示执行的结果
			return true; // 如果SQL语句执行成功，返回true
		} catch (SQLException e) {
			System.out.println(e.getMessage());
			return false; // 如果SQL语句执行失败，返回false
		}
	}
	// 对数据库的查询操作
	public ResultSet executeQuery(String sql) {
		ResultSet rs; // 设置ResultSet结果集对象rs
		try {
			if (con == null) { // 当con对象为null，取得数据库连接操作
				creatConnection();
			}
			Statement stmt = con.createStatement(
					ResultSet.TYPE_SCROLL_INSENSITIVE,
					ResultSet.CONCUR_READ_ONLY);
			try {
				rs = stmt.executeQuery(sql); // 执行参数中的SQL语句
			} catch (SQLException e) {
				System.out.println(e.getMessage());
				return null;
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
			System.out.println("executeQueryError!");
			return null;
		}
		return rs; // 将查询的结果通过return关键字进行返回
	}
	// 关闭数据库的操作
	public void closeConnection() {
		if (con != null) {
			try {
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
				System.out.println("Failed to close connection!");
			} finally {
				con = null;
			}
		}
	}

}
