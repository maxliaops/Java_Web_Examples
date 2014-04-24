package com.actionForm;

public class BookForm {
    private String author;
    private String barcode;
    private String bookName;
    private String bookcaseName;
    private int bookcaseid;
    private int days;
    private int del;
    private Integer id;
    private String inTime;
    private String isbn;
    private String operator;
    private int page;
    private Float price;
    private String publishing;

    private String translator;
    private int typeId;
    private String typeName;
    public BookForm(){
    }
    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public void setTypeName(String typeName) {
        this.typeName = typeName;
    }

    public void setTypeId(int typeId) {
        this.typeId = typeId;
    }

    public void setTranslator(String translator) {
        this.translator = translator;
    }

  
    public void setPublishing(String publishing) {
        this.publishing = publishing;
    }

    public void setPrice(Float price) {
        this.price = price;
    }

    public void setPage(int page) {
        this.page = page;
    }

    public void setOperator(String operator) {
        this.operator = operator;
    }

    public void setIsbn(String isbn) {
        this.isbn = isbn;
    }

    public void setInTime(String inTime) {
        this.inTime = inTime;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public void setDel(int del) {
        this.del = del;
    }

    public void setDays(int days) {
        this.days = days;
    }

    public void setBookcaseid(int bookcaseid) {
        this.bookcaseid = bookcaseid;
    }

    public void setBookcaseName(String bookcaseName) {
        this.bookcaseName = bookcaseName;
    }

    public void setBookName(String bookName) {
        this.bookName = bookName;
    }

    public void setBarcode(String barcode) {
        this.barcode = barcode;
    }

    public String getBarcode() {
        return barcode;
    }

    public String getBookName() {
        return bookName;
    }

    public String getBookcaseName() {
        return bookcaseName;
    }

    public int getBookcaseid() {
        return bookcaseid;
    }

    public int getDays() {
        return days;
    }

    public int getDel() {
        return del;
    }

    public Integer getId() {
        return id;
    }

    public String getInTime() {
        return inTime;
    }

    public String getIsbn() {
        return isbn;
    }

    public String getOperator() {
        return operator;
    }

    public int getPage() {
        return page;
    }

    public Float getPrice() {
        return price;
    }

    public String getPublishing() {
        return publishing;
    }

 
    public String getTranslator() {
        return translator;
    }

    public int getTypeId() {
        return typeId;
    }

    public String getTypeName() {
        return typeName;
    }

}
