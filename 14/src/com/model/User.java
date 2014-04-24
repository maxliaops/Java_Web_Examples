package com.model;

import javax.servlet.http.HttpServletRequest;

/**
 * <p>Title: </p>
 * <p>Description: </p>
 * <p>Copyright: Copyright (c) 2004</p>
 * <p>Company: MR</p>
 * @version 1.0
 */

public class User {
    private String uid;
    private String password;
    private String name="сн©м";
    private String regqu;
    private String reganswer;
    private int sex;
    private int age;
    private String tel;
    private String email;
    private String qq;
    private String regtime="1982-6-16 9:00:00";
    private String address;
    private String http;
    private int status;
    private int state;
    private String resume;
    private String iid;
    public String getUid() {
        return uid;
    }
    public void setUid(String uid) {
        this.uid = uid;
    }
    public String getPassword() {
        return password;
    }
    public void setPassword(String password) {
        this.password = password;
    }
    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }
    public String getRegqu() {
        return regqu;
    }
    public void setRegqu(String regqu) {
        this.regqu = regqu;
    }
    public String getReganswer() {
        return reganswer;
    }
    public void setReganswer(String reganswer) {
        this.reganswer = reganswer;
    }
    public int getSex() {
        return sex;
    }
    public void setSex(int sex) {
        this.sex = sex;
    }
    public int getAge() {
        return age;
    }
    public void setAge(int age) {
        this.age = age;
    }
    public String getTel() {
        return tel;
    }
    public void setTel(String tel) {
        this.tel = tel;
    }
    public String getEmail() {
        return email;
    }
    public void setEmail(String email) {
        this.email = email;
    }
    public String getQq() {
        return qq;
    }
    public void setQq(String qq) {
        this.qq = qq;
    }
    public String getRegtime() {
        return regtime;
    }
    public void setRegtime(String regtime) {
        this.regtime = regtime;
    }
    public String getAddress() {
        return address;
    }
    public void setAddress(String address) {
        this.address = address;
    }
    public String getHttp() {
        return http;
    }
    public void setHttp(String http) {
        this.http = http;
    }
    public int getStatus() {
        return status;
    }
    public void setStatus(int status) {
        this.status = status;
    }
    public int getState() {
        return state;
    }
    public void setState(int state) {
        this.state = state;
    }
    public String getResume() {
        return resume;
    }
    public void setResume(String resume) {
        this.resume = resume;
    }
    public String getIid() {
        return iid;
    }
    public void setIid(String iid) {
        this.iid = iid;
    }

}