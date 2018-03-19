package com.lbw.service;

import com.lbw.pojo.LogBean;

import java.util.List;

public interface LogService {
    void logRecord(String log);

    List<LogBean> queryLog(Integer page, Integer rows);
}
