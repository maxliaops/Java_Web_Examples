package com.actionForm;

import org.apache.struts.action.*;

public class ProviderForm extends ActionForm {
    private int id=-1;
    private String name="";
    private String address="";
    private String fax="";
    private String tel="";
    private String postcode="";
    private String bankNo="";
    private String bankName="";
    private String memo="";
    public int getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public String getAddress() {
        return address;
    }

    public String getFax() {
        return fax;
    }

    public String getTel() {
        return tel;
    }

    public String getPostcode() {
        return postcode;
    }

    public String getBankNo() {
        return bankNo;
    }

    public String getBankName() {
        return bankName;
    }

    public String getMemo() {
        return memo;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public void setFax(String fax) {
        this.fax = fax;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

    public void setPostcode(String postcode) {
        this.postcode = postcode;
    }

    public void setBankNo(String bankNo) {
        this.bankNo = bankNo;
    }

    public void setBankName(String bankName) {
        this.bankName = bankName;
    }

    public void setMemo(String memo) {
        this.memo = memo;
    }

}
