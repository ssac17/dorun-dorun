package spring.legacy.service;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;
import spring.legacy.mapper.AccountMapper;

import java.security.SecureRandom;

@Service
public class AccountService {

    private final String CODE_STR = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
    private final String CODE_NUMBER = "0123456789";

    private final AccountMapper accountMapper;
    private final JavaMailSender mailSender;
    private final SecureRandom random = new SecureRandom();

    public AccountService(AccountMapper accountMapper, JavaMailSender mailSender) {
        this.accountMapper = accountMapper;
        this.mailSender = mailSender;
    }

    public boolean isEmailExists(String email) {
        boolean emailExists = accountMapper.isEmailExists(email);
        return emailExists;
    }

    @Value("${mail.from}")
    private String fromAddress;

    public boolean sendVerificationEmail(String email) {
        String code = generateVerificationCode();
        try {
            SimpleMailMessage mail = new SimpleMailMessage();
            mail.setFrom(fromAddress);
            mail.setTo(email);
            mail.setSubject("[" + code + "] 이메일 인증 코드 - 두런두런");
            mail.setText(mailContent(code));
            mailSender.send(mail);
            return true;
        }catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }

    private String generateVerificationCode() {
        String str = CODE_STR;
        String number = CODE_NUMBER;
        StringBuilder sb = new StringBuilder(6);
        // 숫자 3자리
        for (int i = 0; i < 3; i++) {
            int idx = random.nextInt(number.length());
            sb.append(number.charAt(idx));
        }
        // 문자 3자리
        for (int i = 0; i < 3; i++) {
            int idx = random.nextInt(str.length());
            sb.append(str.charAt(idx));
        }
        // 섞기
        char[] code = sb.toString().toCharArray();
        for (int i = code.length - 1; i > 0; i--) {
            int j = random.nextInt(i + 1);
            char tmp = code[i];
            code[i] = code[j];
            code[j] = tmp;
        }
        return new String(code);
    }

    private String mailContent(String code) {
        return """
                안녕하세요, 두런두런 입니다.
                아래 요청하신 이메일 인증 코드 안내드립니다.
               
                인증코드: %s
               
                해당 코드를 회원가입 페이지에 입력해 주세요.
                
                """.formatted(code);
    }
}
