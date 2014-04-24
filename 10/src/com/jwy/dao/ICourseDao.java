package com.jwy.dao;

import java.util.List;
import java.util.Map;

import com.jwy.dto.Course;

/**
 * 
 * @author Jingweiyu 
 */
public interface ICourseDao { 
	public void insert(Course course);		//增加新课程
	public void updateIsFinish(Integer id);	//将课程设置为学生不可先
	public List<Object> findBySearch(Map<String,String> map);//按照专业名称、课程名称，授课教师查找
	public Course findByID(Integer id);		//按照课程编号查找
	public List<Course> findByAll();		//查询所有课程
	public List<Object[]> findByStat(Map<String,String> map);	//按照条件查询课程
	public List<Object[]> findSelectStu(Integer id);	//查询出所有选择此课程的学生
}
