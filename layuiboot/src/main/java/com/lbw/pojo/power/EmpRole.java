package com.lbw.pojo.power;

/**
 * 员工角色关联表
 */
public class EmpRole {

  private String id;//主键id
  private String userId;//员工id
  private String roleId;//角色id


  public String getId() {
    return id;
  }

  public void setId(String id) {
    this.id = id;
  }


  public String getUserId() {
    return userId;
  }

  public void setUserId(String userId) {
    this.userId = userId;
  }


  public String getRoleId() {
    return roleId;
  }

  public void setRoleId(String roleId) {
    this.roleId = roleId;
  }

  @Override
  public String toString() {
    return "EmpRole{" +
            "id='" + id + '\'' +
            ", userId='" + userId + '\'' +
            ", roleId='" + roleId + '\'' +
            '}';
  }
}
