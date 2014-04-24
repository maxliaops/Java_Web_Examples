package com.actionForm;

import org.apache.struts.action.ActionForm;

public class StockGoodsForm extends ActionForm {
    private int id;
    private float price;
    private int number;
    public int getId() {
        return id;
    }

    public float getPrice() {
        return price;
    }

    public int getNumber() {
        return number;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public void setNumber(int number) {
        this.number = number;
    }
}
