package com.lbw.controller.log;

import com.lbw.pojo.login.LogBean;
import com.lbw.service.log.LogService;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public class LogHystric implements LogService {

    @Override
    public List<LogBean> queryLoginLog(Integer page, Integer rows) {
        System.out.println("短路了，速度解决问题！");
        return null;
    }
}
