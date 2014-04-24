package com.model;

public class Member {
  private Integer ID=Integer.valueOf("-1");
  private String username="";
  private String truename="";
  private String pwd="";
  private String city="";
  private String address="";
  private String postcode="";
  private String cardno="";
  private String cardtype="";
  private String tel="";
  private String email="";
  public void member(){  //±ØÐëµÄ
 }

 public Integer getID(){
  return ID;
}
public void setID(Integer ID){
  this.ID=ID;
}

 public String getUsername(){
   return username;
 }
 public void setUsername(String username){
   this.username=username;
 }
 public String getTruename(){
   return truename;
 }
 public void setTruename(String truename){
   this.truename =truename;
 }
 public String getPwd(){
   return pwd;
 }
 public void setPwd(String pwd){
   this.pwd =pwd;
 }
 public String getCity(){
   return city;
 }
 public void setCity(String city){
   this.city=city;
 }
 public String getAddress(){
   return address;
 }
 public void setAddress(String address){
   this.address=address;
 }
 public String getPostcode(){
   return postcode;
 }
 public void setPostcode(String postcode){
   this.postcode=postcode;
 }
 public String getCardno(){
   return cardno;
 }
 public void setCardno(String cardno){
   this.cardno=cardno;
 }
 public String getCardtype(){
   return cardtype;
 }
 public void setCardtype(String cardtype){
   this.cardtype=cardtype;
 }
 public String getTel(){
   return tel;
 }
 public void setTel(String tel){
   this.tel=tel;
 }
 public String getEmail(){
   return email;
 }
 public void setEmail(String email){
   this.email =email;
 }
}
