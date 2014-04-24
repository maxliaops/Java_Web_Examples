package com.hiernate.persistence;

public class Menu {
  private Long id;
  private Long modeId;
  private String linkurl;
  private String menuName;
public String getMenuName() {
	return menuName;
}
public void setMenuName(String menuName) {
	this.menuName = menuName;	
}
public Long getId() {
	return id;
}
public void setId(Long id) {
	this.id = id;
}
public String getLinkurl() {
	return linkurl;
}
public void setLinkurl(String linkurl) {
	this.linkurl = linkurl;
}
public Long getModeId() {
	return modeId;
}
public void setModeId(Long modeId) {
	this.modeId = modeId;
}

}
