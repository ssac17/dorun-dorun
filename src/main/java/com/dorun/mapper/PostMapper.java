package com.dorun.mapper;

import com.dorun.dto.PostRequestDto;
import com.dorun.dto.PostResponseDto;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface PostMapper {
    int savePost(@Param("dto")PostRequestDto dto, @Param("email") String email, @Param("username") String username);
    int savePhotos(@Param("postId") Long postId, @Param("photoList") List<String> photoList);
    List<PostResponseDto> selectAllPosts();
}
