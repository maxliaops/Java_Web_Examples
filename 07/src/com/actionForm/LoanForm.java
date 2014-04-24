package com.actionForm;

import java.util.*;

import org.apache.struts.action.*;

public class LoanForm extends ActionForm {
    private int id;
    private String lno;
    private int goodsid;
    private int number;
    private String username;
    private String principal;
    private String borrowperson;
    private String btel="";
    private String bunit="";
    private Date createtime;
    private short state=0;     //×´Ì¬  0£¨Î´ÉóºË£©1£¨ÒÑÉóºË£©2£¨ÒÑ¹é»¹£©
    //  private short state=new Short("0");     //×´Ì¬  0£¨Î´ÉóºË£©1£¨ÒÑÉóºË£©2£¨ÒÑ¹é»¹£©
    private String taster="";     //ÉóºËÈË
    private Date approvetime=null;
    private GoodsForm goods;
    private String backperson="";      //¹é»¹²Ù×÷Ô±
    private Date backtime=null;

    public void setId(int id) {
        this.id = id;
    }

    public void setLno(String lno) {
        this.lno = lno;
    }

    public void setGoodsid(int goodsid) {
        this.goodsid = goodsid;
    }

    public void setNumber(int number) {
        this.number = number;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public void setPrincipal(String principal) {
        this.principal = principal;
    }

    public void setBorrowperson(String borrowperson) {
        this.borrowperson = borrowperson;
    }

    public void setBtel(String btel) {
        this.btel = btel;
    }

    public void setBunit(String bunit) {
        this.bunit = bunit;
    }

    public void setCreatetime(Date createtime) {
        this.createtime = createtime;
    }

    public void setState(short state) {
        this.state = state;
    }

    public void setTaster(String taster) {
        this.taster = taster;
    }

    public void setApprovetime(Date approvetime) {
        this.approvetime = approvetime;
    }

    public void setGoods(GoodsForm goods) {
        this.goods = goods;
    }

    public void setBackperson(String backperson) {
        this.backperson = backperson;
    }

    public void setBacktime(Date backtime) {
        this.backtime = backtime;
    }

    public int getId() {
        return id;
    }

    public String getLno() {
        return lno;
    }

    public int getGoodsid() {
        return goodsid;
    }

    public int getNumber() {
        return number;
    }

    public String getUsername() {
        return username;
    }

    public String getPrincipal() {
        return principal;
    }

    public String getBorrowperson() {
        return borrowperson;
    }

    public String getBtel() {
        return btel;
    }

    public String getBunit() {
        return bunit;
    }

    public Date getCreatetime() {
        return createtime;
    }

    public short getState() {
        return state;
    }

    public String getTaster() {
        return taster;
    }

    public Date getApprovetime() {
        return approvetime;
    }

    public GoodsForm getGoods() {
        return goods;
    }

    public String getBackperson() {
        return backperson;
    }

    public Date getBacktime() {
        return backtime;
    }
}
