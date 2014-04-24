package com.actionForm;

import org.apache.struts.action.*;

public class StockDetailForm extends ActionForm {
    private int goodsid;
    private float price;
    private int number;
    private StockMainForm stockMain;
    private StockMainViewForm stockViewMain;
    private int stockid;
    private int id;
    private GoodsForm goods;
    public int getGoodsid() {
        return goodsid;
    }

    public float getPrice() {
        return price;
    }

    public int getNumber() {
        return number;
    }

    public StockMainForm getStockMain() {
        return stockMain;
    }

    public StockMainViewForm getStockViewMain() {
        return stockViewMain;
    }

    public int getStockid() {
        return stockid;
    }

    public int getId() {
        return id;
    }

    public GoodsForm getGoods() {
        return goods;
    }

    public void setGoodsid(int goodsid) {
        this.goodsid = goodsid;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public void setNumber(int number) {
        this.number = number;
    }

    public void setStockMain(StockMainForm stockMain) {
        this.stockMain = stockMain;
    }

    public void setStockViewMain(StockMainViewForm stockViewMain) {
        this.stockViewMain = stockViewMain;
    }

    public void setStockid(int stockid) {
        this.stockid = stockid;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setGoods(GoodsForm goods) {
        this.goods = goods;
    }

}
