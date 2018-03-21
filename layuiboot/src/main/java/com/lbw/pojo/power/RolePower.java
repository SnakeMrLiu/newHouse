package com.lbw.pojo.power;

/**
 * 角色权限表
 */
public class RolePower {

  private String id;
  private String roleId;//角色id
  private String treeId;//权限树id


  public String getId() {
    return id;
  }

  public void setId(String id) {
    this.id = id;
  }


  public String getRoleId() {
    return roleId;
  }

  public void setRoleId(String roleId) {
    this.roleId = roleId;
  }


  public String getTreeId() {
    return treeId;
  }

  public void setTreeId(String treeId) {
    this.treeId = treeId;
  }

  @Override
  public String toString() {
    return "RolePower{" +
            "id='" + id + '\'' +
            ", roleId='" + roleId + '\'' +
            ", treeId='" + treeId + '\'' +
            '}';
  }
}
