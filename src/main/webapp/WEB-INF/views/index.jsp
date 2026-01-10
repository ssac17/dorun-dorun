<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="ko" data-bs-theme="auto">

<%@ include file="layout/header.jsp" %>
<%@ include file="layout/theme-toggle.jsp" %>

<body>
<div class="container-fluid bg-light">
    <div class="row justify-content-center py-4">
        <div class="col-md-10 col-lg-6 col-xl-5">
            <div class="card mb-4 border-0 shadow-sm rounded-4">
                <div class="card-header bg-white border-0 py-3 d-flex align-items-center">
                    <img src="${pageContext.request.contextPath}/resources/image/default-profile.png"
                         class="rounded-circle me-2" width="32" height="32" alt="profile">
                    <div>
                        <span class="fw-bold d-block">runner_91</span>
                        <small class="text-muted">서울 중랑천</small>
                    </div>
                    <button class="btn ms-auto border-0"><i class="bi bi-three-dots"></i></button>
                </div>
                <img src="${pageContext.request.contextPath}/resources/image/running-sample.jpg"
                     class="card-img-top rounded-0" alt="Running Record">

                <div class="card-body">
                    <div class="d-flex justify-content-between align-items-center mb-3">
                        <div class="text-center p-2 bg-primary-subtle rounded-3 flex-fill me-2">
                            <h6 class="mb-0 text-primary fw-bold">5.11 km</h6>
                            <small class="text-muted">거리</small>
                        </div>
                        <div class="text-center p-2 bg-success-subtle rounded-3 flex-fill ms-2">
                            <h6 class="mb-0 text-success fw-bold">37:15</h6>
                            <small class="text-muted">총 시간</small>
                        </div>
                    </div>
                    <p class="card-text">
                        <span class="fw-bold me-2">runner_91</span>
                        오늘 중랑천 코스 최고였어요! 날씨도 딱 좋네요. 🏃‍♂️💨
                    </p>
                    <small class="text-muted">3시간 전</small>
                </div>
                <div class="card-footer bg-white border-top-0 py-3">
                    <div class="d-flex gap-3">
                        <button class="btn btn-link p-0 text-dark text-decoration-none">❤️ 12</button>
                        <button class="btn btn-link p-0 text-dark text-decoration-none">💬 4</button>
                    </div>
                </div>
            </div>

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

    //회원가입 완료, 리다이렉트시 가입완료 modal
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
    form.action = contextPath + "/account/login";
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

