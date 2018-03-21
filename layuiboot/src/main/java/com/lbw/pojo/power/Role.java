package com.lbw.pojo.power;

/**
 * 角色表
 */
public class Role {

  private String id;//主键ID
  private String name;//角色名称



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

  @Override
  public String toString() {
    return "Role{" +
            "id='" + id + '\'' +
            ", name='" + name + '\'' +
            '}';
  }
}
