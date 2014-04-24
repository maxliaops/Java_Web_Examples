package com.dao;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.toolsBean.CreatePage;
import com.toolsBean.DB;

public class SuperDao {
	private CreatePage page=null;
	private int perR=4;
	/**
	 * @功能：生成分页类。
	 */
	protected void createPage(String sql,Object[] params,String showPage,String goWhich) throws SQLException {
		page=new CreatePage();
		DB mydb=new DB();
		mydb.doPstm(sql,params);
		ResultSet rs=mydb.getRs();		
		if(rs!=null&&rs.next()){
			rs.last();
			page.setPerR(perR);
			page.setAllR(rs.getRow());
			page.setAllP();
			page.setCurrentP(showPage);
			page.setPageInfo();
			page.setPageLink(goWhich);
			rs.close();
		}
		mydb.closed();
	}
	public CreatePage getPage(){
		return page;
	}
	public void setPerR(int perR){
		this.perR=perR;
	}
}
