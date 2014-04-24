package com.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.toolsBean.Change;
import com.toolsBean.DB;
import com.valueBean.LinkSingle;

public class LinkDao {
	public List getDefaultLink(int id) throws SQLException{
		String sql="select top 5 * from tb_link where link_whoId=? order by link_time desc";
		Object[] params={id};
		List linklist=getList(sql,params);
		return linklist;
	}
	public List getListLink(int id) throws SQLException{
		String sql="select * from tb_link where link_whoId=? order by link_time desc";
		Object[] params={id};
		List linklist=getList(sql,params);
		return linklist;
	}
	private List getList(String sql,Object[] params) throws SQLException{
		List list=null;
		DB mydb=new DB();
		mydb.doPstm(sql,params);
		ResultSet rs=mydb.getRs();
		if(rs!=null){
			list=new ArrayList();
			while(rs.next()){
				LinkSingle single=new LinkSingle();
				single.setId(rs.getInt(1));
				single.setLinkWhoId(rs.getInt(2));
				single.setLinkTitle(rs.getString(3));
				single.setLinkSrc(rs.getString(4));
				single.setLinkTime(Change.dateTimeChange(rs.getTimestamp(5)));
				list.add(single);
			}
		}
		return list;
	}
	public int insert(Object[] params) throws SQLException{
		String sql="insert into tb_link values(?,?,?,?)";
		DB mydb=new DB();
		mydb.doPstm(sql, params);
		int i=mydb.getCount();
		return i;
	}
	public int delete(int id) throws SQLException{
		String sql="delete from tb_link where id=?";
		DB mydb=new DB();
		mydb.doPstm(sql,new Object[]{id});
		int i=mydb.getCount();
		return i;
	}
}
