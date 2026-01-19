package com.dorun.controller;

import com.dorun.dto.PostRequestDto;
import com.dorun.service.PostService;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/post")
public class PostController {

    private final PostService postService;

    public PostController(PostService postService) {
        this.postService = postService;
    }

    @GetMapping("/write")
    public String postWritePage() {
        return "/post/write";
    }

    @PostMapping("/write")
    public String postWrite(@ModelAttribute PostRequestDto dto, Authentication authentication, RedirectAttributes redirectAttributes) {
        UserDetails userDetails = (UserDetails) authentication.getPrincipal();

        boolean saved = postService.savePost(dto, userDetails.getUsername());

        String message = saved ? "기록 되었습니다!" : "저장에 실패했습니다. 다시 시도해 주세요.";
        redirectAttributes.addFlashAttribute("message", message);

        return saved ? "redirect:/" : "redirect:/post/write";
    }
}
