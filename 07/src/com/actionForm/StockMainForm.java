package com.actionForm;

import java.util.*;

import org.apache.struts.action.*;

public class StockMainForm extends ActionForm {
    private int id;
    private String principal;
    private int providerid;
    private String username;
    private Date createTime;
    private int state;
    private Set stockDetail=new HashSet();
    private String sno;
    public int getId() {
        return id;
    }

    public String getPrincipal() {
        return principal;
    }

    public int getProviderid() {
        return providerid;
    }

    public String getUsername() {
        return username;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public int getState() {
        return state;
    }

    public Set getStockDetail() {
        return stockDetail;
    }

    public String getSno() {
        return sno;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setPrincipal(String principal) {
        this.principal = principal;
    }

    public void setProviderid(int providerid) {
        this.providerid = providerid;
    }

    public void setUsername(String username) {
        this.username = username;
    }

//    public void setCreateTime(String createTime) {
//        this.createTime =Date.valueOf(createTime);
//    }
//    public void setCreateTime(String createTime) {
//        this.createTime =new Date();
//    }
    public void setCreateTime(Date createTime) {
        this.createTime =createTime;
    }
    public void setState(int state) {
        this.state = state;
    }

    public void setStockDetail(Set stockDetail) {
        this.stockDetail = stockDetail;
    }

    public void setSno(String sno) {
        this.sno = sno;
    }
}
