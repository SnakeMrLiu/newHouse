package com.lbw.utils;

import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;

import javax.mail.internet.MimeMessage;
import java.io.File;
import java.util.List;
import java.util.Properties;

public class EmailUtil {

    private static JavaMailSenderImpl mailSender = createMailSender();
    /**
     * 邮件发送器
     *
     * @return 配置好的工具
     */
    private static JavaMailSenderImpl createMailSender() {
        JavaMailSenderImpl sender = new JavaMailSenderImpl();
        sender.setHost(ConBean.HOST);
        sender.setPort(ConBean.PORT);
        sender.setUsername(ConBean.USERNAME);
        sender.setPassword(ConBean.PASSWORD);
        sender.setDefaultEncoding("Utf-8");
        Properties p = new Properties();
        p.setProperty("mail.smtp.timeout", "25000");
        p.setProperty("mail.smtp.auth", "true");
        sender.setJavaMailProperties(p);
        return sender;
    }

    /**
     * 发送邮件
     *
     * @param to 接受人
     * @param subject 主题
     * @param html 发送内容
     */
    public static void sendHtmlMail(String to, String subject, String html)  {
        MimeMessage mimeMessage = mailSender.createMimeMessage();
        // 设置utf-8或GBK编码，否则邮件会有乱码
        MimeMessageHelper messageHelper = null;
        try {
            messageHelper = new MimeMessageHelper(mimeMessage, true, "UTF-8");
            messageHelper.setFrom(ConBean.EMAILFORM, ConBean.USERNAME);
            messageHelper.setTo(to);
            messageHelper.setSubject(subject);
            messageHelper.setText(html, true);
            mailSender.send(mimeMessage);
        } catch (Exception e) {
            e.printStackTrace();
        }

    }
    /**
     * 发送邮件
     *@param list 文件
     * @param to 接受人
     * @param subject 主题
     * @param html 发送内容
     */
    public static void sendHtmlMailAndFile(String to, String subject, String html, List<File> list)  {
        MimeMessage mimeMessage = mailSender.createMimeMessage();
        // 设置utf-8或GBK编码，否则邮件会有乱码
        MimeMessageHelper messageHelper = null;
        try {
            messageHelper = new MimeMessageHelper(mimeMessage, true, "UTF-8");
            messageHelper.setFrom(ConBean.EMAILFORM, ConBean.USERNAME);
            messageHelper.setTo(to);
            messageHelper.setSubject(subject);
            messageHelper.setText(html, true);
            for (File file : list) {
                messageHelper.addAttachment(file.getName(),file);
            }
            mailSender.send(mimeMessage);
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    /**
     * 测试
     * @param args
     */
    public static void main(String[] args) {
        sendHtmlMail("maozefeng0203@126.com","测试","666666");
    }
}

