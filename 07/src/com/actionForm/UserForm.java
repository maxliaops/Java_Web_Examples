package com.actionForm;

import org.apache.struts.action.*;
public class UserForm extends ActionForm {
    private int id;
    private String name;
    private String pwd;
    private Byte setInstorage = new Byte("0");
    private Byte setOutstorage= new Byte("0");
    private Byte setDeal= new Byte("0");
    private Byte setQuery= new Byte("0");
    private Byte setBasic= new Byte("0");
    private Byte setSys= new Byte("0");
    public int getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public String getPwd() {
        return pwd;
    }

    public Byte getSetInstorage() {
        return setInstorage;
    }

    public Byte getSetOutstorage() {
        return setOutstorage;
    }

    public Byte getSetDeal() {
        return setDeal;
    }

    public Byte getSetQuery() {
        return setQuery;
    }

    public Byte getSetBasic() {
        return setBasic;
    }

    public Byte getSetSys() {
        return setSys;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setPwd(String pwd) {
        this.pwd = pwd;
    }

    public void setSetInstorage(Byte setInstorage) {
        this.setInstorage = setInstorage;
    }

    public void setSetOutstorage(Byte setOutstorage) {
        this.setOutstorage = setOutstorage;
    }

    public void setSetDeal(Byte setDeal) {
        this.setDeal = setDeal;
    }

    public void setSetQuery(Byte setQuery) {
        this.setQuery = setQuery;
    }

    public void setSetBasic(Byte setBasic) {
        this.setBasic = setBasic;
    }

    public void setSetSys(Byte setSys) {
        this.setSys = setSys;
    }

}

