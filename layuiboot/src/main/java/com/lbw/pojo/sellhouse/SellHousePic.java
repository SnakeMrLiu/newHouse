package com.lbw.pojo.sellhouse;

//卖方房源图片表
public class SellHousePic {

  private String id;//主键id
  private String sid;//卖房房_主键id
  private String url;//图片地址
  private long imgtype;//图片类型(1:室内图，2:户型图，3:环境图)


  public String getId() {
    return id;
  }

  public void setId(String id) {
    this.id = id;
  }


  public String getUrl() {
    return url;
  }

  public void setUrl(String url) {
    this.url = url;
  }

  public long getImgtype() {
    return imgtype;
  }

  public void setImgtype(long imgtype) {
    this.imgtype = imgtype;
  }

  public String getSid() {
    return sid;
  }

  public void setSid(String sid) {
    this.sid = sid;
  }
}
