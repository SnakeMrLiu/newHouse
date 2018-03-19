package com.lbw.mapper;

import com.lbw.pojo.LogBean;

import java.util.List;


public interface LogMapper {


    void logRecord(LogBean logBean);

    List<LogBean> queryLog(Integer page, Integer rows);
}
