package com.wy.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import com.wy.form.Photo;
import com.wy.form.UserInfo;
import com.wy.tools.JDBConnection;

public class OperationData {
	private JDBConnection connection = null; //定义数据库连接类JDBConnection对象并赋值为null
	private List list = null;                //定义一个List集合类，并赋值为null
	String sql = "";                         //定义一个SQL类型的对象，并赋值为一个空字符串
	                        //以用户名为条件，查询用户的Form，返回是单个用户的数据
	public UserInfo user_query(String username) {
		UserInfo userInfo = null;         //设置用户的UserInfo类对象
		connection = new JDBConnection(); //将JDBCOnnection对象进行实例化
		sql = "SELECT * FROM tb_userInfo WHERE username='" + username + "'";
		//设置查询的SQL语句
		ResultSet rs = connection.executeQuery(sql); //执行查询操作，返回结果是ResultSet结果集
		try {
			//对结果集对象进行循环数据
			while (rs.next()) {
				userInfo = new UserInfo();                       // 实例化UserInfo对象
				userInfo.setId(rs.getInt("id"));                 // 将数据表中id字段内容进行赋值
				userInfo.setUsername(rs.getString("username"));  // 将数据表中username字段内容进行赋值
				userInfo.setPassword(rs.getString("password"));  // 将数据表中passwrod字段内容进行赋值
				userInfo.setRealname(rs.getString("realname"));  // 将数据表中realname字段内容进行赋值
				userInfo.setEmail(rs.getString("email"));        // 将数据表中email字段内容进行赋值
				userInfo.setQuestion(rs.getString("question"));  // 将数据表中question字段内容进行赋值
				userInfo.setResult(rs.getString("result"));      // 将数据表中result字段内容进行赋值
			}
		} catch (SQLException e) {
			e.printStackTrace();

		} finally {
			connection.closeConnection();                       // 执行关闭数据库链接的操作
		}
		return userInfo;                                        // 返回以用户名为条件进行查询用户的一组数据
	}

	// 实现用户保存操作，该方法以用户信息类的对象为参数
	public boolean user_save(UserInfo userinfo) {
		connection = new JDBConnection(); //将JDBConnection对象进行实例化
		sql = "INSERT INTO tb_userInfo VALUES ('" + userinfo.getUsername()
				+ "','" + userinfo.getPassword() + "','"
				+ userinfo.getRealname() + "','" + userinfo.getEmail() + "','"
				+ userinfo.getQuestion() + "','" + userinfo.getResult() + "')";
		boolean flag = connection.executeUpdate(sql); //执行保存用户的操作，flag对象值显示的内容可以表示执行的结果
		connection.closeConnection();                 //关闭数据库连接操作
		return flag;                                  //将flag对象作为这个方法的返回结果
	}

	// 实现相片数据保存操作，该方法以相片信息类的对象为参数
	public boolean photo_save(Photo photo) {
		connection = new JDBConnection(); // 将JDBConnection对象进行实例化
		sql = "insert into tb_photo values ('" + photo.getPhotoName() + "','"
				+ photo.getPhotoSize() + "','" + photo.getPhotoType() + "','"
				+ photo.getPhotoTime() + "','" + photo.getPhotoAddress()
				+ "','" + photo.getUsername() + "',0,'" + photo.getSmallPhoto()
				+ "')";
		// 设置保存相片数据库的SQL语句
		boolean flag = connection.executeUpdate(sql); // 执行保存相片信息操作的SQL语句
		connection.closeConnection(); // 关闭数据库连接操作
		return flag; // 将flag对象作为这个方法的返回结果
	}

	// 相片的删除操作，该方法以相片的id为条件
	public boolean photo_delete(Integer id) {
		connection = new JDBConnection(); // 实例化JDBConnection类的对象
		sql = "delete from tb_photo where id=" + id + ""; // 设置删除相片的SQL语句
		boolean flag = connection.executeUpdate(sql); // 执行删除的SQL，并将执行结果赋值flag对象
		connection.closeConnection(); // 关闭数据库连接操作
		return flag; // 将SQL语句的执行结果作为这个方法的返回值
	}

	// 查询相册的操作，condition对象为这个方法的参数，主要是设置查询的条件
	public List photo_queryList(String condition) {
		Photo photo = null; // 设置相片信息类的对象
		list = new ArrayList(); // 将List集合对象进行实例化
		sql = "SELECT * FROM tb_photo"; // 设置对相片全部参数查询的操作
		if (condition != null) { // 当condition对象不为空，则根据这个条件来设置SQL语句
			sql = "SELECT * FROM tb_photo WHERE " + condition + "";
		}
		connection = new JDBConnection(); // 实例化JDBCOnneciotn对象
		ResultSet rs = connection.executeQuery(sql); // 执行查询的SQL语句，将查询的结果赋值给ResultSet对象
		try {
			// 循环rs对象
			while (rs.next()) {
				photo = new Photo(); // 将相片信息对象进行实例化
				photo.setId(rs.getInt(1)); // 将第1个字段内容进行赋值
				photo.setPhotoName(rs.getString(2));// 将第2个字段内容进行赋值
				photo.setPhotoSize(rs.getString(3));// 将第3个字段内容进行赋值
				photo.setPhotoType(rs.getString(4));// 将第4个字段内容进行赋值
				photo.setPhotoTime(rs.getString(5));// 将第5个字段内容进行赋值
				photo.setPhotoAddress(rs.getString(6));// 6第1个字段内容进行赋值
				photo.setUsername(rs.getString(7));// 将第7个字段内容进行赋值
				photo.setPrintAddress(rs.getString(8));// 将第8个字段内容进行赋值
				photo.setSmallPhoto(rs.getString(9));// 将第9个字段内容进行赋值
				list.add(photo); // 将查询的结果保存在List集合对象中
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			connection.closeConnection(); // 关闭数据库链接操作
		}
		return list;
	}

	// 以用户名为条件，查询该用上传相册的名称
	public String[] queryPhotoType(String username) {
		String[] type = null; // 设置type数组，该数据保存用户上传相册的名称
		sql = "select photoType from tb_photo  where username='" + username
				+ "' group by photoType"; // 设置分组查询的SQL语句
		connection = new JDBConnection(); // 将JDBConnection对象进行实例化
		ResultSet rs = connection.executeQuery(sql); // 执行查询SQL语句，并将查询结果保存在rs对象中
		try {
			rs.last(); // rs执行指到最后一组数据
			int length = rs.getRow(); // 查询当前记录数
			type = new String[length]; // 将数据的长度进行设置
			rs.beforeFirst(); // 将rs指针指到最前面的数据库
			int i = 0; // 设置i变量，用来记录循环的次数
			// rs对象进行循环
			while (rs.next()) {
				type[i++] = rs.getString("photoType");// 将数据中的每个对象进行赋值
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			connection.closeConnection();
		}
		return type; // 将查询的结果数组进行返回
	}

	// 以自动编号为条件，修改水印图片的位置
	public boolean updatePhoto(Photo photo) {
		connection = new JDBConnection(); // 将JDBConnection对象进行实例化
		sql = "update tb_photo set printAddress = '" + photo.getPrintAddress()
				+ "' where id = '" + photo.getId() + "'";

		if (connection.executeUpdate(sql)) {
			return true;
		} else {
			return false;
		}
	}

	// 首页查询操作
	public List queryPhotoList() {
		connection = new JDBConnection();
		list = new ArrayList(); // 将List集合对象进行实例化
		sql = "select photoType,count(*) as number from tb_photo group by photoType order by number desc";
		Photo photo = null;
		ResultSet rs = connection.executeQuery(sql);
		try {
			while (rs.next()) {
				photo = new Photo();
				photo.setPhotoType(rs.getString("photoType"));
				photo.setNumber(rs.getInt("number"));
				list.add(photo); // 将查询的结果保存在List集合对象中
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			connection.closeConnection(); // 关闭数据库链接操作
		}
		return list;
	}


}
