package com.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.toolsBean.Change;
import com.toolsBean.DB;
import com.valueBean.ElectSingle;

public class ElectDao {
	public List getDefaultElect(int id) throws SQLException{
		String sql="select top 5 * from tb_elect where elect_whoId=? order by elect_time desc";
		Object[] params={id};
		List electlist=getList(sql,params);
		return electlist;
	}
	public List getListElect(int id) throws SQLException{
		String sql="select * from tb_elect where elect_whoId=? order by elect_time desc";
		Object[] params={id};
		List electlist=getList(sql,params);
		return electlist;
	}
	private List getList(String sql,Object[] params) throws SQLException{
		List list=null;
		DB mydb=new DB();
		mydb.doPstm(sql,params);
		ResultSet rs=mydb.getRs();
		if(rs!=null){
			list=new ArrayList();
			while(rs.next()){
				ElectSingle single=new ElectSingle();
				single.setId(rs.getInt(1));
				single.setElectWhoId(rs.getInt(2));
				single.setElectTitle(rs.getString(3));
				single.setElectSrc(rs.getString(4));
				single.setElectTime(Change.dateTimeChange(rs.getTimestamp(5)));
				list.add(single);
			}
		}
		return list;
	}
	public int insert(Object[] params) throws SQLException{
		String sql="insert into tb_elect values(?,?,?,?)";
		DB mydb=new DB();
		mydb.doPstm(sql, params);
		int i=mydb.getCount();
		return i;
	}
	public int delete(int id) throws SQLException{
		String sql="delete from tb_elect where id=?";
		DB mydb=new DB();
		mydb.doPstm(sql,new Object[]{id});
		int i=mydb.getCount();
		return i;
	}
}
