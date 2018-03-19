package com.lbw.controller.log;

import com.alibaba.fastjson.JSONObject;
import com.lbw.pojo.login.LogBean;
import com.lbw.service.log.LogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping(value = "log")
public class LogController {
    @Autowired
    private LogService logService;
    @Autowired
    private MongoTemplate mongoTemplate;

    @RequestMapping(value = "queryLoginLog")
    @ResponseBody
    public String queryLoginLog(Integer page, Integer number){
        List<LogBean> logBeans = logService.queryLoginLog(page, number);
        //分页查询员工信息
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("code", 0);
        jsonObject.put("msg", "");
        jsonObject.put("count", mongoTemplate.count(new Query(),"layuiLog"));
        jsonObject.put("data", logBeans);
        return jsonObject.toString();
    }

    @RequestMapping(value = "toLogPage")
    public String toLogPage(){
        return "log/logPage";
    }
}
