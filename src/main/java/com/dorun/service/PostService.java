package com.dorun.service;

import com.dorun.dto.AccountDto;
import com.dorun.dto.PostRequestDto;
import com.dorun.dto.PostResponseDto;
import com.dorun.mapper.PostMapper;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.List;

@Service
public class PostService {

    private final AccountService accountService;
    private final PostMapper postMapper;
    private final PhotoService photoService;

    public PostService(AccountService accountService, PostMapper postMapper, PhotoService photoService) {
        this.accountService = accountService;
        this.postMapper = postMapper;
        this.photoService = photoService;
    }

    @Transactional
    public boolean savePost(PostRequestDto dto, String email) {
        boolean emailExists = accountService.isEmailExists(email);
        if(!emailExists) {
            throw new IllegalArgumentException("존재하지 않는 사용자입니다:" + email);
        }
        AccountDto findAccount = accountService.findByEmail(email);

        int result = postMapper.savePost(dto, email, findAccount.getName());

        List<String> photoPaths = photoService.uploadPhotos(dto.getPhotos());
        if(!photoPaths.isEmpty()) {
            postMapper.savePhotos(dto.getId(), photoPaths);
        }

        return result > 0;
    }

    public List<PostResponseDto> getAllPosts() {
        return postMapper.selectAllPosts();
    }
}
