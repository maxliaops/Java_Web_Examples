package com.actionForm;

import org.apache.struts.action.*;

public class IfForm extends ActionForm {
    private String flag[]=null;
    private String f="";
    private String key="";
    private String sdate="";
    private String edate="";
    private int state;
    public IfForm(){
    }

    public void setFlag(String flag[]) {
        this.flag = flag;
    }

    public void setF(String f) {
        this.f = f;
    }

    public void setKey(String key) {
        this.key = key;
    }

    public void setSdate(String sdate) {
        this.sdate = sdate;
    }

    public void setEdate(String edate) {
        this.edate = edate;
    }

    public void setState(int state) {
        this.state = state;
    }

    public String[] getFlag() {
        return flag;
    }

    public String getF() {
        return f;
    }

    public String getKey() {
        return key;
    }

    public String getSdate() {
        return sdate;
    }

    public String getEdate() {
        return edate;
    }

    public int getState() {
        return state;
    }
}
