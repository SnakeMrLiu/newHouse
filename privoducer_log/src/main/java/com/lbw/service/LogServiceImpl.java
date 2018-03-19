package com.lbw.service;

import com.alibaba.fastjson.JSON;
import com.lbw.mapper.LogMapper;
import com.lbw.pojo.LogBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class LogServiceImpl implements LogService {
    @Autowired
    private LogMapper logMapper;

    @Override
    public void logRecord(String log) {
        LogBean logBean = JSON.parseObject(log, LogBean.class);
        logMapper.logRecord(logBean);
    }

    @Override
    public List<LogBean> queryLog(Integer page, Integer rows) {
        page = (page - 1)*rows;
        return logMapper.queryLog(page,rows);
    }
}
