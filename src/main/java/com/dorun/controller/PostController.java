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
    public String postWrite(@ModelAttribute PostRequestDto dto, Authentication authentication) {
        System.out.println(dto);
        UserDetails userDetails = (UserDetails) authentication.getPrincipal();
        System.out.println(userDetails.getUsername());
        boolean saved = postService.savePost(dto, userDetails.getUsername());
        return "";
    }
}
