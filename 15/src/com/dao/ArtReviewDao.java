package com.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.toolsBean.Change;
import com.toolsBean.DB;
import com.valueBean.ArtReviewSingle;
public class ArtReviewDao extends SuperDao{	
	public List getNewReviewList(int id) throws SQLException{
		int top=5;
		Object[] params={id};
		String sql="SELECT TOP "+top+" * FROM tb_articleR WHERE artReview_rootId=? ORDER BY artReview_time DESC";
		List artrlist=getList(sql,params);

		return artrlist;
	}
	
	public List getMoreReviewList(int id,String showPage,String goWhich) throws SQLException{
		String sqlall="select * from tb_articleR where artReview_rootId=?";
		Object[] params={id};
		
		setPerR(5);
		createPage(sqlall,params,showPage,goWhich);

		int currentP=getPage().getCurrentP();
		int top1=getPage().getPerR();
		int top2=(currentP-1)*top1;
		String sql="";
		if(currentP<=1)
			sql="SELECT TOP "+top1+" * FROM tb_articleR WHERE artReview_rootId=? ORDER BY artReview_time";
		else
			sql="SELECT TOP "+top1+" * FROM tb_articleR i WHERE (artReview_rootId = ?) AND (artReview_time > (SELECT MAX(artReview_time) FROM (SELECT TOP "+top2+" * FROM tb_articleR WHERE artReview_rootId = i.artReview_rootId ORDER BY artReview_time) AS maxv)) ORDER BY artReview_time";
		
		List artrlist=getList(sql,params);
		return artrlist;
	}
	private List getList(String sql,Object[] params) throws SQLException{
		List list=null;
		DB mydb=new DB();
		mydb.doPstm(sql, params);
		ResultSet rs=mydb.getRs();
		if(rs!=null){
			list=new ArrayList();
			while(rs.next()){
				ArtReviewSingle single=new ArtReviewSingle();
				single.setId(rs.getInt(1));
				single.setArtRRootId(rs.getInt(2));
				single.setArtRAuthor(rs.getString(3));
				single.setArtRContent(rs.getString(4));
				single.setArtRTime(Change.dateTimeChange(rs.getTimestamp(5)));
				list.add(single);
			}
		}
		return list;
	}
	public void insert(Object[] params) throws SQLException{
		String sql="insert into tb_articleR values(?,?,?,?)";
		DB mydb=new DB();
		mydb.doPstm(sql, params);
	}
	public int delete(int id) throws SQLException{
		String sql="delete from tb_articleR where id=?";
		DB mydb=new DB();
		mydb.doPstm(sql, new Object[]{id});
		int i=mydb.getCount();
		return i;		
	}
}
