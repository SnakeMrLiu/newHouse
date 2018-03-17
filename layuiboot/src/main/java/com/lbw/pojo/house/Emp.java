package com.lbw.pojo.house;

//员工表
public class Emp {

  private String id;//
  private String name;//姓名
  private String weixin;//微信二维码
  private String photo;//照片
  private String phonenumer;//联系方式（电话）
  private String loginnumber;//登陆账号
  private String password;//密码（MD5 32位）


  public String getId() {
    return id;
  }

  public void setId(String id) {
    this.id = id;
  }


  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }


  public String getWeixin() {
    return weixin;
  }

  public void setWeixin(String weixin) {
    this.weixin = weixin;
  }


  public String getPhoto() {
    return photo;
  }

  public void setPhoto(String photo) {
    this.photo = photo;
  }


  public String getPhonenumer() {
    return phonenumer;
  }

  public void setPhonenumer(String phonenumer) {
    this.phonenumer = phonenumer;
  }


  public String getLoginnumber() {
    return loginnumber;
  }

  public void setLoginnumber(String loginnumber) {
    this.loginnumber = loginnumber;
  }


  public String getPassword() {
    return password;
  }

  public void setPassword(String password) {
    this.password = password;
  }

}
