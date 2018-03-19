package com.lbw.controller.clerk;

import com.lbw.pojo.login.LogBean;
import com.lbw.pojo.sellhouse.Emp;
import com.lbw.readDat.IPSeeker;
import com.lbw.service.clerk.UserLoginService;
import com.lbw.utils.IpUtil;
import com.lbw.utils.PoolThread;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

@Controller
@RequestMapping(value = "login")
public class UserLoginController {
    @Autowired
    private UserLoginService userLoginService;

    /**
     * 注消
     */
    @RequestMapping(value = "logoutEmp")
    public void logoutEmp(HttpServletRequest request){
        HttpSession session = request.getSession();
        session.removeAttribute(session.getId());
    }

    /**
     * 我就跳一下
     */
    @RequestMapping(value = "toLoginPage")
    public String toLoginPage (){
        return "login";
    }

    /**
     *  手机号短信验证码 判断验证登录
     * @param loginnumber
     * @param verification
     * @param
     * @return
     */
    @RequestMapping(value = "userLoginMethod")
    @ResponseBody
    public Map<String  ,Object> userLoginMethod(String loginnumber, String verification, HttpServletRequest request){
        Map<String,Object> map = new HashMap<String ,Object>();
        LogBean logBean = new LogBean();
        HttpSession session = request.getSession();
        Emp emp = userLoginService.getUserNumber(loginnumber,verification);
        String ipAddr = IpUtil.getIpAddr(request);
        logBean.setIp(ipAddr);
        IPSeeker ipSeeker = IPSeeker.getInstance();
        String address = ipSeeker.getAddress(ipAddr);
        logBean.setIpAddress(address);
        try {
            if (emp != null){
                session.setAttribute(session.getId(),emp);
                session.setAttribute("emp",emp);
                map.put("success",true);
                logBean.setResponseInfo("success");
                logBean.setRequestInfo("手机号"+loginnumber+"，验证码"+verification);
                logBean.setLogTime(new Date());
                logBean.setFuncName("userLoginMethod");
                logBean.setId(UUID.randomUUID().toString().replace("-",""));
            }else {
                map.put("success",false);
                map.put("messager","用户不存在");
                logBean.setResponseInfo("false");
                logBean.setRequestInfo("手机号"+loginnumber+"验证码"+verification);
                logBean.setLogTime(new Date());
                logBean.setFuncName("userLoginMethod");
                logBean.setId(UUID.randomUUID().toString().replace("-",""));
            }
        }catch (Exception e){
            e.printStackTrace();
            map.put("success",false);
        }
        PoolThread.fixedThread(new LoginTreadPool(userLoginService,logBean));
        return map;
    }



    /**
     * 短信接口调用
     */
    @RequestMapping(value = "getInterfaceSMS")
    @ResponseBody
    public Map<String  ,Object> getInterfaceSMS(String loginnumber){
        Map<String  ,Object> map = new HashMap<String,Object>();
        try {
            Integer  state =  userLoginService.getInterfaceSmS(loginnumber);
            map.put("success",state);
        }catch (Exception e){
            e.printStackTrace();
            map.put("success",3);
        }

        return map;
    }

}
