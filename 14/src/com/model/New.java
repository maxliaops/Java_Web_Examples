package com.model;

/**
 * <p>Title: </p>
 * <p>Description: </p>
 * <p>Copyright: Copyright (c) 2004</p>
 * <p>Company: MR</p>
 * @author BWM
 * @version 1.0
 */

public class New {
    private int nid;
    private String uid;
    private String ntime;
    private String fromto;
    private String content;
    private String title;
    public New() {
    }
    public int getNid() {
        return nid;
    }
    public void setNid(int nid) {
        this.nid = nid;
    }
    public String getUid() {
        return uid;
    }
    public void setUid(String uid) {
        this.uid = uid;
    }
    public String getNtime() {
        return ntime;
    }
    public void setNtime(String ntime) {
        this.ntime = ntime;
    }
    public String getFromto() {
        return fromto;
    }
    public void setFromto(String fromto) {
        this.fromto = fromto;
    }
    public String getContent() {
        return content;
    }
    public void setContent(String content) {
        this.content = content;
    }
    public String getTitle() {
        return title;
    }
    public void setTitle(String title) {
        this.title = title;
    }

}