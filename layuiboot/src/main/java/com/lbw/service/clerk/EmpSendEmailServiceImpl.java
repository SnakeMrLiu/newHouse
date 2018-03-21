package com.lbw.service.clerk;

import com.lbw.mapper.clerk.EmpSendEmailMapper;
import com.lbw.utils.EmailUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

@Service
public class EmpSendEmailServiceImpl implements EmpSendEmailService {
    @Autowired
    private EmpSendEmailMapper empSendEmailMapper;

    /**
     *
     * @param eid
     * @param email_title
     * @param email_conten
     * @param imgUrls
     */
    @Override
    public void sendEmail(String eid, String email_title, String email_conten, String imgUrls) {
        List<File> list = new ArrayList<File>();
        String[] email_accessory = imgUrls.split(",");
        String getNameMail = empSendEmailMapper.getNameMail(eid);
        for (int i = 0; i <email_accessory.length ; i++) {
            File file = new File(email_accessory[i]);
            list.add(file);
        }
        EmailUtil.sendHtmlMailAndFile(getNameMail,email_title,email_conten,list);
    }
}
