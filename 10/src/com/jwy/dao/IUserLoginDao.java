package com.jwy.dao;

import com.jwy.dto.UserLogin;

/**
 * 
 * @author Jingweiyu 
 */
public interface IUserLoginDao {
	public UserLogin findbyNameAndPwd(String name,String pwd);		//按用户名密码查找用户
	public boolean findByLoginName(String loginName);				//检证用户名是否已经存在
	public Integer  findByNPM(String name,String pwd,String mail);	//验证修改密码信息
	public Integer insert(UserLogin user);							//新用户注册
	public void updatePwd(Integer id,String pwd);					//修改密码
	
}
