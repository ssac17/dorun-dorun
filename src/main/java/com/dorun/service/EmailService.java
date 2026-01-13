package com.dorun.service;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;

@Service
public class EmailService {

    private static final Logger log = LoggerFactory.getLogger(EmailService.class);
    private final JavaMailSender mailSender;

    @Value("${mail.from}")
    private String fromAddress;

    public EmailService(JavaMailSender mailSender) {
        this.mailSender = mailSender;
    }

    @Async
    public void sendVerificationEmailAsync(String email, String code, String text) {
        try {
            SimpleMailMessage mail = new SimpleMailMessage();
            mail.setFrom(fromAddress);
            mail.setTo(email);
            mail.setSubject("[" + code + "] 이메일 인증 코드 - 두런두런");
            mail.setText(text);
            mailSender.send(mail);
        } catch (Exception e) {
            log.error("EmailService.sendVerificationEmailAsync email: {}, error {}", email, e.getMessage(), e);
        }
    }
}
