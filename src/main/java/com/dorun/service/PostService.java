package com.dorun.service;

import com.dorun.dto.PostRequestDto;
import com.dorun.mapper.PostMapper;
import org.springframework.stereotype.Service;

@Service
public class PostService {

    private final AccountService accountService;
    private final PostMapper postMapper;

    public PostService(AccountService accountService, PostMapper postMapper) {
        this.accountService = accountService;
        this.postMapper = postMapper;
    }

    public boolean savePost(PostRequestDto dto, String username) {
        boolean emailExists = accountService.isEmailExists(username);
        if(!emailExists) {
            new IllegalArgumentException("존재하지 않는 사용자입니다:" + username);
        }
        postMapper.savePost(dto, username);
        return false;
    }
}
