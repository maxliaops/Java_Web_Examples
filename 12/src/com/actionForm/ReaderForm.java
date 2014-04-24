package com.actionForm;

public class ReaderForm{
    private String barcode;
    private String birthday;
    private String createDate;
    private String email;
    private Integer id;
    private String name;
    private String operator;
    private String paperNO;
    private String paperType;
    private String remark;
    private String sex;
    private String tel;
    private String vocation;
    private int typeid;
    private String typename;
    private int number;
    public ReaderForm(){
    }
    public String getBarcode() {
        return barcode;
    }

    public void setBarcode(String barcode) {
        this.barcode = barcode;
    }

    public void setVocation(String vocation) {
        this.vocation = vocation;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public void setPaperType(String paperType) {
        this.paperType = paperType;
    }

    public void setPaperNO(String paperNO) {
        this.paperNO = paperNO;
    }

    public void setOperator(String operator) {
        this.operator = operator;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setCreateDate(String createDate) {
        this.createDate = createDate;
    }

    public void setBirthday(String birthday) {
        this.birthday = birthday;
    }

    public String getBirthday() {
        return birthday;
    }

    public String getCreateDate() {
        return createDate;
    }

    public String getEmail() {
        return email;
    }

    public Integer getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public String getOperator() {
        return operator;
    }

    public String getPaperNO() {
        return paperNO;
    }

    public String getPaperType() {
        return paperType;
    }

    public String getRemark() {
        return remark;
    }

    public String getSex() {
        return sex;
    }

    public String getTel() {
        return tel;
    }

    public String getVocation() {
        return vocation;
    }
    public int getTypeid(){
        return typeid;
    }

    public void setTypeid(int typeid){
        this.typeid=typeid;
    }
    public int getNumber(){
        return number;
    }

    public void setNumber(int number){
        this.number=number;
    }
    public String getTypename() {
        return typename;
    }
    public void setTypename(String typename){
        this.typename=typename;
    }
}
