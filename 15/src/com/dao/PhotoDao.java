package com.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.toolsBean.Change;
import com.toolsBean.DB;
import com.valueBean.PhotoSingle;

public class PhotoDao extends SuperDao {
	/**
	 * @功能：获取在个人主页显示的最新上传的前4张图片
	 */
	public List getDefaultPhoto(int id) throws SQLException{
		String sql="select top 4 * from tb_photo where photo_whoId=? order by photo_uptime desc";
		Object[] params={id};		
		List list=getList(sql,params);
		List photolist=defaultDivide(list);
		return photolist;
	}
	/**
	 * @功能：获取在进入＂我的相册＂后，在当前页显示的所有图片
	 */
	public List getListPhoto(int id,String showPage,String goWhich) throws SQLException{
		List photolist=null;
		String sqlall="select * from tb_photo where photo_whoId=?";
		Object[] params={id};
		
		setPerR(12);
		createPage(sqlall,params,showPage,goWhich);

		int currentP=getPage().getCurrentP();
		int top1=getPage().getPerR();
		int top2=(currentP-1)*top1;
		String sql="";
		if(currentP<=1)
			sql="SELECT TOP "+top1+" * FROM tb_photo WHERE photo_whoId=? ORDER BY photo_uptime DESC";
		else
			sql="SELECT TOP "+top1+" * FROM tb_photo i WHERE (photo_whoId = ?) AND (photo_uptime < (SELECT MIN(photo_uptime) FROM (SELECT TOP "+top2+" * FROM tb_photo WHERE photo_whoId = i.photo_whoId ORDER BY photo_uptime DESC) AS minv)) ORDER BY photo_uptime DESC";
		List list=getList(sql,params);		
		photolist=divide(list);
		return photolist;			
	}
	/**
	 * @功能：获取图片详细信息
	 */	
	public PhotoSingle getSinglePhoto(int id) throws SQLException{
		String sql="select * from tb_photo where id=?";
		Object[] params={id};
		
		List list=getList(sql,params);
		if(list!=null)
			return (PhotoSingle)list.get(0);
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
				PhotoSingle single=new PhotoSingle();
				single.setId(rs.getInt(1));
				single.setPhotoWhoId(rs.getInt(2));
				single.setPhotoSrc(rs.getString(3));
				single.setPhotoInfo(rs.getString(4));
				single.setPhotoUptime(Change.dateTimeChange(rs.getTimestamp(5)));
				list.add(single);
			}
		}
		return list;
	}
	/**
	 *@功能：将list中存储的12个元素(PhotoSingle对象)按照顺序平均分成3份，并将每一份中的元素存储到一个新建的List集合(temp)中，最后将temp存储到photolist中。<br>
	 * 		这样，photolist中就存储了３个元素，每个元素为一个List集合，每个集合中存储了４个PhotoSingle对象。转换为photolist这样一个集合，方便在JSP页面中通过两个forEach循环遍历标签按照3行4列的格式输出图片
	 */
	private List divide(List list){
		List photolist=null;
		if(list!=null){
			photolist=new ArrayList();
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
				photolist.add(temp);			//存储temp到photolist中
			}			
		}
		return photolist;
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
	 * @功能：删除图片
	 * @throws SQLException
	 */
	public int delete(int id) throws SQLException{
		String sql="delete from tb_photo where id=?";
		Object[] params={id};
		DB mydb=new DB();
		mydb.doPstm(sql, params);
		int i=mydb.getCount();
		return i;
	}
	/**
	 * @功能：上传图片
	 * @throws SQLException
	 */
	public int upLoad(Object[] params) throws SQLException{
		String sql="insert into tb_photo values(?,?,?,?)";
		DB mydb=new DB();
		mydb.doPstm(sql, params);
		int i=mydb.getCount();
		return i;
	}
}
