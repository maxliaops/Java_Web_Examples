package com.actionForm;

import java.util.Set;
import java.util.Date;
import java.util.HashSet;

public class StockMainViewForm {
    private int id;
    private String principal;
    private int providerid;
    private String username;
    private Date createTime;
    private int state;
    private Set stockDetail=new HashSet();
    private String sno;
    private String provider;

    public String getProvider() {
        return provider;
    }


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
    public void setProvider(String provider) {
        this.provider = provider;
    }

}
