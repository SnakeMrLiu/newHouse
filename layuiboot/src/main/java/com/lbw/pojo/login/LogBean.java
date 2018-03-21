package com.lbw.pojo.login;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;
import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.Date;

@Document(collection = "layuiLog")
public class LogBean implements Serializable {
    @Id
    private String id;
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date logTime;

    private String eid;

    private String ip;

    private String funcName;

    private String ipAddress;

    private String requestInfo;

    private String responseInfo;

    public String getEid() {
        return eid;
    }

    public void setEid(String eid) {
        this.eid = eid;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getLogTime() {
        if(logTime == null){
            return null;
        }
        SimpleDateFormat s = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        return s.format(logTime);
    }

    public void setLogTime(Date logTime) {
        this.logTime = logTime;
    }

    public String getIp() {
        return ip;
    }

    public void setIp(String ip) {
        this.ip = ip;
    }

    public String getFuncName() {
        return funcName;
    }

    public void setFuncName(String funcName) {
        this.funcName = funcName;
    }

    public String getIpAddress() {
        return ipAddress;
    }

    public void setIpAddress(String ipAddress) {
        this.ipAddress = ipAddress;
    }

    public String getRequestInfo() {
        return requestInfo;
    }

    public void setRequestInfo(String requestInfo) {
        this.requestInfo = requestInfo;
    }

    public String getResponseInfo() {
        return responseInfo;
    }

    public void setResponseInfo(String responseInfo) {
        this.responseInfo = responseInfo;
    }

    @Override
    public String toString() {
        return "LogBean{" +
                "id='" + id + '\'' +
                ", logTime=" + logTime +
                ", eid='" + eid + '\'' +
                ", ip='" + ip + '\'' +
                ", funcName='" + funcName + '\'' +
                ", ipAddress='" + ipAddress + '\'' +
                ", requestInfo='" + requestInfo + '\'' +
                ", responseInfo='" + responseInfo + '\'' +
                '}';
    }
}
