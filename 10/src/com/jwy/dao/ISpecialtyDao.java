package com.jwy.dao;

import java.util.List;

import com.jwy.dto.Specialty;

/**
 * 
 * @author Jingweiyu 
 */
public interface ISpecialtyDao {
	public void insert(Specialty specialty);	//增加新专业
	public void updateIsFinish(Integer id);		//将指定编号专业设置为已经结业
	public Specialty findById(Integer id);		//按指定编号查找专业
	public List<Specialty> findByAll();			//查询出所有专业
	public List<Specialty> findStuByAll();		//查询出所有未结业的专业
}
