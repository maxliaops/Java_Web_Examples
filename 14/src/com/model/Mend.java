package com.model;

/**
 * <p>Title: </p>
 * <p>Description: </p>
 * <p>Copyright: Copyright (c) 2004</p>
 * <p>Company: MR</p>
 * @author BWM
 * @version 1.0
 */

public class Mend {
    private int sid;
    private String name;
    private int state;
    private String uptime;
    private int commend;
    private int loadnum;
    private int filesize;
    private String resume;
    private String path;
    private int mid;
    public Mend() {
    }
    public int getMid() {
        return mid;
    }
    public void setMid(int mid) {
        this.mid = mid;
    }
    public int getSid() {
        return sid;
    }
    public void setSid(int sid) {
        this.sid = sid;
    }
    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }
    public int getState() {
        return state;
    }
    public void setState(int state) {
        this.state = state;
    }
    public String getUptime() {
        return uptime;
    }
    public void setUptime(String uptime) {
        this.uptime = uptime;
    }
    public int getCommend() {
        return commend;
    }
    public void setCommend(int commend) {
        this.commend = commend;
    }
    public int getLoadnum() {
        return loadnum;
    }
    public void setLoadnum(int loadnum) {
        this.loadnum = loadnum;
    }
    public int getFilesize() {
        return filesize;
    }
    public void setFilesize(int filesize) {
        this.filesize = filesize;
    }
    public String getResume() {
        return resume;
    }
    public void setResume(String resume) {
        this.resume = resume;
    }
    public String getPath() {
        return path;
    }
    public void setPath(String path) {
        this.path = path;
    }

}