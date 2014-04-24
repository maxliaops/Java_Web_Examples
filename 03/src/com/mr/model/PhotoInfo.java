package com.mr.model;

import java.io.File;

public class PhotoInfo {
	private Integer id = -1;
	private String photoType = "";
	private String photoName = "";
	private String photoAddress = "";
	private Integer photoVisit = 0;
	private String author = "";
	private File upload = null;
	/** ***************************** */
	private String uploadContentType = "";
	private String uploadFileName = "";
	private String savePath = "";

	public String getSavePath() {
		return savePath;
	}
	public void setSavePath(String savePath) {
		this.savePath = savePath;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getPhotoAddress() {
		return photoAddress;
	}
	public void setPhotoAddress(String photoAddress) {
		this.photoAddress = photoAddress;
	}
	public String getPhotoName() {
		return photoName;
	}
	public void setPhotoName(String photoName) {
		this.photoName = photoName;
	}
	public String getPhotoType() {
		return photoType.trim();
	}
	public void setPhotoType(String photoType) {
		this.photoType = photoType.trim();
	}
	public Integer getPhotoVisit() {
		return photoVisit;
	}
	public void setPhotoVisit(Integer photoVisit) {
		this.photoVisit = photoVisit;
	}
	public File getUpload() {
		return upload;
	}
	public void setUpload(File upload) {
		this.upload = upload;
	}

	public String getUploadContentType() {
		return uploadContentType;
	}
	public void setUploadContentType(String uploadContentType) {
		this.uploadContentType = uploadContentType;
	}
	public String getUploadFileName() {
		return uploadFileName;
	}
	public void setUploadFileName(String uploadFileName) {
		this.uploadFileName = uploadFileName;
	}

}
