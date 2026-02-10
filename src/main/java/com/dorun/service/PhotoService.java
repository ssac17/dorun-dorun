package com.dorun.service;

import net.coobird.thumbnailator.Thumbnails;
import net.coobird.thumbnailator.geometry.Positions;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

@Service
public class PhotoService {
    private static final Logger log = LoggerFactory.getLogger(PhotoService.class);

    private final String projectRoot = System.getProperty("user.dir");
    private final String photoDir = projectRoot + "/upload/photo/"; //이미지
    private final String thumbDir = projectRoot + "/upload/thumbnail/"; //썸네일
    private final String profileDir = projectRoot + "/upload/profile/"; //프로필 이미지

    public List<String> uploadPhotos(List<MultipartFile> files) {

        List<String> savedPaths = new ArrayList<>();
        //없으면 폴더 생성
        createDir(photoDir);
        createDir(thumbDir);

        for (MultipartFile file : files) {
            if(file.isEmpty()) continue;
            String savedName = UUID.randomUUID() + "_" + file.getOriginalFilename();

            try {
                File originalPhoto = new File(photoDir + savedName);
                file.transferTo(originalPhoto);

                //썸네일
                File thumbnailPhoto = new File(thumbDir + savedName);
                Thumbnails.of(originalPhoto).size(600, 600).toFile(thumbnailPhoto);

                savedPaths.add(savedName);
            } catch (IOException e) {
                log.error("사진 저장 에러 발생! 파일명: {}, 에러메시지: {}", file.getOriginalFilename(), e.getMessage());
            }
        }
        return savedPaths;
    }

    public String uploadProfilePhoto(MultipartFile profileImage, String oldFileName) {

        if(profileImage == null || profileImage.isEmpty()) {
            return null;
        }
        createDir(profileDir);

        String savedName = UUID.randomUUID() + "_" + profileImage.getOriginalFilename();

        try {
            File savedFile = new File(profileDir + savedName);
            Thumbnails.of(profileImage.getInputStream())
                    .size(300, 300)
                    .crop(Positions.CENTER) //중잉 기준으로 짜르기
                    .toFile(savedFile);

            if(oldFileName != null && !oldFileName.equals("default-profile.png")) {
                File oldFile = new File(profileDir + oldFileName);
                if(oldFile.exists()) {
                    if(oldFile.delete()) {
                        log.info("기존 프로필 사진 삭제 완료: {}", oldFileName);
                    }
                }
            }
            return savedName;
        } catch (IOException e) {
            log.error("프로필 사진 교체 중 에러 발생: {}", e.getMessage());
            return null;
        }
    }

    private void createDir(String path) {
        File dir = new File(path);
        if(!dir.exists()) {
            dir.mkdirs();
        }
    }
}
