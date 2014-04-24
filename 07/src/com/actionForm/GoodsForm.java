package com.actionForm;

import java.util.*;

import org.apache.struts.action.*;

public class GoodsForm extends ActionForm {
    private int id;
    private String name="";
    private String spec="";
    private String unit="";
    private float price=0.0f;
    private String producer;
    private Byte ifdel;
    private Set stockDetail=new HashSet();
    private Set loan=new HashSet();
    private Set getuse=new HashSet();
    private Set damage=new HashSet();


    public int getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public String getSpec() {
        return spec;
    }

    public String getUnit() {
        return unit;
    }

    public float getPrice() {
        return price;
    }

    public String getProducer() {
        return producer;
    }

    public Byte getIfdel() {
        return ifdel;
    }

    public Set getStockDetail() {
        return stockDetail;
    }

    public Set getLoan() {
        return loan;
    }

    public Set getGetuse() {
        return getuse;
    }

    public Set getDamage() {
        return damage;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setSpec(String spec) {
        this.spec = spec;
    }

    public void setUnit(String unit) {
        this.unit = unit;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public void setProducer(String producer) {
        this.producer = producer;
    }

    public void setIfdel(Byte ifdel) {
        this.ifdel = ifdel;
    }

    public void setStockDetail(Set stockDetail) {
        this.stockDetail = stockDetail;
    }

    public void setLoan(Set loan) {
        this.loan = loan;
    }

    public void setGetuse(Set getuse) {
        this.getuse = getuse;
    }

    public void setDamage(Set damage) {
        this.damage = damage;
    }

}
