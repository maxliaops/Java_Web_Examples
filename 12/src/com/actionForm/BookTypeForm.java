package com.actionForm;

public class BookTypeForm {
    private int days;
    private Integer id;
    private String typeName;

    public void setTypeName(String typeName) {
        this.typeName = typeName;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public void setDays(int days) {
        this.days = days;
    }

    public int getDays() {
        return days;
    }

    public Integer getId() {
        return id;
    }

    public String getTypeName() {
        return typeName;
    }

}
