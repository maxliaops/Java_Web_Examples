package com.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.form.GoodsForm;
import com.form.LogForm;
import com.tools.JDBConnection;

public class GoodsAndLogDao {
	private GoodsForm goodsForm = null;
	private LogForm logForm = null;
	private JDBConnection connection = null;

	public GoodsAndLogDao() {	
		connection = new JDBConnection();
	}

	public boolean operationGoodsAndLog(String sql) {
		return connection.executeUpdate(sql);
	}

	public LogForm queryCarLogForm(Integer car_id) {
		String sql = "select * from tb_carlog where car_id=" + car_id + "";
		ResultSet rs = connection.executeQuery(sql);
		 logForm = null;
		try {
			while (rs.next()) {	
				logForm = new LogForm();
				logForm.setId(rs.getInt(1));
				logForm.setGoods_id(rs.getString(2));
				logForm.setCar_id(rs.getString(3));
				logForm.setStartTime(rs.getString(4));
				logForm.setEndTime(rs.getString(5));
				logForm.setDescribe(rs.getString(6));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return logForm;
	}
	public static void main(String[] args) {
		GoodsAndLogDao dao = new GoodsAndLogDao();
		LogForm form = dao.queryCarLogForm(4);
		System.out.println(form.getId());
	}
	public GoodsForm queryGoodsForm(String goods_id) {
		String sql = "select * from tb_operationgoods where goods_id='" + goods_id + "'";
		ResultSet rs = connection.executeQuery(sql);
		try {
			while (rs.next()) {
				goodsForm = new GoodsForm();
				goodsForm.setId(rs.getInt(1));
				goodsForm.setCar_id(rs.getString(2));
				goodsForm.setCustomer_id(rs.getString(3));
				goodsForm.setGoods_id(rs.getString(4));
				goodsForm.setGoods_name(rs.getString(5));
				goodsForm.setGoods_tel(rs.getString(6));
				goodsForm.setGoods_address(rs.getString(7));
				goodsForm.setGoods_sure(rs.getString(8));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return goodsForm;
	}
	
	
	
	public List queryGoodsList() {
		List list=new ArrayList();
		String sql = "select * from tb_operationgoods order by id desc";
		ResultSet rs = connection.executeQuery(sql);
		try {
			while (rs.next()) {
				goodsForm = new GoodsForm();
				goodsForm.setId(rs.getInt(1));
				goodsForm.setCar_id(rs.getString(2));
				goodsForm.setCustomer_id(rs.getString(3));
				goodsForm.setGoods_id(rs.getString(4));
				goodsForm.setGoods_name(rs.getString(5));
				goodsForm.setGoods_tel(rs.getString(6));
				goodsForm.setGoods_address(rs.getString(7));
				goodsForm.setGoods_sure(rs.getString(8));
				list.add(goodsForm);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	
	
	
	
	
	
	

}
