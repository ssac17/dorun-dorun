package com.dorun.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/post")
public class PostController {

    @GetMapping("/write")
    public String postWritePage() {
        return "/post/write";
    }

    @PostMapping("/write")
    public String postWrite() {
        return "";
    }
}
