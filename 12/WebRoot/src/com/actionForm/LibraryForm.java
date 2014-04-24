package com.actionForm;

public class LibraryForm{
    private String address;
    private String curator;
    private String email;
    private Integer id;
    private String introduce;
    private String libraryname;
    private String tel;
    private String createDate;
    private String url;
    public LibraryForm(){
    }
    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public void setCreateDate(String createDate) {
        this.createDate = createDate;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

    public void setLibraryname(String libraryname) {
        this.libraryname = libraryname;
    }

    public void setIntroduce(String introduce) {
        this.introduce = introduce;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setCurator(String curator) {
        this.curator = curator;
    }

    public String getCurator() {
        return curator;
    }

    public String getEmail() {
        return email;
    }

    public Integer getId() {
        return id;
    }

    public String getIntroduce() {
        return introduce;
    }

    public String getLibraryname() {
        return libraryname;
    }

    public String getTel() {
        return tel;
    }

    public String getCreateDate() {
        return createDate;
    }

    public String getUrl() {
        return url;
    }

}
