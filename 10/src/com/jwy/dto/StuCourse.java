package com.jwy.dto;

public class StuCourse implements java.io.Serializable {

	private Integer id;			//主键编号，自动增涨
	private Integer stuId;		//学生编号
	private Integer courseId;	//课程编号

	// Constructors

	/** default constructor */
	public StuCourse() {
	}

	/** full constructor */
	public StuCourse(Integer stuId, Integer courseId) {
		this.stuId = stuId;
		this.courseId = courseId;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getStuId() {
		return this.stuId;
	}

	public void setStuId(Integer stuId) {
		this.stuId = stuId;
	}

	public Integer getCourseId() {
		return this.courseId;
	}

	public void setCourseId(Integer courseId) {
		this.courseId = courseId;
	}

}