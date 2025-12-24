package spring.legacy.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import spring.legacy.dto.AccountDto;
import spring.legacy.service.AccountService;

import java.util.Map;

@Controller
@RequestMapping("/account")
public class AccountController {

    private final AccountService accountService;

    public AccountController(AccountService accountService) {
        this.accountService = accountService;
    }

    @PostMapping("/check-email")
    @ResponseBody
    public Map<String, Boolean> checkEmail(@RequestParam("email") String email) {
        return Map.of("exists", accountService.isEmailExists(email));
    }

    @GetMapping("sign-up")
    public String signUpPage(@RequestParam("email") String email, Model model) {
        model.addAttribute("email", email);
        return "account/signUp";
    }

    @PostMapping("/send-code")
    @ResponseBody
    public Map<String, Object> sendEmailCode(@RequestParam("email") String email) {
        boolean result = accountService.sendVerificationEmail(email);
        String message = result ? "이메일이 발송되었습니다!" : "이메일 발송이 실패하였습니다..";
        return Map.of(
                "status", result,
                "message", message
        );
    }

    @PostMapping("/verify-code")
    @ResponseBody
    public Map<String, Object> verifyEmailCode(@RequestParam("email") String email, @RequestParam("code") String code) {
        String message = accountService.verifyEmailCode(email, code);
        boolean status = message.equals("인증되었습니다!");
        return Map.of("status", status, "message", message);
    }

    @PostMapping("/sign-up")
    public String signUp(AccountDto accountDto) {
        System.out.println(accountDto);
        int result = accountService.register(accountDto);
        System.out.println("result " + result);
        return "";
    }

}