package com.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.toolsBean.Change;
import com.toolsBean.DB;
import com.valueBean.UserSingle;

public class UserDao {
	public List getTopList() throws SQLException{
		String sql="select top 10 id,user_name,user_hitNum from tb_user order by user_hitNum desc";
		List topList=null;
		
		DB mydb=new DB();
		mydb.doPstm(sql,null);
		ResultSet rs=mydb.getRs();
		if(rs!=null){
			topList=new ArrayList();
			while(rs.next()){
				UserSingle single=new UserSingle();
				single.setId(rs.getInt(1));
				single.setUserName(rs.getString(2));
				single.setUserHitNum(rs.getInt(3));
				topList.add(single);
			}
		}
		return topList;
	}
	public List getMasterList() throws SQLException{
		String sql="select * from tb_user order by user_blogName";		
		List masterlist=getList(sql,null);
		return masterlist;
	}
	public UserSingle getMasterSingle(int id) throws SQLException{
		String sql="select * from tb_user where id=?";
		Object[] params={id};
		
		UserSingle single=(UserSingle)(getList(sql,params).get(0));
		return single;
	}
	public UserSingle getLogoner(Object[] params) throws SQLException{
		UserSingle logoner=null;
		String sql="select * from tb_user where user_name=? and user_pswd=?";
		List list=getList(sql,params);
		if(list!=null&&list.size()!=0)
			logoner=(UserSingle)list.get(0);
		return logoner;		
	}
	public void setHitNum(int userId){
		String sql="update tb_user set user_hitNum=user_hitNum+1 where id=?";
		Object[] params={userId};
		
		DB mydb=new DB();
		mydb.doPstm(sql, params);
		mydb.closed();
	}
	private List getList(String sql,Object[] params) throws SQLException{
		List list=null;
		DB mydb=new DB();
		mydb.doPstm(sql,params);
		
		ResultSet rs=mydb.getRs();
		if(rs!=null){
			list=new ArrayList();
			while(rs.next()){
				UserSingle single=new UserSingle();
				single.setId(rs.getInt(1));
				single.setUserName(rs.getString(2));
				single.setUserPswd(rs.getString(3));
				single.setUserIco(rs.getString(4));
				single.setUserMotto(rs.getString(5));
				single.setUserSex(rs.getString(6));
				single.setUserOicq(rs.getString(7));
				single.setUserEmail(rs.getString(8));
				single.setUserFrom(rs.getString(9));
				single.setUserBlogName(rs.getString(10));
				single.setUserCTTime(Change.dateTimeChange(rs.getTimestamp(11)));
				single.setUserHitNum(rs.getInt(12));
				list.add(single);
			}
			rs.close();
		}
		mydb.closed();
		return list;
	}
	public void insert(UserSingle single) throws SQLException{
		String sql="insert into tb_user values(?,?,?,?,?,?,?,?,?,?,?)";
		Object[] params={single.getUserName(),single.getUserPswd(),single.getUserIco(),single.getUserMotto(),single.getUserSex(),single.getUserOicq(),single.getUserEmail(),single.getUserFrom(),single.getUserBlogName(),single.getUserCTTime(),single.getUserHitNum()};
		
		DB mydb=new DB();
		mydb.doPstm(sql, params);
	}
}
