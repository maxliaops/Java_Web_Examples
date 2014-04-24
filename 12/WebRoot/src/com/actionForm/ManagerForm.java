package com.actionForm;


public class ManagerForm{
    private Integer id=new Integer(-1);  //管理员ID号
    private String name="";   //管理员名称
    private String pwd="";  //管理员密码
    private int sysset=0;  //系统设置权限
    private int readerset=0;   //读者管理权限
    private int bookset=0;   //图书管理权限
    private int borrowback=0;   //图书借还权限
    private int sysquery=0;    //系统查询权限
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public void setPwd(String pwd) {
        this.pwd = pwd;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getName() {
        return name;
    }

    public String getPwd() {
        return pwd;
    }

    public void setSysset(int sysset){
        this.sysset=sysset;
    }
    public int getSysset(){
        return sysset;
    }
    public int getReaderset(){
        return readerset;
    }
    public void setReaderset(int readerset){
        this.readerset=readerset;
    }
    public void setBookset(int bookset){
        this.bookset=bookset;
    }
    public int getBookset(){
        return bookset;
    }
    public void setBorrowback(int borrowback){
        this.borrowback=borrowback;
    }
    public int getBorrowback(){
        return borrowback;
    }
    public void setSysquery(int sysquery){
        this.sysquery=sysquery;
    }
    public int getSysquery(){
        return sysquery;
    }
}
