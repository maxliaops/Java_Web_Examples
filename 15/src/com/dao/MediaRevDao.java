package com.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.toolsBean.Change;
import com.toolsBean.DB;
import com.valueBean.MediaRevSingle;
public class MediaRevDao extends SuperDao{	
	public List getNewReviewList(int id) throws SQLException{
		int top=5;
		Object[] params={id};
		String sql="SELECT TOP "+top+" * FROM tb_mediaR WHERE mediaR_rootId=? ORDER BY mediaR_time DESC";
		List mediaRlist=getList(sql,params);
		return mediaRlist;
	}
	
	public List getMoreReviewList(int id,String showPage,String goWhich) throws SQLException{
		String sqlall="select * from tb_mediaR where mediaR_rootId=?";
		Object[] params={id};
		
		setPerR(5);
		createPage(sqlall,params,showPage,goWhich);

		int currentP=getPage().getCurrentP();
		int top1=getPage().getPerR();
		int top2=(currentP-1)*top1;
		String sql="";
		if(currentP<=1)
			sql="SELECT TOP "+top1+" * FROM tb_mediaR WHERE mediaR_rootId=? ORDER BY mediaR_time";
		else
			sql="SELECT TOP "+top1+" * FROM tb_mediaR i WHERE (mediaR_rootId = ?) AND (mediaR_time > (SELECT MAX(mediaR_time) FROM (SELECT TOP "+top2+" * FROM tb_mediaR WHERE mediaR_rootId = i.mediaR_rootId ORDER BY mediaR_time) AS maxv)) ORDER BY mediaR_time";
		
		List mediaRlist=getList(sql,params);
		return mediaRlist;
	}
	private List getList(String sql,Object[] params) throws SQLException{
		List list=null;
		DB mydb=new DB();
		mydb.doPstm(sql, params);
		ResultSet rs=mydb.getRs();
		if(rs!=null){
			list=new ArrayList();
			while(rs.next()){
				MediaRevSingle single=new MediaRevSingle();
				single.setId(rs.getInt(1));
				single.setMediaRRootId(rs.getInt(2));
				single.setMediaRAuthor(rs.getString(3));
				single.setMediaRContent(rs.getString(4));
				single.setMediaRTime(Change.dateTimeChange(rs.getTimestamp(5)));
				list.add(single);
			}
			rs.close();
		}
		mydb.closed();
		return list;
	}
	public void insert(Object[] params) throws SQLException{
		String sql="insert into tb_mediaR values(?,?,?,?)";
		DB mydb=new DB();
		mydb.doPstm(sql, params);
	}
	public int delete(int id) throws SQLException{
		String sql="delete from tb_mediaR where id=?";
		DB mydb=new DB();
		mydb.doPstm(sql, new Object[]{id});
		int i=mydb.getCount();
		return i;		
	}
}
