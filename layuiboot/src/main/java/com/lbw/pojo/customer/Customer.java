package com.lbw.pojo.customer;


import org.springframework.format.annotation.DateTimeFormat;

import java.text.SimpleDateFormat;
import java.util.Date;

public class Customer {

  private String id;
  private String cid;//员工关联id
  private String customerName;//客户姓名
  private String customerPhone;//客户电话
  private String customerAge;//客户年龄
  @DateTimeFormat(pattern = "yyyy-MM-dd")
  private Date orderTime;//预约时间
  private long orderNum;//预约次数
  private String orderHouse;//预约房源
  @DateTimeFormat(pattern = "yyyy-MM-dd")
  private Date maxTime;
  @DateTimeFormat(pattern = "yyyy-MM-dd")
  private Date minTime ;

  private String name;
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

  public String getOrderTime() {
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    if (orderTime == null){
      return null;
    }
    return sdf.format(orderTime);
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


  public Date getMaxTime() {
    return maxTime;
  }

  public void setMaxTime(Date maxTime) {
    this.maxTime = maxTime;
  }

  public Date getMinTime() {
    return minTime;
  }

  public void setMinTime(Date minTime) {
    this.minTime = minTime;
  }

  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }
}