package com.dao;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.form.AdminForm;
import com.tools.JDBConnection;

public class AdminDao {
	public JDBConnection connection = null;

	public AdminDao() {
		connection = new JDBConnection();
	}

	// 根据用户名查看密码信息
	public String getAdminPassword(String admin_user) {
		String admin_password = "";
		String sql = "select * from tb_admin where admin_user='" + admin_user
				+ "'";
		ResultSet rs = connection.executeQuery(sql);
		try {
			while (rs.next()) {
				admin_password = rs.getString("admin_password");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return admin_password;
	}

	// 修改管理员密码操作
	public boolean operationAdmin(String sql) {		
		return connection.executeUpdate(sql);
	}

}
