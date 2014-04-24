package com.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;

import com.form.CarForm;
import com.tools.JDBConnection;

public class CarDao {

	private JDBConnection connection = null;

	public CarDao() {
		connection = new JDBConnection();
	}

	public boolean operationCar(String sql) {
		return connection.executeUpdate(sql);
	}

	

	public List queryCarList(String sign) {
		List list = new ArrayList();
		CarForm carForm = null;
		String sql=null;
		if(sign==null){		
		sql = "select * from tb_car order by id desc";
		}else{
		
		sql = "select * from tb_car where id not in (select car_id from tb_carlog)";
		
		}
	
		ResultSet rs = connection.executeQuery(sql);
		try {
			while (rs.next()) {
				carForm = new CarForm();
				carForm.setId(rs.getInt(1));
				carForm.setUsername(rs.getString(2));
				carForm.setUser_number(rs.getString(3));
				carForm.setCar_number(rs.getString(4));
				carForm.setTel(rs.getInt(5));
				carForm.setAddress(rs.getString(6));
				carForm.setCar_road(rs.getString(7));
				carForm.setCar_content(rs.getString(8));

				list.add(carForm);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	public CarForm queryCarForm(String id) {
		CarForm carForm = null;
		String sql = "select * from tb_car where id=" + id + "";
		ResultSet rs = connection.executeQuery(sql);
		try {
			while (rs.next()) {
				carForm = new CarForm();
				carForm.setId(rs.getInt(1));
				carForm.setUsername(rs.getString(2));
				carForm.setUser_number(rs.getString(3));
				carForm.setCar_number(rs.getString(4));
				carForm.setTel(rs.getInt(5));
				carForm.setAddress(rs.getString(6));
				carForm.setCar_road(rs.getString(7));
				carForm.setCar_content(rs.getString(8));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return carForm;
	}

}
