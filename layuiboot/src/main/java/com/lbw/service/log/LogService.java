package com.lbw.service.log;

import com.lbw.controller.log.LogHystric;
import com.lbw.pojo.login.LogBean;
import org.springframework.cloud.netflix.feign.FeignClient;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Service
@FeignClient(value = "privoducerlog",fallback = LogHystric.class)
public interface LogService {

    @RequestMapping(value = "/log/queryLog")
    List<LogBean> queryLoginLog(@RequestParam(value = "page") Integer page, @RequestParam(value = "rows") Integer rows);
}
