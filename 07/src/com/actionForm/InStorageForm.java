package com.actionForm;

import java.util.*;

import org.apache.struts.action.*;

public class InStorageForm extends ActionForm {
    private int id;
    private String ino;
    private int stockid;
    private Date createTime;
    private String username;
    public int getId() {
        return id;
    }

    public String getIno() {
        return ino;
    }

    public int getStockid() {
        return stockid;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public String getUsername() {
        return username;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setIno(String ino) {
        this.ino = ino;
    }

    public void setStockid(int stockid) {
        this.stockid = stockid;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public void setUsername(String username) {
        this.username = username;
    }

}
