package com.lbw.controller.clerk;
import com.lbw.service.clerk.EmpSendEmailService;
import com.lbw.utils.ConstantsBean;
import com.lbw.utils.FileUtil;
import com.lbw.utils.OssClienUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping(value = "empSendEmailInfo")
public class EmpSendEmailController {
    private List<String> urls = new ArrayList<String>();

    @Autowired
    private EmpSendEmailService empSendEmailService;

    /**
     *  跳转邮件发送页面
     */
    @RequestMapping("toSendEmailPage")
    public String toSendEmailPage(String eid, Model model){
        model.addAttribute("eid",eid);
        return "emp/sendMail";
    }

    @RequestMapping(value = "emailSend")
    @ResponseBody
    public Map<String ,Object> emailSend(String eid, String email_title, String email_conten){
        Map<String ,Object> map = new HashMap<String ,Object>();
        String imgUrls = "";
        for (String url : urls) {
            imgUrls += "," + url;
        }
        imgUrls = imgUrls.substring(1);
        try {
            empSendEmailService.sendEmail(eid,email_title,email_conten,imgUrls);
            map.put("success",true);
            urls.clear();
        }catch (Exception e){
            e.printStackTrace();
            map.put("success",false);
        }
        return map;
    }

    @RequestMapping(value = "emailImgUpload",method = RequestMethod.POST)
    @ResponseBody
    public String emailImgUpload(HttpServletRequest request, MultipartFile file)throws Exception{
        String s = FileUtil.upFile(file, ConstantsBean.IMG_PATH);
        System.out.println(ConstantsBean.IMG_PATH + s);
        urls.add(ConstantsBean.IMG_PATH + s);
        return ConstantsBean.IMG_PATH + s;
    }


}
