<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="ko" data-bs-theme="auto">

<%@ include file="layout/header.jsp" %>
<%@ include file="layout/theme-toggle.jsp" %>

<body>
<div class="container-fluid bg-body-tertiary">
    <div class="row justify-content-center py-4">
        <div class="col-md-10 col-lg-6 col-xl-5">

            <%-- 서버에서 넘어온 posts 리스트를 반복문으로 돌립니다 --%>
            <c:forEach var="post" items="${posts}">
                <div class="card mb-4 border-0 shadow-sm rounded-4">
                    <div class="card-header border-0 py-3 d-flex align-items-center">
                        <img src="${pageContext.request.contextPath}/resources/image/default-profile.png"
                             class="rounded-circle me-2" width="32" height="32" alt="profile">
                        <div>
                            <span class="fw-bold d-block">${post.username}</span>
                            <small class="text-muted">서울 중랑구</small> <%-- 나중에 주소 컬럼 추가하면 연동 가능 --%>
                        </div>
                        <button class="btn ms-auto border-0"><i class="bi bi-three-dots"></i></button>
                    </div>

                    <div id="carousel-${post.id}" class="carousel slide" data-bs-ride="false">
                        <div class="carousel-inner">
                            <c:forEach var="photo" items="${post.photos}" varStatus="status">
                                <div class="carousel-item ${status.first ? 'active' : ''}">
                                        <%-- 썸네일 경로 연동 --%>
                                    <img src="${pageContext.request.contextPath}/upload/thumbnail/${photo}"
                                         class="d-block w-100 card-img-top rounded-0"
                                         style="aspect-ratio: 1/1; object-fit: cover;" alt="Running Record">
                                </div>
                            </c:forEach>
                        </div>

                            <%-- 사진이 2장 이상일 때만 좌우 버튼 노출 --%>
                        <c:if test="${post.photos.size() > 1}">
                            <button class="carousel-control-prev" type="button" data-bs-target="#carousel-${post.id}" data-bs-slide="prev">
                                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                <span class="visually-hidden">Previous</span>
                            </button>
                            <button class="carousel-control-next" type="button" data-bs-target="#carousel-${post.id}" data-bs-slide="next">
                                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                <span class="visually-hidden">Next</span>
                            </button>
                        </c:if>
                    </div>

                    <div class="card-body">
                        <div class="d-flex justify-content-between align-items-center mb-3">
                            <div class="text-center p-2 bg-primary-subtle rounded-3 flex-fill me-2">
                                <h6 class="mb-0 text-primary fw-bold">${post.distance} km</h6>
                                <small class="text-muted">거리</small>
                            </div>
                            <div class="text-center p-2 bg-success-subtle rounded-3 flex-fill ms-2">
                                <h6 class="mb-0 text-success fw-bold">${post.duration}</h6>
                                <small class="text-muted">총 시간</small>
                            </div>
                        </div>
                        <p class="card-text">
                            <span class="fw-bold me-2">${post.username}</span>
                                ${post.content}
                        </p>
                        <small class="text-muted">${post.createdAt}</small>
                    </div>

                    <div class="card-footer border-top-0 py-3">
                        <div class="d-flex gap-3">
                            <button class="btn btn-link p-0 text-decoration-none">❤️ 0</button>
                            <button class="btn btn-link p-0 text-decoration-none">💬 0</button>
                        </div>
                    </div>
                </div>
            </c:forEach>
                <%-- 데이터가 없을 때 --%>
                <c:choose>
                    <c:when test="${empty posts}">
                        <div class="text-center py-5 mt-5">
                            <div class="mb-4">
                                <i class="bi bi-pavement-check text-secondary" style="font-size: 5rem; opacity: 0.3;"></i>
                            </div>
                            <h4 class="fw-bold text-body">아직 올라온 기록이 없어요</h4>
                            <p class="text-body-secondary">첫 번째 러닝 주인공이 되어보세요! 🏃‍♂️💨</p>

                                <%-- 게시글 작성 페이지로 이동하는 버튼 --%>
                            <a href="${pageContext.request.contextPath}/post/write"
                               class="btn btn-primary rounded-pill px-4 mt-3 shadow-sm">
                                첫 기록 남기기
                            </a>
                        </div>
                    </c:when>

                    <c:otherwise>
                        <c:forEach var="post" items="${posts}">
                            <div class="card mb-4 border-0 shadow-sm rounded-4">
                            </div>
                        </c:forEach>
                    </c:otherwise>
                </c:choose>
        </div>
    </div>
</div>
<%@ include file="layout/footer.jsp" %>
<%@ include file="modal/loginModal.jsp" %>
<%@ include file="modal/alertModal.jsp" %>

<script src="${pageContext.request.contextPath}/resources/js/bootstrap.bundle.min.js" class="astro-vvvwv3sm"></script>
<script src="${pageContext.request.contextPath}/resources/js/common.js"></script>
<script>
const alertModalDiv = document.getElementById("alertModal");
const alertMessage = document.getElementById("alertMessage");
const alertModal = new bootstrap.Modal(alertModalDiv);
const emailAlertContainer = document.getElementById("emailAlert");
const passwordAlertContainer = document.getElementById("passwordAlert");

window.onload = function () {
    const loginBtn = document.getElementById("LoginButon");
    loginBtn.addEventListener('click', function (e) {
        e.preventDefault();
        login();
    })

    //리다이렉트시  modal 띄우기
    const message = "${message}";
    if(message) {
        alertMessage.textContent = message;
        alertModal.show();
    }
}

login = function () {
    const email = document.getElementById("emailInput").value.trim();
    const password = document.getElementById("passwordInput").value.trim();
    const contextPath = "${pageContext.request.contextPath}";

    emailAlertContainer.innerHTML = "";
    passwordAlertContainer.innerHTML = "";
    let hasError = false;

    if(email === "") {
        setEmailAlertContainer(MESSAGE.REQUIRED_EMAIL);
        hasError = true;
    }
    if(password === "") {
        setPasswordAlertContainer(MESSAGE.REQUIRED_PASSWORD);
        hasError = true;
    }else if(!CONST.REGEX_PASSWORD.test(password)) {
        //비밀번호 정규표현식 체크
        setPasswordAlertContainer(MESSAGE.INVALID_PASSWORD);
        hasError = true;
    }

    if(hasError) return;

    fetch(contextPath + "/account/check-email", {
        method: CONST.POST,
        headers: {
            "Content-Type": CONST.FORM_URLENCODED,
            "Accept": CONST.JSON
        },
        body: new URLSearchParams({ email })
    })
        .then(res => res.json())
        .then((data) => {
            console.log(data);

            if(!data.exists) {
                setEmailAlertContainer("가입되어 있지 않는 이메일입니다.");
        }else {
            //이메일 존재로 로그인 요청
            submitLogin(contextPath);
        }
    }).catch(error => console.error("error: ", error))
}

submitLogin = function (contextPath) {
    const form = document.querySelector("#modalLogin form");
    form.action = contextPath + "/login-process";
    form.method = "POST";

    document.getElementById("emailInput").name = "email";
    document.getElementById("passwordInput").name = "password";
    form.submit();
};

setEmailAlertContainer = function (message) {
    emailAlertContainer.innerHTML = `
        <div class="alert alert-danger alert-dismissible fade show" role="alert">
            \${message}
            <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
        </div>
    `;
}

setPasswordAlertContainer = function (message) {
    passwordAlertContainer.innerHTML = `
        <div class="alert alert-danger alert-dismissible fade show" role="alert">
            \${message}
            <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
        </div>
    `;
}

requireLogin = function () {
    alertMessage.textContent = MESSAGE.REQUIRED_LOGIN;
    alertModal.show();
    alertModalDiv.addEventListener("hidden.bs.modal", function () {
        const getLoginModal = document.getElementById('modalLogin');
        if (getLoginModal) {
            const loginModal = bootstrap.Modal.getOrCreateInstance(getLoginModal);
            loginModal.show();
        }
    }, {once: true}); //한번 실팽되고 사라짐
}

</script>
</body>
</html>

