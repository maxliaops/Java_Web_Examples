package com.actionForm;

import java.util.*;

public class CheckForm {
    private int stockid;
    private Date checkTime;
    private String checker;
    public int getStockid() {
        return stockid;
    }

    public Date getCheckTime() {
        return checkTime;
    }

    public String getChecker() {
        return checker;
    }

    public void setStockid(int stockid) {
        this.stockid = stockid;
    }

    public void setCheckTime(Date checkTime) {
        this.checkTime = checkTime;
    }

    public void setChecker(String checker) {
        this.checker = checker;
    }
}
