package com.lbw.service.clerk;

public interface EmpSendEmailService {

    void sendEmail(String eid, String email_title, String email_conten, String imgUrls);
}
