package com.dorun.service;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import com.dorun.dto.AccountDto;
import com.dorun.mapper.AccountMapper;
import com.dorun.mapper.EmailMapper;

import java.security.SecureRandom;

@Service
public class AccountService {

    private final String CODE_STR = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
    private final String CODE_NUMBER = "0123456789";

    private final EmailService emailService;
    private final AccountMapper accountMapper;
    private final EmailMapper emailMapper;
    private final PasswordEncoder passwordEncoder;
    private final SecureRandom random = new SecureRandom();

    public AccountService(EmailService emailService, AccountMapper accountMapper, EmailMapper emailMapper, PasswordEncoder passwordEncoder) {
        this.emailService = emailService;
        this.accountMapper = accountMapper;
        this.emailMapper = emailMapper;
        this.passwordEncoder = passwordEncoder;
    }

    public boolean isEmailExists(String email) {
        boolean emailExists = accountMapper.isEmailExists(email);
        return emailExists;
    }

    @Value("${mail.from}")
    private String fromAddress;

    public boolean sendVerificationEmail(String email) {
        String code = generateVerificationCode();
        System.out.println("code: " + code);
        int savedCount = emailMapper.savedVerificationCode(email, code);
        if(savedCount == 0) {
            throw new IllegalStateException("이메일 인증 코드 저장에 실패했습니다.");
        }

        emailService.sendVerificationEmailAsync(email, code, mailContent(code));
        return true;
    }

    public String verifyEmailCode(String email, String code) {
        int existedCode = emailMapper.existsEmailCode(email, code);
        if(existedCode == 0) {
            return "인증코드가 올바르지 않습니다. 다시 확인해 주세요.";
        }
        int validCode = emailMapper.expiresAtEmailCode(email, code);
        if(validCode == 0) {
            return "인증코드의 기한이 만료되었습니다. 다시 발급해 주세요.";
        }
        return "인증되었습니다!";
    }

    public AccountDto findByEmail(String email) {
        return accountMapper.findByEmail(email);
    }

    public int register(AccountDto accountDto) {
        accountDto.setPassword(passwordEncoder.encode(accountDto.getPassword()));
        return accountMapper.insertAccount(accountDto);
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
