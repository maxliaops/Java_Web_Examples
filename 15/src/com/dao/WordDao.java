package com.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.toolsBean.Change;
import com.toolsBean.DB;
import com.valueBean.WordSingle;

public class WordDao extends SuperDao{
	public List getNewWord(int id) throws SQLException{
		String sql="select top 10 * from tb_word where word_whoId=? order by word_time desc";
		Object[] params={id};
		List wordlist=getList(sql,params);
		return wordlist;		
	}
	public List getMoreWord(int id,String showPage,String goWhich) throws SQLException{
		String sqlall="select * from tb_word where word_whoId=? order by word_time desc";
		Object[] params={id};
		
		setPerR(10);
		createPage(sqlall,params,showPage,goWhich);

		int currentP=getPage().getCurrentP();
		int top1=getPage().getPerR();
		int top2=(currentP-1)*top1;
		String sql="";
		if(currentP<=1)
			sql="SELECT TOP "+top1+" * FROM tb_word WHERE word_whoId=? ORDER BY word_time DESC";
		else
			sql="SELECT TOP "+top1+" * FROM tb_word i WHERE (word_whoId=?) AND (word_time < (SELECT MIN(word_time) FROM (SELECT TOP "+top2+" * FROM tb_word WHERE word_whoId = i.word_whoId ORDER BY word_time DESC) AS minv)) ORDER BY word_time DESC";
		
		List wordlist=getList(sql,params);
		return wordlist;		
	}
	private List getList(String sql,Object[] params) throws SQLException{
		List list=null;
		DB mydb=new DB();
		mydb.doPstm(sql,params);
		ResultSet rs=mydb.getRs();
		if(rs!=null){
			list=new ArrayList();
			while(rs.next()){
				WordSingle single=new WordSingle();
				single.setId(rs.getInt(1));
				single.setWordWhoId(rs.getInt(2));
				single.setWordContent(rs.getString(3));
				single.setWordAuthor(rs.getString(4));
				single.setWordTime(Change.dateTimeChange(rs.getTimestamp(5)));
				list.add(single);
			}
			rs.close();
		}
		mydb.closed();
		return list;
	}
	public int insert(Object[] params) throws SQLException{
		String sql="insert into tb_word values(?,?,?,?)";
		DB mydb=new DB();
		mydb.doPstm(sql, params);
		return mydb.getCount();
	}
}
