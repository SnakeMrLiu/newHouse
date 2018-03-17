package com.lbw.pojo.sellhouse;

//省市县
public class Area {

  private Integer id;//主键id

  private Integer pid;

  private String name;

  public Integer getId() {
    return id;
  }

  public void setId(Integer id) {
    this.id = id;
  }

  public Integer getPid() {
    return pid;
  }

  public void setPid(Integer pid) {
    this.pid = pid;
  }

  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }
}
