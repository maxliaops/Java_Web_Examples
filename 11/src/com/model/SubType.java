package com.model;

public class SubType {
  private int superid=0;
  private String typename="";
  public void SubType() {
  }
  public int getsuperid(){
    return superid;
  }
  public void setsuperid(int superid){
    this.superid=superid;
  }
  public String gettypename(){
    return typename;
  }
  public void settypename(String typename){
    this.typename=typename;
  }
}
