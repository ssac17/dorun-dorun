package spring.legacy.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
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
    public Map<String, Boolean> sendEmailCode(@RequestParam("email") String email) {
        System.out.println("들어온 이메일 : " + email);
        boolean result = accountService.sendVerificationEmail(email);
        return Map.of("status", result);
    }
}