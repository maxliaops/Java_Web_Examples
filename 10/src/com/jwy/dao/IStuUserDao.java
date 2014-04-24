package com.jwy.dao;

import java.util.List;

import com.jwy.dto.StuUser;

/**
 * 
 * @author Jingweiyu 
 */
public interface IStuUserDao {
	public StuUser findById(Integer id);			//按照编号查询用户
	public List<Object[]> findSelect(Integer id);	//查询指定编号用户可选课程
	public List<Object[]> findSelected(Integer id);	//查询指定编号用户已经选过的课程
	public void insert(StuUser user);				//增加新用户
	public void insertSC(String[] courseIds,Integer stuId);	//将用户编号与课程编号关联起来
}
