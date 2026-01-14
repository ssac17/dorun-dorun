package com.dorun.dto;

import org.springframework.web.multipart.MultipartFile;

import java.util.List;

public class PostRequestDto {

    private Long id;
    private String title;
    private List<MultipartFile> photos;
    private Double distance;
    private String duration;
    private String content;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public List<MultipartFile> getPhotos() {
        return photos;
    }

    public void setPhotos(List<MultipartFile> photos) {
        this.photos = photos;
    }

    public Double getDistance() {
        return distance;
    }

    public void setDistance(Double distance) {
        this.distance = distance;
    }

    public String getDuration() {
        return duration;
    }

    public void setDuration(String duration) {
        this.duration = duration;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    @Override
    public String toString() {
        return "PostRequestDto {" +
                "id=" + id +
                ", title='" + title + '\'' +
                ", photos=" + photos +
                ", distance=" + distance +
                ", duration='" + duration + '\'' +
                ", content='" + content + '\'' +
                '}';
    }
}
