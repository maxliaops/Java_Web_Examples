package com.actionForm;

import java.util.*;

import org.apache.struts.action.*;

public class GetUseForm extends ActionForm {
    private int id;
    private String gno="";
    private int goodsid;
    private int number;
    private String principal;
    private String username;
    private int branchid;
    private Date createtime;
    private GoodsForm goods;
    private BranchForm branch;
    public int getId() {
        return id;
    }

    public String getGno() {
        return gno;
    }

    public int getGoodsid() {
        return goodsid;
    }

    public int getNumber() {
        return number;
    }

    public String getPrincipal() {
        return principal;
    }

    public String getUsername() {
        return username;
    }

    public int getBranchid() {
        return branchid;
    }

    public Date getCreatetime() {
        return createtime;
    }

    public GoodsForm getGoods() {
        return goods;
    }

    public BranchForm getBranch() {
        return branch;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setGno(String gno) {
        this.gno = gno;
    }

    public void setGoodsid(int goodsid) {
        this.goodsid = goodsid;
    }

    public void setNumber(int number) {
        this.number = number;
    }

    public void setPrincipal(String principal) {
        this.principal = principal;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public void setBranchid(int branchid) {
        this.branchid = branchid;
    }

    public void setCreatetime(Date createtime) {
        this.createtime = createtime;
    }

    public void setGoods(GoodsForm goods) {
        this.goods = goods;
    }

    public void setBranch(BranchForm branch) {
        this.branch = branch;
    }

}
