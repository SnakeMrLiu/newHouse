package com.lbw.service.clerk;

import com.lbw.mapper.clerk.UserLoginMapper;
import com.lbw.pojo.sellhouse.Emp;
import com.lbw.utils.clerk.ConBean;
import com.lbw.utils.clerk.HttpClient;
import com.lbw.utils.clerk.Md5Util;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.util.HashMap;
import java.util.concurrent.TimeUnit;

@Service
public class UserLoginServiceImpl implements UserLoginService{

    @Autowired
    private RedisTemplate<String,String> redisTemplate;

    @Autowired
    private UserLoginMapper userLoginMapper;

    /**
     * 手机短信登录
     * @param loginnumber
     * @param verification
     * @return
     */
    @Override
    public Emp getUserNumber(String loginnumber, String verification) {
        Emp emp = userLoginMapper.getUserNumber(loginnumber);
        if (emp != null && redisTemplate.opsForValue().get(loginnumber+"checkcode")!=null) {
            if (verification.equals(redisTemplate.opsForValue().get(loginnumber+"checkcode"))){
                redisTemplate.delete(emp.getLoginnumber()+"checkcode");
                return emp;
            }
        }else{
            return emp;
        }
        return null;
    }


    /**
     * 生成6位随机数切调用 切查询用户手机号
     * @param loginnumber
     * @return
     * @throws IOException
     */
    public Integer getInterfaceSmS(String loginnumber) throws IOException {
        Emp empSmS = userLoginMapper.getUserNumber(loginnumber);
        if (empSmS != null){
            int random = (int) ((Math.random()*9+1)*100000);
            //sendSMS(loginnumber,random);
            redisTemplate.opsForValue().set(loginnumber+"checkcode",random+"",5, TimeUnit.MINUTES);
            System.out.println(redisTemplate.opsForValue().get(loginnumber+"checkcode"));
            return 1;
        }else {
            return 2;
        }
    }

    /**
     * 通过 md5 + HTTPclient 调用短信接口
     * @param args
     * @param random
     * @throws IOException
     */
    public static void sendSMS(String args, Integer random) throws IOException {
        HashMap<String, Object> params = new HashMap<String, Object>();
        params.put("accountSid", ConBean.SMS_selfID);
        params.put("templateid",ConBean.SMS_mobanId);
        params.put("param",random+",5");
        params.put("to",args);
        params.put("timestamp", ConBean.SMS_Time);
        params.put("sig", Md5Util.getMd532(params.get("accountSid").toString()+ConBean.SMS_PSD+params.get("timestamp").toString()));
        HttpClient.post(ConBean.SMS_URL, params);
    }




}
