package com.actionForm;

public class BorrowForm{
    private String backTime;
    private String bookBarcode;
    private int bookId;
    private String bookName;
    private String bookcaseName;
    private String borrowTime;
    private Integer id;
    private int ifBack;
    private String operator;
    private Float price;
    private String pubName;
    private String readerBarcode;
    private int readerId;
    private int degree;
    private String author;

    private String bookType;
    private String readerName;
    private String sex;
    private String birthday;
    private String paperType;
    private String paperNo;
    private String tel;
    private String readerType;
    public String getBackTime() {
        return backTime;
    }

    public void setBackTime(String backTime) {
        this.backTime = backTime;
    }

    public void setReaderId(int readerId) {
        this.readerId = readerId;
    }

    public void setReaderBarcode(String readerBarcode) {
        this.readerBarcode = readerBarcode;
    }

    public void setPubName(String pubName) {
        this.pubName = pubName;
    }

    public void setPrice(Float price) {
        this.price = price;
    }

    public void setOperator(String operator) {
        this.operator = operator;
    }

    public void setIfBack(int ifBack) {
        this.ifBack = ifBack;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public void setBorrowTime(String borrowTime) {
        this.borrowTime = borrowTime;
    }

    public void setBookcaseName(String bookcaseName) {
        this.bookcaseName = bookcaseName;
    }

    public void setBookName(String bookName) {
        this.bookName = bookName;
    }

    public void setBookId(int bookId) {
        this.bookId = bookId;
    }

    public void setBookBarcode(String bookBarcode) {
        this.bookBarcode = bookBarcode;
    }
    public void setDegree(int degree) {
       this.degree=degree;
    }

    public String getBookBarcode() {
        return bookBarcode;
    }

    public int getBookId() {
        return bookId;
    }

    public String getBookName() {
        return bookName;
    }

    public String getBookcaseName() {
        return bookcaseName;
    }

    public String getBorrowTime() {
        return borrowTime;
    }

    public Integer getId() {
        return id;
    }

    public int getIfBack() {
        return ifBack;
    }

    public String getOperator() {
        return operator;
    }

    public Float getPrice() {
        return price;
    }

    public String getPubName() {
        return pubName;
    }

    public String getReaderBarcode() {
        return readerBarcode;
    }

    public int getReaderId() {
        return readerId;
    }
    public int getDegree() {
        return degree;
    }
    public void setAuthor(String author) {
        this.author = author;
    }
    public String getAuthor() {
       return author;
    }

    public void setBookType(String bookType) {
        this.bookType = bookType;
    }
    public String getBookType() {
       return bookType;
    }
    public void setReaderName(String readerName) {
        this.readerName = readerName;
    }
    public String getReaderName() {
       return readerName;
    }
    public void setSex(String sex) {
        this.sex = sex;
    }
    public String getSex() {
       return sex;
    }
    public void setBirthday(String birthday) {
       this.birthday = birthday;
   }
   public String getBirthday() {
      return birthday;
    }
    public void setPaperType(String paperType) {
       this.paperType = paperType;
   }
   public String getPaperType() {
      return paperType;
    }
    public void setPaperNo(String paperNo) {
       this.paperNo = paperNo;
   }
   public String getPaperNo() {
      return paperNo;
    }
    public void setTel(String tel) {
      this.tel = tel;
  }
  public String getTel() {
     return tel;
    }
    public void setReaderType(String readerType) {
      this.readerType =readerType;
  }
  public String getReaderType() {
     return readerType;
    }
}
