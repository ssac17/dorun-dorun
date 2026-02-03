package com.dorun.controller;

import com.dorun.dto.PostResponseDto;
import com.dorun.service.AccountService;
import com.dorun.service.PostService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/profile")
public class ProfileController {

    private final PostService postService;
    private final AccountService accountService;

    public ProfileController(PostService postService, AccountService accountService) {
        this.postService = postService;
        this.accountService = accountService;
    }

    @GetMapping("/{userId}")
    public String userProfile(@PathVariable("userId") Long userId, Model model) {
        List<PostResponseDto> posts = postService.getPostsByUserId(userId);
        model.addAttribute("posts", posts);
        return "profile/profile";
    }
}
