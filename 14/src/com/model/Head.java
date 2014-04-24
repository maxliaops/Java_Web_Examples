package com.model;

/**
 * <p>Title: </p>
 * <p>Description: </p>
 * <p>Copyright: Copyright (c) 2004</p>
 * <p>Company: MR</p>
 * @author BWM
 * @version 1.0
 */

public class Head {

    private String iid;
    private String path;
    private String atime;
    private int state;
    public Head() {
    }
    public String getIid() {
        return iid;
    }
    public void setIid(String iid) {
        this.iid = iid;
    }
    public String getPath() {
        return path;
    }
    public void setPath(String path) {
        this.path = path;
    }
    public String getAtime() {
        return atime;
    }
    public void setAtime(String atime) {
        this.atime = atime;
    }
    public int getState() {
        return state;
    }
    public void setState(int state) {
        this.state = state;
    }
}