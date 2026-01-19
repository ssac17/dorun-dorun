# 🏃‍♂️ DoRun DoRun (두런두런)
> **Spring 6와 Java 21 기반의 SNS형 러닝 기록 플랫폼**

DoRun은 러너들이 자신의 운동 데이터와 사진을 기록하고 공유하는 공간입니다. 
최신 Java LTS 버전인 21과 Spring 6를 기반으로 하며, Docker를 이용한 독립적인 DB 환경을 구축하여 개발되었습니다.

---

## 🛠 Tech Stack

### Backend
- **Language:** Java 21 (LTS)
- **Framework:** Spring Framework 6 (Web MVC)
- **ORM:** MyBatis 3.5
- **Security:** Spring Security 6

### Frontend
- **View:** JSP, JSTL
- **Style:** Bootstrap 5
- **Script:** JavaScript (ES6+)

### Infrastructure
- **DB:** MySQL (Running on **Docker**)
- **Storage:** Local File System (Original & Thumbnail separation)
- **Library:** Thumbnailator (Image Resizing)

---

## ✨ 기술적 특징 (Technical Points)

### 1. 이미지 처리 최적화 (Thumbnail System)
- **Multi-Photo Support:** 한 게시물에 최대 4장의 사진을 업로드할 수 있으며, `Thumbnailator` 라이브러리를 통해 리스트용 썸네일을 자동 생성합니다.
- **Performance:** 원본 이미지 대신 600x600 사이즈의 썸네일을 메인 피드에 활용하여 페이지 로딩 속도를 최적화했습니다.

### 2. 최신 Java 21 환경 및 Docker 도입
- **Java 21:** 최신 LTS 버전의 기능을 활용하여 서버 로직을 구축했습니다.
- **Containerized DB:** `Docker`를 활용하여 MySQL 환경을 격리하고, 어떤 개발 환경에서도 동일한 DB 상태를 유지하도록 구성했습니다.

### 3. 안정적인 웹 아키텍처
- **Spring 6 MVC:** Spring Boot 없이 Spring 6 MVC 구조를 직접 설계하여 웹 요청을 처리합니다.
- **PRG Pattern:** 게시글 작성 시 중복 제출을 방지하기 위해 Post-Redirect-Get 패턴을 적용했습니다.

---

## 🚀 Future Roadmap (업데이트 예정)

현재 로컬 환경에서의 안정적인 동작을 바탕으로, 향후 다음과 같은 기술적 확장을 계획하고 있습니다.

- **AWS Cloud Deployment:** AWS EC2를 활용한 서버 배포 및 운영 환경 구축.
- **AWS S3 Integration:** 로컬 파일 시스템 대신 AWS S3를 도입하여 대용량 이미지 저장 및 서빙 성능 강화.
- **RDS Managed DB:** Docker 기반 DB를 AWS RDS로 전환하여 데이터 안정성 및 가용성 확보.

---

## 💻 시작하기 (How to Run)

1. **DB 환경 구축 (Docker)**
   ```bash
   docker run --name dorun-db -e MYSQL_ROOT_PASSWORD=your_password -p 3306:3306 -d mysql:latest
