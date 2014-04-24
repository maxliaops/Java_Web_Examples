package com.dao;

import com.model.Goods;
import com.tools.ChStr;
import com.tools.ConnDB;

public class GoodsDaoImpl implements GoodsDao {
	ConnDB conn = new ConnDB();
	ChStr chStr = new ChStr();

	public int insert(Goods g) {
		int ret = -1;
		try {
			String sql = "Insert into tb_goods (TypeID,GoodsName,Introduce,Price,nowPrice,picture,newgoods,sale) values("
					+ g.getTypeID()
					+ ",'"
					+ chStr.chStr(g.getGoodsName())
					+ "','"
					+ chStr.chStr(g.getIntroduce())
					+ "',"
					+ g.getPrice()
					+ ","
					+ g.getPrice()
					+ ",'"
					+ chStr.chStr(g.getPicture())
					+ "',"
					+ g.getNewGoods()
					+ "," + g.getSale() + ")";

			ret = conn.executeUpdate(sql);
		} catch (Exception e) {
			ret = 0;
		}
		conn.close();
		return ret;
	}

	public int update(Goods g) {
		int ret = -1;
		try {
			String sql = "update tb_Goods set TypeID=" + g.getTypeID()
					+ ",GoodsName='" + chStr.chStr(g.getGoodsName())
					+ "',introduce='" + chStr.chStr(g.getIntroduce())
					+ "',price=" + g.getPrice() + ",nowprice="
					+ g.getNowPrice() + ",picture='"
					+ chStr.chStr(g.getPicture()) + "',newgoods="
					+ g.getNewGoods() + ",sale=" + g.getSale() + " where ID="
					+ g.getID();
			ret = conn.executeUpdate(sql);
		} catch (Exception e) {
			ret = 0;
		}
		conn.close();
		return ret;
	}

	public int delete(Goods g) {
		int ret = -1;
		try {
			String sql = "Delete from tb_goods where ID=" + g.getID();
			ret = conn.executeUpdate(sql);
		} catch (Exception e) {
			ret = 0;
		}
		conn.close();
		return ret;

	}

}
