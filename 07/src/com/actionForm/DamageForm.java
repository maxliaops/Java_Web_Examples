package com.actionForm;

import java.util.*;

import org.apache.struts.action.*;

public class DamageForm extends ActionForm {
    private int id;
    private int branchid;
    private int goodsid;
    private int damagenum;
    private Date createtime;
    private String principal;
    private String username;
    private String cause;
    private GoodsForm goods;
    private BranchForm branch;
    public int getId() {
        return id;
    }

    public int getBranchid() {
        return branchid;
    }

    public int getGoodsid() {
        return goodsid;
    }

    public int getDamagenum() {
        return damagenum;
    }

    public Date getCreatetime() {
        return createtime;
    }

    public String getPrincipal() {
        return principal;
    }

    public String getUsername() {
        return username;
    }

    public String getCause() {
        return cause;
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

    public void setBranchid(int branchid) {
        this.branchid = branchid;
    }

    public void setGoodsid(int goodsid) {
        this.goodsid = goodsid;
    }

    public void setDamagenum(int damagenum) {
        this.damagenum = damagenum;
    }

    public void setCreatetime(Date createtime) {
        this.createtime = createtime;
    }

    public void setPrincipal(String principal) {
        this.principal = principal;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public void setCause(String cause) {
        this.cause = cause;
    }

    public void setGoods(GoodsForm goods) {
        this.goods = goods;
    }

    public void setBranch(BranchForm branch) {
        this.branch = branch;
    }

}
