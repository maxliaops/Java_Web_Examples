package com.lyq.model.product;

import java.io.Serializable;

/**
 * 上传文件对象
 * @author Li Yongqiang
 */
public class UploadFile implements Serializable{
	private static final long serialVersionUID = 1L;
	// 编号
	private Integer id;
	// 文件路径
	private String path;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
}
