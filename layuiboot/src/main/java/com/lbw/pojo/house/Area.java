package com.lbw.pojo.house;

import java.io.Serializable;

//省市县
public class Area implements Serializable{

  private Integer id;
  /**
   * 名称
   */
  private String name;
  /**
   * 父id
   */
  private Integer pid;

  public Integer getId() {
    return id;
  }

  public void setId(Integer id) {
    this.id = id;
  }

  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }

  public Integer getPid() {
    return pid;
  }

  public void setPid(Integer pid) {
    this.pid = pid;
  }

  @Override
  public String toString() {
    return "Area{" +
            "id=" + id +
            ", name='" + name + '\'' +
            ", pid=" + pid +
            '}';
  }
}
