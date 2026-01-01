package spring.legacy.controller;

import jakarta.validation.Valid;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
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
        if(email == null || email.trim().isEmpty()) {
            return Map.of("exists", false);
        }
        System.out.println(email);
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
        boolean exists = accountService.isEmailExists(email);
        if(exists) {
            return Map.of("status", false,
            "message", "중복된 메일이 존재합니다.");
        }
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
    public String signUp(@Valid AccountDto accountDto, BindingResult bindingResult, Model model, RedirectAttributes redirectAttr) {
        if(bindingResult.hasErrors()) {
            bindingResult.getFieldErrors().forEach(error -> {
                model.addAttribute(error.getField() + "Error", error.getDefaultMessage());
            });
            model.addAttribute("accountDto", accountDto);
            return "account/signUp";
        }

        int result = accountService.register(accountDto);
        if(result > 0) {
            redirectAttr.addFlashAttribute("message", "회원가입이 완료 되었습니다!");
        }`
        return "redirect:/";
    }
}