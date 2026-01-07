package spring.legacy.dto;

import java.sql.Timestamp;

public class RunBoardDto {
    private Long id;
    private Long accountId;
    private String content;
    private Double distance;
    private Integer duration;
    private String imagePath;
    private String status;
    private Timestamp createAt;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getAccountId() {
        return accountId;
    }

    public void setAccountId(Long accountId) {
        this.accountId = accountId;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Double getDistance() {
        return distance;
    }

    public void setDistance(Double distance) {
        this.distance = distance;
    }

    public Integer getDuration() {
        return duration;
    }

    public void setDuration(Integer duration) {
        this.duration = duration;
    }

    public String getImagePath() {
        return imagePath;
    }

    public void setImagePath(String imagePath) {
        this.imagePath = imagePath;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Timestamp getCreateAt() {
        return createAt;
    }

    public void setCreateAt(Timestamp createAt) {
        this.createAt = createAt;
    }

    @Override
    public String toString() {
        return "RunBoardDto" +
                "{" +
                "id=" + id +
                ", accountId=" + accountId +
                ", content='" + content + '\'' +
                ", distance=" + distance +
                ", duration=" + duration +
                ", imagePath='" + imagePath + '\'' +
                ", status='" + status + '\'' +
                ", createAt=" + createAt +
                '}';
    }
}
