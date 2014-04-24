package com.toolsBean;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DB {
	private Connection con;
	private PreparedStatement pstm;
	private String user="sa";
	private String password="";
	private String className="com.microsoft.sqlserver.jdbc.SQLServerDriver";
	private String url="jdbc:sqlserver://localhost:1433;DatabaseName=db_mediaBlog";
	
	/** 构造方法，在该方法中加载数据库驱动  */
	public DB(){
		try{
			Class.forName(className);
		}catch(ClassNotFoundException e){
			System.out.println("加载数据库驱动失败！");
			e.printStackTrace();
		}
	}

	/**创建数据库连接*/
	public Connection getCon(){
		if(con==null){
			try {
				con=DriverManager.getConnection(url,user,password);
			} catch (SQLException e) {
				System.out.println("创建数据库连接失败！");
				con=null;
				e.printStackTrace();
			}			
		}
		return con;
	}
	
	/**
	 *@功能：对数据库进行增、删、改、查操作
	 *@参数：sql为SQL语句；params为Object数组，里面存储的是为sql表示的SQL语句中"?"占位符赋值的数据 
	 */
	public void doPstm(String sql,Object[] params){
		if(sql!=null&&!sql.equals("")){
			if(params==null)
				params=new Object[0];			
			getCon();
			if(con!=null){
				try{		
					System.out.println(sql);
					pstm=con.prepareStatement(sql,ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
					for(int i=0;i<params.length;i++){
						pstm.setObject(i+1,params[i]);
					}
					pstm.execute();
				}catch(SQLException e){
					System.out.println("doPstm()方法出错！");
					e.printStackTrace();
				}				
			}			
		}
	}
	
	/**
	 * @功能：获取调用doPstm()方法执行查询操作后返回的ResultSet结果集
	 * @返回值：ResultSet
	 * @throws SQLException
	 */
	public ResultSet getRs() throws SQLException{
		return pstm.getResultSet();		
	}
	/**
	 * @功能：获取调用doPstm()方法执行更新操作后返回影响的记录数
	 * @返回值：int
	 * @throws SQLException
	 */
	public int getCount() throws SQLException{
		return pstm.getUpdateCount();		
	}
	/**
	 * @功能：释放PrepareStatement对象与Connection对象
	 */
	public void closed(){
		try{
			if(pstm!=null)
				pstm.close();			
		}catch(SQLException e){
			System.out.println("关闭pstm对象失败！");
			e.printStackTrace();
		}
		try{
			if(con!=null){
				con.close();
			}
		}catch(SQLException e){
			System.out.println("关闭con对象失败！");
			e.printStackTrace();
		}
	}
}
