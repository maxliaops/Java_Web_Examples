package electric.electricUtils;
import java.sql.*;
import java.io.*;
import java.util.*;

public class DbConnectionManager {

  private Connection con; 													//声明一个Connection对象
  public static Connection getConnection() {
	  Connection con = null;
 	String user="sa";														//登录数据库用户名
	  String password="";													//登录数据库密码
	 	try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver").newInstance();	//加载数据库驱动
		} catch (Exception e) {System.out.println(e.getMessage());} 
	 	try{ 
		 String uri="jdbc:sqlserver://127.0.0.1:1433;DatabaseName=YWW";			//数据库URL
		 con=DriverManager.getConnection(uri,user,password); 					//建立连接
	 	}catch(SQLException e){System.out.println(e.getMessage());} 
		 return con;
	}
	public void setCon(Connection con) {
		this.con = con;   
	}     
 }

