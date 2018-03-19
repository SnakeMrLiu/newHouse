package com.lbw.controller;

import com.lbw.common.ConstantStatus;
import com.lbw.pojo.LogBean;
import com.lbw.pojo.ResultBean;
import com.lbw.service.LogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.cloud.context.config.annotation.RefreshScope;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping(value = "log")
@RefreshScope
public class LogController {

    @Autowired
    private LogService logService;

    @Value("${from}")
    private String from;

    @RequestMapping(value = "from")
    public String from(){
        return from;
    }

    @RequestMapping(value = "logRecord")
    public boolean logRecord(@RequestParam String log){
        try {
            logService.logRecord(log);
            return true;
        }catch (Exception e){
            e.printStackTrace();
        }
        return false;
    }

    @RequestMapping(value = "queryLog")
    public List<LogBean> queryLog(@RequestParam(value = "page") Integer page,@RequestParam(value = "rows") Integer rows){
        ResultBean resultBean = new ResultBean();
        List<LogBean> logBeans = logService.queryLog(page, rows);
        try {
            //resultBean.setCode(ConstantStatus.SUCCESSS);
            //resultBean.setMsg("查询成功");
            //resultBean.setData(logBeans);
        }catch (Exception e){
            //resultBean.setCode(ConstantStatus.ERROR);
            //resultBean.setMsg(e.getMessage());
        }
        return logBeans;
    }
}
