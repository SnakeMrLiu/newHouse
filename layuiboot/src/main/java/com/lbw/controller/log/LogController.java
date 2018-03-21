package com.lbw.controller.log;

import com.alibaba.fastjson.JSONObject;
import com.lbw.pojo.login.LogBean;
import com.lbw.pojo.sellhouse.Emp;
import com.lbw.service.log.LogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
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

    @RequestMapping(value = "myLogInfoPage")
    public String myLogInfoPage(){
        return "log/myLogInfo";
    }
    /**
     * 查看我的日志
     */
    @RequestMapping(value = "queryMyLogInfo")
    @ResponseBody
    public  String queryMyLogInfo(Integer page, Integer number, HttpServletRequest request){
        HttpSession session = request.getSession();
        Emp emp = (Emp) session.getAttribute(session.getId());
        Query query = new Query(Criteria.where("eid").is(emp.getId()));
        query.skip((page - 1)*number).limit(number);
        List<LogBean> layuiLog = mongoTemplate.find(query, LogBean.class, "layuiLog");
        long count = mongoTemplate.count(new Query(Criteria.where("eid").is(emp.getId())),"layuiLog");
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("code", 0);
        jsonObject.put("msg", "");
        jsonObject.put("count", count);
        jsonObject.put("data", layuiLog);
        return jsonObject.toString();
    }
}
