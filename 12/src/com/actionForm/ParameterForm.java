package com.actionForm;

public class ParameterForm{
    private int cost;
    private Integer id;
    private int validity;
    public ParameterForm(){
    }
    public int getCost() {
        return cost;
    }

    public void setCost(int cost) {
        this.cost = cost;
    }

    public void setValidity(int validity) {
        this.validity = validity;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getId() {
        return id;
    }

    public int getValidity() {
        return validity;
    }
}
