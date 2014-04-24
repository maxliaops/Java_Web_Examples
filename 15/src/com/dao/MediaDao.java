package com.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.toolsBean.Change;
import com.toolsBean.DB;
import com.valueBean.MediaSingle;

public class MediaDao extends SuperDao{
	public List getDefaultMedia(int id) throws SQLException{
		String sql="select top 4 * from tb_media where media_whoId=? order by media_uptime desc";
		Object[] params={id};
		List list=getList(sql,params);
		List medialist=defaultDivide(list);
		return medialist;
	}
	/**
	 * @功能：获取在当前页显示的所有影音
	 */
	public List getListMedia(int id,String showPage,String goWhich) throws SQLException{
		List medialist=null;
		String sqlall="select * from tb_media where media_whoId=?";
		Object[] params={id};
		
		setPerR(12);
		createPage(sqlall,params,showPage,goWhich);

		int currentP=getPage().getCurrentP();
		int top1=getPage().getPerR();
		int top2=(currentP-1)*top1;
		String sql="";
		if(currentP==1)
			sql="SELECT TOP "+top1+" * FROM tb_media WHERE media_whoId=? ORDER BY media_uptime DESC";
		else
			sql="SELECT TOP "+top1+" * FROM tb_media i WHERE (media_whoId = ?) AND (media_uptime < (SELECT MIN(media_uptime) FROM (SELECT TOP "+top2+" * FROM tb_media WHERE media_whoId = i.media_whoId ORDER BY media_uptime DESC) AS minv)) ORDER BY media_uptime DESC";
		
		List list=getList(sql,params);		
		medialist=divide(list);
		return medialist;			
	}
	/**
	 * @功能：获取视频详细信息
	 */	
	public MediaSingle getSingleMedia(int id) throws SQLException{
		String sql="select * from tb_media where id=?";
		Object[] params={id};
		
		List list=getList(sql,params);
		if(list!=null&&list.size()!=0)
			return (MediaSingle)list.get(0);
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
				MediaSingle single=new MediaSingle();
				single.setId(rs.getInt(1));
				single.setMediaWhoId(rs.getInt(2));
				single.setMediaTitle(rs.getString(3));
				single.setMediaSrc(rs.getString(4));
				single.setMediaPic(rs.getString(5));
				single.setMediaInfo(rs.getString(6));
				single.setMediaUptime(Change.dateTimeChange(rs.getTimestamp(7)));
				single.setLookCount(rs.getInt(8));
				single.setReviCount(getRevCount(single.getId()));
				list.add(single);
			}
			rs.close();
		}
		mydb.closed();
		return list;
	}
	/**
	 * @功能：获取视频评论数
	 */
	private int getRevCount(int id){
		int count=0;
		String sql="select count(id) from tb_mediaR where mediaR_rootId=?";
		Object[] params={id};
		
		DB mydb=new DB();
		mydb.doPstm(sql, params);
		try {
			ResultSet rs = mydb.getRs();
			if(rs!=null&&rs.next())
				count=rs.getInt(1);
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		mydb.closed();
		return count;
	}
	/**
	 * @功能：累加视频观看次数
	 */
	public void setLookCount(int id) throws SQLException{
		String sql="update tb_media set media_lookCount=media_lookCount+1 where id=?";
		Object[] params={id};
		DB mydb=new DB();
		mydb.doPstm(sql, params);
		mydb.closed();
	}
	/**
	 *@功能：将list中存储的12个元素(MediaSingle对象)按照顺序平均分成3份，并将每一份中的元素存储到一个新建的List集合(temp)中，最后将temp存储到medialist中。<br>
	 * 		 这样，medialist中就存储了３个元素，每个元素为一个List集合，每个集合中存储了４个MediaSingle对象。转换为medialist这样一个集合，方便在JSP页面中通过两个forEach循环遍历标签按照3行4列的格式输出视频
	 */
	private List divide(List list){
		List medialist=null;
		if(list!=null){
			medialist=new ArrayList();
			/* ①首先补齐长度 */
			int blank=12-list.size();			//因为每页显示12条记录，所以list的长度只能等于12或小于12
			if(blank>0){						//若list的长度小于12，则向list中存放blank个null值，将list长度补齐到12
				for(int i=0;i<blank;i++)
					list.add(null);
			}			
			/* ②然后进行划分 */
			for(int i=0;i<3;i++){				//平均分成3份
				List temp=new ArrayList();
				for(int j=0;j<4;j++){			//将每份中的元素存储到temp中
					temp.add(list.get(4*i+j));
				}
				medialist.add(temp);			//存储temp到medialist中
			}			
		}
		return medialist;
	}
	private List defaultDivide(List list){
		if(list!=null){
			int blank=4-list.size();			//因为要求只显示4条记录，所以list的长度只能等于4或小于4
			if(blank>0){						//若list的长度小于4，则向list中存放blank个null值，将list长度补齐到4
				for(int i=0;i<blank;i++)
					list.add(null);
			}					
		}
		return list;
	}
	/**
	 * @功能：删除影音
	 * @throws SQLException
	 */
	public int delete(int id) throws SQLException{
		String sql="delete from tb_media where id=?";
		Object[] params={id};
		DB mydb=new DB();
		mydb.doPstm(sql, params);
		int i=mydb.getCount();
		return i;
	}
	/**
	 * @功能：上传视频
	 * @throws SQLException
	 */
	public int upLoad(Object[] params) throws SQLException{
		String sql="insert into tb_media values(?,?,?,?,?,?,?)";
		DB mydb=new DB();
		mydb.doPstm(sql, params);
		int i=mydb.getCount();
		return i;
	}
}
