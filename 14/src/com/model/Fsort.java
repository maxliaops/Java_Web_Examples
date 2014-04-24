package com.model;

/**
 * <p>Title: mingrisoft</p>
 * <p>Description: 明日科技门户网站</p>
 * <p>Copyright: Copyright (c) 2005</p>
 * <p>Company: MR</p>
 * @author BWM
 * @version 1.0
 */

public class Fsort {
    private int fsid;
    private String name;
    private String ftime;
    private String uid;
    private String resume;
    private int state;
    private int free;
    public Fsort() {
    }
    public int getFsid() {
        return fsid;
    }
    public void setFsid(int fsid) {
        this.fsid = fsid;
    }
    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }
    public String getFtime() {
        return ftime;
    }
    public void setFtime(String ftime) {
        this.ftime = ftime;
    }
    public String getUid() {
        return uid;
    }
    public void setUid(String uid) {
        this.uid = uid;
    }
    public String getResume() {
        return resume;
    }
    public void setResume(String resume) {
        this.resume = resume;
    }
    public int getState() {
        return state;
    }
    public void setState(int state) {
        this.state = state;
    }
    public int getFree() {
        return free;
    }
    public void setFree(int free) {
        this.free = free;
    }

}