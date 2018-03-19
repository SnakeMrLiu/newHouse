package com.lbw.pojo.house;

import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;
import java.util.Date;

//卖房房源
public class SellHouseResource implements Serializable{

  private String id;//主键id

  private String eid;//员工表_主键id

  private String title;//标题

  private Integer price;//售价

  private Integer room;//室

  private Integer hall;//厅

  private Integer toilet;//卫

  private Double area;//面积

  private String community;//所属小区

  private Integer province;//所在位置省

  private Integer city;//所在位置市

  private Integer county;//所在位置县

  private Integer buildingTime;//建造年代

  private String roomType;//房屋类型

  private String roomDirection;//房屋方向

  private String floor;//所在楼层

  private String decorate;//装修程度

  private Double unitPrice;//参考单价

  private Double monthlyPayments;//参考月供

  private String sellingPoint;//核心卖点

  private String ownerMentality;//业主心态

  private String communityComplete;//小区配套

  private String serviceIntroduce;//服务介绍(富文本)

  private Date   releaseTime;//发布日期

  private String roomNum;//房屋编号

  private Integer minprice;//最小售价

  private Integer maxprice;//最大售价

  private Double minarea;//最小面积

  private Double maxarea;//最大面积

  public String getId() {
    return id;
  }

  public void setId(String id) {
    this.id = id;
  }

  public String getEid() {
    return eid;
  }

  public void setEid(String eid) {
    this.eid = eid;
  }

  public String getTitle() {
    return title;
  }

  public void setTitle(String title) {
    this.title = title;
  }

  public Integer getPrice() {
    return price;
  }

  public void setPrice(Integer price) {
    this.price = price;
  }

  public Integer getRoom() {
    return room;
  }

  public void setRoom(Integer room) {
    this.room = room;
  }

  public Integer getHall() {
    return hall;
  }

  public void setHall(Integer hall) {
    this.hall = hall;
  }

  public Integer getToilet() {
    return toilet;
  }

  public void setToilet(Integer toilet) {
    this.toilet = toilet;
  }

  public Double getArea() {
    return area;
  }

  public void setArea(Double area) {
    this.area = area;
  }

  public String getCommunity() {
    return community;
  }

  public void setCommunity(String community) {
    this.community = community;
  }

  public Integer getProvince() {
    return province;
  }

  public void setProvince(Integer province) {
    this.province = province;
  }

  public Integer getCity() {
    return city;
  }

  public void setCity(Integer city) {
    this.city = city;
  }

  public Integer getCounty() {
    return county;
  }

  public void setCounty(Integer county) {
    this.county = county;
  }

  public Integer getBuildingTime() {
    return buildingTime;
  }

  public void setBuildingTime(Integer buildingTime) {
    this.buildingTime = buildingTime;
  }

  public String getRoomType() {
    return roomType;
  }

  public void setRoomType(String roomType) {
    this.roomType = roomType;
  }

  public String getRoomDirection() {
    return roomDirection;
  }

  public void setRoomDirection(String roomDirection) {
    this.roomDirection = roomDirection;
  }

  public String getFloor() {
    return floor;
  }

  public void setFloor(String floor) {
    this.floor = floor;
  }

  public String getDecorate() {
    return decorate;
  }

  public void setDecorate(String decorate) {
    this.decorate = decorate;
  }

  public Double getUnitPrice() {
    return unitPrice;
  }

  public void setUnitPrice(Double unitPrice) {
    this.unitPrice = unitPrice;
  }

  public Double getMonthlyPayments() {
    return monthlyPayments;
  }

  public void setMonthlyPayments(Double monthlyPayments) {
    this.monthlyPayments = monthlyPayments;
  }

  public String getSellingPoint() {
    return sellingPoint;
  }

  public void setSellingPoint(String sellingPoint) {
    this.sellingPoint = sellingPoint;
  }

  public String getOwnerMentality() {
    return ownerMentality;
  }

  public void setOwnerMentality(String ownerMentality) {
    this.ownerMentality = ownerMentality;
  }

  public String getCommunityComplete() {
    return communityComplete;
  }

  public void setCommunityComplete(String communityComplete) {
    this.communityComplete = communityComplete;
  }

  public String getServiceIntroduce() {
    return serviceIntroduce;
  }

  public void setServiceIntroduce(String serviceIntroduce) {
    this.serviceIntroduce = serviceIntroduce;
  }

  public Date getReleaseTime() {
    return releaseTime;
  }

  public void setReleaseTime(Date releaseTime) {
    this.releaseTime = releaseTime;
  }

  public String getRoomNum() {
    return roomNum;
  }

  public void setRoomNum(String roomNum) {
    this.roomNum = roomNum;
  }

  public Integer getMinprice() {
    return minprice;
  }

  public void setMinprice(Integer minprice) {
    this.minprice = minprice;
  }

  public Integer getMaxprice() {
    return maxprice;
  }

  public void setMaxprice(Integer maxprice) {
    this.maxprice = maxprice;
  }

  public Double getMinarea() {
    return minarea;
  }

  public void setMinarea(Double minarea) {
    this.minarea = minarea;
  }

  public Double getMaxarea() {
    return maxarea;
  }

  public void setMaxarea(Double maxarea) {
    this.maxarea = maxarea;
  }
}
