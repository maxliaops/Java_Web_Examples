package com.webtier;

import java.util.List;

import com.dao.CarDao;
import com.dao.GoodsAndLogDao;
import com.form.GoodsForm;
import com.tools.MyPagination;

public class GoodsAction extends GoodsForm {
	private static  GoodsAndLogDao goodsAndLogDao = null;
	private static CarDao carDao = null;

	static {
		goodsAndLogDao = new GoodsAndLogDao();
		carDao=new CarDao();		
	}	
	public String queryGoodsId(){
		GoodsForm goodsForm = goodsAndLogDao.queryGoodsForm(request.getParameter("goods_id"));
		request.setAttribute("goodsForm", goodsForm);
		return SUCCESS;
	}	
	public String queryCar(){
		List list = carDao.queryCarList(null);		
		request.setAttribute("list", list);
		return SUCCESS;
	}
	public String insertGoods() {
		String sql1 = "insert into tb_operationgoods (car_id,customer_id,goods_id,goods_name,goods_tel,goods_address,goods_sure) value ("
				+ this.car_id
				+ ","
				+ this.customer_id
				+ ",'"
				+ this.goods_id
				+ "','"
				+ this.goods_name
				+ "','"
				+ this.goods_tel + "','" + this.goods_address + "',1)";
		String startTime = request.getParameter("startTime");
		String endTime = request.getParameter("endTime");
		String describer = request.getParameter("describer");
		String sql2 = "insert into tb_carlog (goods_id,car_id,startTime,endTime,describer) value ('"
				+ goods_id
				+ "','"
				+ car_id
				+ "','"
				+ startTime
				+ "','" + endTime + "','" + describer + "')";	
		this.goodsAndLogDao.operationGoodsAndLog(sql1);
		this.goodsAndLogDao.operationGoodsAndLog(sql2);
		request.setAttribute("goodsSuccess", "<br><br>您添加订货单成功");
		return SUCCESS;
	}	
	public String changeOperation(){
		String goods_id=request.getParameter("goods_id");
		String sql1="update tb_operationgoods set goods_sure=0 where goods_id='"+goods_id+"'";
		String sql2="delete from tb_carlog where goods_id='"+goods_id+"'";
		this.goodsAndLogDao.operationGoodsAndLog(sql1);
		this.goodsAndLogDao.operationGoodsAndLog(sql2);
		request.setAttribute("goods_id", goods_id);
		return SUCCESS;
	}
	
	
	public String queryGoodsList(){
		List list = goodsAndLogDao.queryGoodsList();
		request.setAttribute("list", list);
		return SUCCESS;
	}
	
	
	public String deleteGoods(){
		String id=request.getParameter("id");
		String sql="delete from tb_operationgoods where id='"+id+"'";
		this.goodsAndLogDao.operationGoodsAndLog(sql);
		return "deleteSuccess";
	}
	
	

}
