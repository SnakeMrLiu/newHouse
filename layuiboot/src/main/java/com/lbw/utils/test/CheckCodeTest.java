package com.lbw.utils.test;

import org.apache.commons.codec.digest.DigestUtils;

import java.io.UnsupportedEncodingException;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

public class CheckCodeTest {
    /**
     * 生成签名信息
     * @param secretKey 产品私钥
     * @param params 接口请求参数名和参数值map，不包括signature参数名
     * @return
     */
    public static String genSignature(String secretKey, Map<String, String> params) throws UnsupportedEncodingException {
        // 1. 参数名按照ASCII码表升序排序
        String[] keys = params.keySet().toArray(new String[0]);
        Arrays.sort(keys);

        // 2. 按照排序拼接参数名与参数值
        StringBuilder sb = new StringBuilder();
        for (String key : keys) {
            sb.append(key).append(params.get(key));
        }
        // 3. 将secretKey拼接到最后
        sb.append(secretKey);

        // 4. MD5是128位长度的摘要算法，转换为十六进制之后长度为32字符
        return DigestUtils.md5Hex(sb.toString().getBytes("UTF-8"));
    }

    public static void main(String[] args) {
        Map<String,String> map = new HashMap<String,String>();
        map.put("captchaId", UUID.randomUUID().toString().replace("-",""));
        map.put("captchaId", UUID.randomUUID().toString().replace("-",""));
        try {
            genSignature("127425",map);
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
    }
}
