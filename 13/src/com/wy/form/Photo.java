package com.wy.form;

public class Photo {
	private Integer id = -1;       // 设置数据库自动编号的对象
	private String photoName = ""; // 设置相片名称的对象
	private String photoSize = ""; // 设置相片大小的对象
	private String photoTime = ""; // 设置相片上传时间的对象
	private String photoAddress = ""; // 设置相片保存在服务器端地址的对象
	private String username = ""; // 设置相片上传用户的对象
	private String photoType = ""; // 设置相片所在相册名称的对象
	private String printAddress="";
	
	
	private String smallPhoto="";
	
	private Integer number=null;
	

	public Integer getNumber() {
		return number;
	}

	public void setNumber(Integer number) {
		this.number = number;
	}

	public String getPrintAddress() {
		return printAddress;
	}

	public void setPrintAddress(String printAddress) {
		this.printAddress = printAddress;
	}

	//设置相册信息的构造方法
	public Photo() {
	}
	
	/******************设置相片所在相册名称对象的getXXX()和setXXX()方法*************/
	public String getPhotoType() {
		return photoType;
	}

	public void setPhotoType(String photoType) {
		this.photoType = photoType;
	}
	/***************************************************/
	
	/******************设置数据库自动编号对象的getXXX()和setXXX()方法*************/
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}
	/***************************************************/
	/******************设置相片存放服务器端地址对象的getXXX()和setXXX()方法*************/
	public String getPhotoAddress() {
		return photoAddress;
	}
	
	public void setPhotoAddress(String photoAddress) {
		this.photoAddress = photoAddress;
	}
	/***************************************************/
	/******************设置相片名称对象的getXXX()和setXXX()方法*************/
	public String getPhotoName() {
		return photoName;
	}

	public void setPhotoName(String photoName) {
		this.photoName = photoName;
	}
	/***************************************************/
	/******************设置相片大小对象的getXXX()和setXXX()方法*************/
	public String getPhotoSize() {
		return photoSize;
	}

	public void setPhotoSize(String photoSize) {
		this.photoSize = photoSize;
	}
	/***************************************************/
	/******************设置相片上传时间对象的getXXX()和setXXX()方法*************/
	public String getPhotoTime() {
		return photoTime;
	}

	public void setPhotoTime(String photoTime) {
		this.photoTime = photoTime;
	}
	/***************************************************/
	/******************设置相片上传用户名对象的getXXX()和setXXX()方法*************/
	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}
	/***************************************************/

	public String getSmallPhoto() {
		return smallPhoto;
	}

	public void setSmallPhoto(String smallPhoto) {
		this.smallPhoto = smallPhoto;
	}
}
