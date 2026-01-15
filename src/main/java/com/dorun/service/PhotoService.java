package com.dorun.service;

import net.coobird.thumbnailator.Thumbnails;
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
    private final String photoDir = projectRoot + "/upload/photo/";
    private final String thumbDir = projectRoot + "/upload/thumbnail/";

    public List<String> uploadPhotos(List<MultipartFile> files) {
        log.info("실제 저장 절대 경로: {}", new File(photoDir).getAbsolutePath());
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
                Thumbnails.of(originalPhoto).size(600, 600).toFile(thumbnailPhoto);;

                savedPaths.add(savedName);
            } catch (IOException e) {
                log.error("사진 저장 에러 발생! 파일명: {}, 에러메시지: {}", file.getOriginalFilename(), e.getMessage());
            }
        }
        return savedPaths;
    }

    private void createDir(String path) {
        File dir = new File(path);
        if(!dir.exists()) {
            dir.mkdirs();
        }
    }
}
