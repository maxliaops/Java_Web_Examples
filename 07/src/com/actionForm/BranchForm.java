package com.actionForm;

import java.util.*;

import org.apache.struts.action.*;


public class BranchForm extends ActionForm {
    private int id;
    private String name;
    private String tel;
    private String memo;
    private Set getuse=new HashSet();
    private Set damage=new HashSet();
    public int getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public String getTel() {
        return tel;
    }

    public String getMemo() {
        return memo;
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

    public void setTel(String tel) {
        this.tel = tel;
    }

    public void setMemo(String memo) {
        this.memo = memo;
    }

    public void setGetuse(Set getuse) {
        this.getuse = getuse;
    }

    public void setDamage(Set damage) {
        this.damage = damage;
    }

}
