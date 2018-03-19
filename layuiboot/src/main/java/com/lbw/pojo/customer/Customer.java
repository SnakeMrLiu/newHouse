package com.lbw.pojo.customer;


import java.util.Date;

public class Customer {

  private String id;
  private String cid;//员工关联id
  private String customerName;//客户姓名
  private String customerPhone;//客户电话
  private String customerAge;//客户年龄
  private Date orderTime;//预约时间
  private long orderNum;//预约次数
  private String orderHouse;//预约房源

  public String getId() {
    return id;
  }

  public void setId(String id) {
    this.id = id;
  }

  public String getCid() {
    return cid;
  }

  public void setCid(String cid) {
    this.cid = cid;
  }

  public String getCustomerName() {
    return customerName;
  }

  public void setCustomerName(String customerName) {
    this.customerName = customerName;
  }

  public String getCustomerPhone() {
    return customerPhone;
  }

  public void setCustomerPhone(String customerPhone) {
    this.customerPhone = customerPhone;
  }

  public String getCustomerAge() {
    return customerAge;
  }

  public void setCustomerAge(String customerAge) {
    this.customerAge = customerAge;
  }

  public Date getOrderTime() {
    return orderTime;
  }

  public void setOrderTime(Date orderTime) {
    this.orderTime = orderTime;
  }

  public long getOrderNum() {
    return orderNum;
  }

  public void setOrderNum(long orderNum) {
    this.orderNum = orderNum;
  }

  public String getOrderHouse() {
    return orderHouse;
  }

  public void setOrderHouse(String orderHouse) {
    this.orderHouse = orderHouse;
  }

  @Override
  public String toString() {
    return "Customer{" +
            "id='" + id + '\'' +
            ", cid='" + cid + '\'' +
            ", customerName='" + customerName + '\'' +
            ", customerPhone='" + customerPhone + '\'' +
            ", customerAge='" + customerAge + '\'' +
            ", orderTime=" + orderTime +
            ", orderNum=" + orderNum +
            ", orderHouse='" + orderHouse + '\'' +
            '}';
  }
}