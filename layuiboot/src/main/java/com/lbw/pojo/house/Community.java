package com.lbw.pojo.house;

//小区表
public class Community {

  private String id;//主键id
  private long aid;//省市县主键id
  private String name;//小区名称


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

  public long getAid() {
    return aid;
  }

  public void setAid(long aid) {
    this.aid = aid;
  }
}
