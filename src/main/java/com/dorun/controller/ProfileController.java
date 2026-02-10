package com.dorun.controller;

import com.dorun.dto.AccountDto;
import com.dorun.dto.PostResponseDto;
import com.dorun.service.AccountService;
import com.dorun.service.PhotoService;
import com.dorun.service.PostService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import java.security.Principal;
import java.util.List;

@Controller
@RequestMapping("/profile")
public class ProfileController {

    private final PostService postService;
    private final AccountService accountService;
    private final PhotoService photoService;

    private final Logger log = LoggerFactory.getLogger(ProfileController.class);

    public ProfileController(PostService postService, AccountService accountService, PhotoService photoService) {
        this.postService = postService;
        this.accountService = accountService;
        this.photoService = photoService;
    }

    @GetMapping("/{userId}")
    public String userProfile(@PathVariable("userId") Long userId, Model model) {
        List<PostResponseDto> posts = postService.getPostsByUserId(userId);
        model.addAttribute("posts", posts);
        return "profile/profile";
    }

    @GetMapping("/edit")
    public String editProfile(Principal principal, Model model) {
        AccountDto user = accountService.findByEmail(principal.getName());
        model.addAttribute("user", user);
        return "profile/edit";
    }
}
