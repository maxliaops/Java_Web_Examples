package com.webtier;

import java.util.List;

import com.dao.CarDao;
import com.form.CarForm;
import com.tools.MyPagination;

public class CarAction extends CarForm {	
	private  static CarDao carDao = null;
	public CarAction() {
	
		carDao = new CarDao();
	}

	public String queryCarList() {		
		List list = carDao.queryCarList(null);
		request.setAttribute("list", list);
		return SUCCESS;
	}

	public void validateInsertCar() {
		if (null == username || username.equals("")) {
			this.addFieldError("username", "请您输入姓名");
		}
		if (null == user_number || user_number.equals("")) {
			this.addFieldError("user_number", "请您输入身份证号");
		}
		if (null == car_number || car_number.equals("")) {
			this.addFieldError("car_number", "请您输入车牌号");
		}
		if (null == tel || tel.equals("")) {
			this.addFieldError("tel", "请您输入电话");
		}
		if (null == address || address.equals("")) {
			this.addFieldError("address", "请您输入地址");
		}
		if (null == car_road || car_road.equals("")) {
			this.addFieldError("car_road", "请您输入运输路线");
		}
		if (null == car_content || car_content.equals("")) {
			this.addFieldError("car_content", "请您输入车辆描述");
		}
	}

	public String deleteCar() {		
		String sql = "delete from tb_car where id='" + id + "'";
		carDao.operationCar(sql);
		return "operationSuccess";
	}

	public String insertCar() {	
		String sql = "insert into tb_car (username,user_number,car_number,tel,address,car_road,car_content) value('"
				+ username
				+ "','"
				+ user_number
				+ "','"
				+ car_number
				+ "','"
				+ tel
				+ "','"
				+ address
				+ "','"
				+ car_road
				+ "','"
				+ car_content + "')";
		carDao.operationCar(sql);
		return "operationSuccess";
	}

	public String queryCarForm() {	
		CarForm carForm = carDao.queryCarForm(id.toString());
		request.setAttribute("carForm", carForm);
		return SUCCESS;
	}
	
	
	
	
	
	public void validateUpdateCar() {
		if (null == username || username.equals("")) {
			this.addFieldError("username", "请您输入姓名");
		}
		if (null == user_number || user_number.equals("")) {
			this.addFieldError("user_number", "请您输入身份证号");
		}
		if (null == car_number || car_number.equals("")) {
			this.addFieldError("car_number", "请您输入车牌号");
		}
		if (null == tel || tel.equals("")) {
			this.addFieldError("tel", "请您输入电话");
		}
		if (null == address || address.equals("")) {
			this.addFieldError("address", "请您输入地址");
		}
		if (null == car_road || car_road.equals("")) {
			this.addFieldError("car_road", "请您输入运输路线");
		}
		if (null == car_content || car_content.equals("")) {
			this.addFieldError("car_content", "请您输入车辆描述");
		}
	}

	public String updateCar() {	
		String sql = "update tb_car set username='" + username
				+ "',user_number='" + user_number + "',car_number='"
				+ car_number + "',tel='" + tel + "',address='" + address
				+ "',car_road='" + car_road + "',car_content='" + car_content
				+ "' where id='" + id + "'";
		carDao.operationCar(sql);
		return "operationSuccess";
	}

}
