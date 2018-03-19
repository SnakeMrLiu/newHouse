package com.lbw.controller.test;

import com.lbw.utils.clerk.ConBean;
import com.lbw.utils.test.CheckCodeTest;
import com.lbw.utils.test.HttpClient4Utils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

@RequestMapping(value = "test")
@Controller
public class TestController {
    @RequestMapping(value = "test")
    @ResponseBody
    public String test(String captchaId,String username,String password,String validate){
        Map<String,String> map = new HashMap<String,String>();
        map.put("captchaId",captchaId);
        map.put("validate",validate);
        map.put("user",username);
        map.put("secretId","eb9b6494ca22691ec850257ef5abf15d");
        map.put("version","v2");
        map.put("timestamp",System.currentTimeMillis() + "");
        map.put("nonce",new Random().nextInt() + "");
        String s = "";
        try {
            //获得签名信息
            String signature = CheckCodeTest.genSignature("8845bd566882b8f7ea1861c2b5ad613b", map);
            System.out.println(signature);
            map.put("signature",signature);
            s = HttpClient4Utils.sendPost(ConBean.CHECKCODE_URL, map);
            System.out.println(s);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return s;
    }

}
