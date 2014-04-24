package com.bwm.db;
import java.sql.*;
public class Condb{
	private static String driverClass="com.microsoft.sqlserver.jdbc.SQLServerDriver";
	private static String url="jdbc:sqlserver://127.0.0.1:1433;DatabaseName=db_Scenince;user=sa;password=";
	private static Connection con=null;//Connection对象
	private static ResultSet rs=null;//建立一个记录集
	public Condb(){
		try{
			Class.forName(driverClass);//用classforname方法加载驱动程序类
			con = DriverManager.getConnection(url);
		}catch(Exception e){
			System.err.println(e);
		}
		
	}public ResultSet executeQuery(String sql){//可以执行添加删等操作
		try{
			Statement stmt=con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
			rs=stmt.executeQuery(sql);
		}catch(SQLException er){
			System.err.println(er.getMessage());
		}
		return rs;
	}public int executeUpdate(String sql){//数据库的更新操作
		int result=0;
		try{ 
			Statement stmt=con.createStatement();
			result=stmt.executeUpdate(sql);
		}catch(SQLException ex){
			System.err.println(ex.getMessage());
		}
		return result;
	}
	public void close(){
		try{
			if(con!=null)
				con.close();
		}catch(Exception e){ 
			System.out.print(e);
		}try{
			if(rs!=null)
				rs.close();
		}catch(Exception e){
			System.out.println(e);
		}
	}
}
