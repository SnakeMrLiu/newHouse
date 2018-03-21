package com.lbw.pojo.announcement;

import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * 公告表
 */
public class Announcement implements Serializable{
  /**
   * 主键id
   */
  private String id;
  /**
   * 公告标题
   */
  private String title;
  /**
   * 公告内容
   */
  private String content;
  /**
   * 发布人id
   */
  private String eid;

  /**
   * 发布人名称
   *
   */
  private String ename;
  /**
   * 发布状态
   * 1、待审核
   * 2、成功
   * 3、失败
   */
  private Integer status;
  @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
  private Date time;

  public String getId() {
    return id;
  }

  public void setId(String id) {
    this.id = id;
  }

  public String getTitle() {
    return title;
  }

  public void setTitle(String title) {
    this.title = title;
  }

  public String getContent() {
    return content;
  }

  public void setContent(String content) {
    this.content = content;
  }

  public String getEid() {
    return eid;
  }

  public void setEid(String eid) {
    this.eid = eid;
  }

  public Integer getStatus() {
    return status;
  }

  public void setStatus(Integer status) {
    this.status = status;
  }

  public String getTime() {
    if(time == null){
      return null;
    }
    SimpleDateFormat s = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    return s.format(time);
  }

  public void setTime(Date time) {
    this.time = time;
  }

  public String getEname() {
    return ename;
  }

  public void setEname(String ename) {
    this.ename = ename;
  }

  @Override
  public String toString() {
    return "Announcement{" +
            "id='" + id + '\'' +
            ", title='" + title + '\'' +
            ", content='" + content + '\'' +
            ", eid='" + eid + '\'' +
            ", ename='" + ename + '\'' +
            ", status=" + status +
            ", time=" + time +
            '}';
  }
}
