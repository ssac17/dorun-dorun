package com.dorun.controller;

import com.dorun.dto.PostResponseDto;
import com.dorun.service.PostService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@Controller
public class HomeController {

    private final PostService postService;

    public HomeController(PostService postService) {
        this.postService = postService;
    }

    @GetMapping("/")
    public String index(Model model) {
        List<PostResponseDto> posts = postService.getAllPosts();
        for (PostResponseDto post : posts) {
            System.out.println(post.getPhotos());
        }
        model.addAttribute("posts", posts);
        return "index";
    }
}
