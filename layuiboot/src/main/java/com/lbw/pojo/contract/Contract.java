package com.lbw.pojo.contract;
import org.springframework.format.annotation.DateTimeFormat;
import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Contract implements Serializable{

  private String id;
  private String eid;//建合同的员工ID
  private String sid;//所出租房的id
  private String numberserial;//合同编号
  private String lessor;//出租方
  private String tenantry;//承租方
  @DateTimeFormat(pattern = "yyyy-MM-dd")
  private Date starttime;//租房开始
  @DateTimeFormat(pattern = "yyyy-MM-dd")
  private Date endtime;//租房结束
  private long payment;//付款方式（1，支付宝2，微信，3，转账）
  private long installment;//分期方式（1，一次性付款一年，2，半年一付，3，一个季度，4，三个季度一付）
  private long timelimit;//几日内完成付款，单位天数
  @DateTimeFormat(pattern = "yyyy-MM-dd")
  private Date createtime;//建合同时间
  private Double thefigure;//付款金额
  private Double dedit;//违约金
  private Double rentMath;//每月租金  别名
  private Integer yueNum;//租多少月   别名
  private String timeOut;//每几个月一交
  private String a;//大写钱转换违约金
  private String b;//付款金额
  private String c;

  public String getA() {
    return a;
  }

  public void setA(String a) {
    this.a = a;
  }

  public String getTimeOut() {
    return timeOut;
  }

  public void setTimeOut(String timeOut) {
    this.timeOut = timeOut;
  }

  public Integer getYueNum() {
    return yueNum;
  }

  public void setYueNum(Integer yueNum) {
    this.yueNum = yueNum;
  }

  public Double getRentMath() {
    return rentMath;
  }

  public void setRentMath(Double rentMath) {
    this.rentMath = rentMath;
  }

  public Double getDedit() {
    return dedit;
  }

  public void setDedit(Double dedit) {
    this.dedit = dedit;
  }

  public String getCreatetime() {
    SimpleDateFormat sim = new SimpleDateFormat("yyyy-MM-dd");
    if(createtime==null){
      return null;
    }
    return sim.format(createtime);
  }

  public void setCreatetime(Date createtime) {
    this.createtime = createtime;
  }

  public Double getThefigure() {
    return thefigure;
  }

  public void setThefigure(Double thefigure) {
    this.thefigure = thefigure;
  }

  public String getStarttime() {
    SimpleDateFormat sim = new SimpleDateFormat("yyyy-MM-dd");
    if(starttime==null){
      return null;
    }
    return sim.format(starttime);
  }

  public void setStarttime(Date starttime) {
    this.starttime = starttime;
  }

  public String getEndtime() {
    SimpleDateFormat sim = new SimpleDateFormat("yyyy-MM-dd");
    if(starttime==null){
      return null;
    }
    return sim.format(endtime);
  }

  public void setEndtime(Date endtime) {
    this.endtime = endtime;
  }

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

  public String getNumberserial() {
    return numberserial;
  }

  public void setNumberserial(String numberserial) {
    this.numberserial = numberserial;
  }

  public String getLessor() {
    return lessor;
  }

  public void setLessor(String lessor) {
    this.lessor = lessor;
  }

  public String getTenantry() {
    return tenantry;
  }

  public void setTenantry(String tenantry) {
    this.tenantry = tenantry;
  }

  public long getPayment() {
    return payment;
  }

  public void setPayment(long payment) {
    this.payment = payment;
  }

  public long getInstallment() {
    return installment;
  }

  public void setInstallment(long installment) {
    this.installment = installment;
  }

  public long getTimelimit() {
    return timelimit;
  }

  public void setTimelimit(long timelimit) {
    this.timelimit = timelimit;
  }

  public String getSid() {
    return sid;
  }

  public void setSid(String sid) {
    this.sid = sid;
  }

  public String getB() {
    return b;
  }

  public void setB(String b) {
    this.b = b;
  }

  public String getC() {
    return c;
  }

  public void setC(String c) {
    this.c = c;
  }
}
