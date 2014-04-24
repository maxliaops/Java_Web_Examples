package com.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.toolsBean.Change;
import com.toolsBean.DB;
import com.valueBean.UserSingle;

public class FriendDao extends SuperDao{
	/**
	 * @功能：获取在"个人主页"侧栏中显示的我的好友
	 */	
	public List getDefaultFriend(int id) throws SQLException{
		String sql="select top 5 u.* from tb_friend f inner join tb_user u on f.user_id=u.id where f.friend_whoId=? order by f.id";
		Object[] params={id};
		List friendlist=getList(sql,params);
		return friendlist;
	}
	/**
	 * @功能：获取我的所有好友
	 */
	public List getListFriend(int id) throws SQLException{
		String sql="select u.* from tb_friend f inner join tb_user u on f.user_id=u.id where f.friend_whoId=? order by f.id";
		Object[] params={id};
		List friendlist=getList(sql,params);
		return friendlist;
	}
	/**
	 * @功能：获取我的某一个好友
	 */
	public boolean getSingleFriend(Object[] params) throws SQLException{
		String sql="select * from tb_friend where friend_whoId=? and user_id=?";
		DB mydb=new DB();
		mydb.doPstm(sql, params);
		ResultSet rs=mydb.getRs();
		if(rs!=null&&rs.next())
			return true;
		else return false;
	}
	/**
	 * @功能：获取好友详细内容
	 */	
	public UserSingle getFriendInfo(int id) throws SQLException{
		String sql="select * from tb_user where id=?";
		Object[] params={id};
		
		List list=getList(sql,params);
		if(list!=null&&list.size()!=0)
			return (UserSingle)list.get(0);
		else
			return null;
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
	public void insert(Object[] params) throws SQLException{
		String sql="insert into tb_friend values(?,?);";
		DB mydb=new DB();
		mydb.doPstm(sql, params);
	}
	public int delete(Object[] params) throws SQLException{
		String sql="delete from tb_friend where friend_whoId=? and user_id=?";
		DB mydb=new DB();
		mydb.doPstm(sql,params);
		int i=mydb.getCount();
		return i;
	}
}
