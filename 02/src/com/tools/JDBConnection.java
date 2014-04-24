package com.tools;

import java.sql.*;

public class JDBConnection {
	private final static String url = "jdbc:mysql://localhost:3306/db_wlgl?user=root&password=111&useUnicode=true&characterEncoding=gb2312";
	private final static String dbDriver = "com.mysql.jdbc.Driver";
	private Connection con = null;
	// 通过构造方法加载数据库驱动
	static {
		try {
			Class.forName(dbDriver).newInstance();
		} catch (Exception ex) {
			System.out.println("数据库加载失败");
		}
	}

	// 创建数据库连接
	public boolean creatConnection() {
		try {
			con = DriverManager.getConnection(url);
			con.setAutoCommit(true);

		} catch (SQLException e) {
			System.out.println(e.getMessage());
			System.out.println("creatConnectionError!");
		}
		return true;
	}

	// 对数据库的增加、修改和删除的操作
	public boolean executeUpdate(String sql) {
		if (con == null) {
			creatConnection();
		}
		try {
			Statement stmt = con.createStatement();
			int iCount = stmt.executeUpdate(sql);
			System.out.println("操作成功，所影响的记录数为" + String.valueOf(iCount));
			return true;
		} catch (SQLException e) {
			System.out.println(e.getMessage());
			return false;
		}
	}

	// 对数据库的查询操作
	public ResultSet executeQuery(String sql) {
		ResultSet rs;
		try {
			if (con == null) {
				creatConnection();
			}
			Statement stmt = con.createStatement();
			try {
				rs = stmt.executeQuery(sql);
			} catch (SQLException e) {
				System.out.println(e.getMessage());
				return null;
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
			System.out.println("executeQueryError!");
			return null;
		}
		return rs;
	}

}
