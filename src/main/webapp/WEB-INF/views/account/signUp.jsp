<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!doctype html>
<html lang="ko" data-bs-theme="auto">

<%@ include file="../layout/header.jsp" %>
<%@ include file="../layout/theme-toggle.jsp" %>


<body class="bg-body-tertiary">
<div class="container">
    <main>
        <div class="py-5 text-center">
            <a href="/">
                <img class="d-block mx-auto mb-4" src="${pageContext.request.contextPath}/resources/image/bootstrap-logo.svg" alt="" width="72" height="57"/>
            </a>
            <h1 class="h2">SIGN UP</h1>
            <p class="lead">
                회원 가입 페이지 입니다!!
            </p>
        </div>
        <div class="row g-5">
            <div class="col-md-7 col-lg-8 mx-auto">
                <h4 class="mb-3">어떤 문구가 들어가는게 좋을까?</h4>
                <form class="needs-validation" method="POST" action="${pageContext.request.contextPath}/account/sign-up" novalidate id="signUpForm">
                    <div class="row g-3">
                        <!-- 이름 -->
                        <div class="col-12">
                            <div class="row align-items-center">
                                <div class="col-3 text-end">
                                    <label for="userName" class="col-form-label">Name</label>
                                </div>
                                <div class="col-9">
                                    <input type="text" class="form-control" id="userName" name="name" placeholder="John" required/>
                                    <div class="invalid-feedback">
                                        Your name is required.
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- 이메일 -->
                        <div class="col-12">
                            <div class="row align-items-center">
                                <div class="col-3 text-end">
                                    <label for="email" class="col-form-label">Email</label>
                                </div>
                                <div class="col-9">
                                    <div class="row g-2">
                                        <div class="col-9">
                                            <input type="email" class="form-control" id="emailInput" placeholder="you@example.com" name="email" value="${email != null ? email : ""}" required/>
                                            <div class="invalid-feedback">
                                                Please enter a valid email address.
                                            </div>
                                        </div>
                                        <div class="col-3">
                                            <button class="btn btn-outline-secondary w-100" type="button" id="emailVerifyButton">
                                                이메일 인증
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- 이메일 인증 코드 -->
                        <div class="col-12 d-none" id="emailCodeDiv">
                            <div class="row align-items-center">
                                <div class="col-3 text-end">
                                    <label for="emailCode" class="col-form-label">Email Code</label>
                                </div>

                                <div class="col-9">
                                    <div class="row g-2 align-items-center">
                                        <!-- 1. input -->
                                        <div class="col-7">
                                            <input type="text" class="form-control" id="emailCode" placeholder="Please enter the email code" maxlength="6" autocomplete="one-time-code" required/>
                                            <div class="invalid-feedback">
                                                인증코드를 입력해 주세요.
                                            </div>
                                        </div>
                                        <div class="col-3">
                                            <span id="emailCountDownText" class="d-block"></span>
                                        </div>
                                        <div class="col-2">
                                            <button class="btn btn-outline-secondary w-100" type="button" id="emailCodeCheckButton">확인</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- 비밀번호 -->
                        <div class="col-12">
                            <div class="row align-items-center">
                                <div class="col-3 text-end">
                                    <label for="password" class="col-form-label">Password</label>
                                </div>
                                <div class="col-9">
                                    <input type="password" class="form-control" id="password" name="password" autocomplete="new-password" required/>
                                    <div class="invalid-feedback">
                                        <c:choose>
                                            <c:when test="${not empty passwordError}">${passwordError}</c:when>
                                            <c:otherwise>비밀번호를 입력해 주세요.</c:otherwise>
                                        </c:choose>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- 비밀번호 확인 -->
                        <div class="col-12">
                            <div class="row align-items-center">
                                <div class="col-3 text-end">
                                    <label for="passwordCheck" class="col-form-label">Password Check</label>
                                </div>
                                <div class="col-9">
                                    <input type="password" class="form-control" id="passwordCheck" name="passwordCheck" autocomplete="new-password" required/>
                                    <div class="invalid-feedback">
                                        Please enter a valid password.
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <hr class="my-4" />
                    <button class="w-100 btn btn-primary btn-lg" type="submit" id="signupButton">
                        회원 가입
                    </button>
                </form>
            </div>
        </div>
    </main>
</div>
<%@ include file="../layout/footer.jsp"%>
<%@ include file="../modal/alertModal.jsp" %>

<script src="${pageContext.request.contextPath}/resources/js/bootstrap.bundle.min.js" class="astro-vvvwv3sm"></script>
<script src="${pageContext.request.contextPath}/resources/js/checkout.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/common.js"></script>

<script>
const contextPath = "${pageContext.request.contextPath}";
const emailInput = document.getElementById("emailInput");
const emailVerifyBtn = document.getElementById("emailVerifyButton");
const emailCodeDiv = document.getElementById("emailCodeDiv");
const sendMailAlertModalDiv = document.getElementById("alertModal");
const alertModal = new bootstrap.Modal(sendMailAlertModalDiv);
const alertMessage = document.getElementById("alertMessage");
const emailCountDownText = document.getElementById("emailCountDownText");
const emailCodeInput = document.getElementById("emailCode");
const emailCodeCheckBtn = document.getElementById("emailCodeCheckButton");
const signUpForm = document.getElementById("signUpForm");
const signupBtn = document.getElementById("signupButton");
let countdownTimer = null;
let isEmailVerified = false;

window.onload = function () {
    emailButtonState();
    emailCodeButtonState();
}

//이메일 형식 검사
isValidEmail = function (value) {
    return /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(value);
}

//이메일 인증 버튼 활성화
emailButtonState = function () {
    const email = emailInput.value.trim();
    if(isValidEmail(email)) {
        emailVerifyBtn.classList.remove("btn-outline-secondary");
        emailVerifyBtn.classList.add("btn-primary")
        emailVerifyBtn.disabled = false;
    }else {
        emailVerifyBtn.classList.remove("btn-primary");
        emailVerifyBtn.classList.add("btn-outline-secondary")
        emailVerifyBtn.disabled = true;

        //이메일이 다시 isValidEmail false며 인증코드 숨김
        emailCodeDiv.classList.add("d-none")
    }
}
//이메일 인증코드 버튼 활성화
emailCodeButtonState = function () {
    const code = emailCodeInput.value.trim();
    if(code.length === 6) {
        emailCodeCheckBtn.classList.remove("btn-outline-secondary");
        emailCodeCheckBtn.classList.add("btn-primary");
        emailCodeCheckBtn.disabled = false;
    }else {
        emailCodeCheckBtn.classList.remove("btn-primary");
        emailCodeCheckBtn.classList.add("btn-outline-secondary")
        emailCodeCheckBtn.disabled = true;
    }
}

// 이메일 인증코드 발송
sendEmailCode = function () {
    const email = emailInput.value.trim();

    fetch(contextPath + "/account/send-code", {
        method: CONST.POST,
        headers: {
            "Content-Type": CONST.FORM_URLENCODED,
            "Accept": CONST.JSON
        },
        body: new URLSearchParams({ email })
    })
        .then(res => res.json())
        .then((data) => {
            alertMessage.textContent = data.message;
            console.log(data)
            if (data.status) {
                emailVerifyBtn.classList.remove("btn-primary");
                emailVerifyBtn.classList.add("btn-outline-secondary");
                emailVerifyBtn.disabled = true;
                emailCodeDiv.classList.remove("d-none");
                startEmailCountdown(180);
            }
            alertModal.show();
        })
        .catch(error => {
            console.error(error);
            alertMessage.textContent = "잠시 후 다시 시도해 주세요.";
            alertModal.show();
        });
};

// 이메일인증코드 확인
verifyEmailCode = function () {
    const email = emailInput.value.trim();
    const code = emailCodeInput.value.trim();

    fetch(contextPath + "/account/verify-code", {
        method: CONST.POST,
        headers: {
            "Content-Type": CONST.FORM_URLENCODED,
            "Accept": CONST.JSON
        },
        body: new URLSearchParams({ email, code })
    })
        .then(res => res.json())
        .then((data) => {
            alertMessage.textContent = data.message;
            console.log(data)
            if (data.status) {
                //인증 완료 후 이메일인증div 태그 숨김
                emailCodeDiv.classList.add("d-none");
                if(countdownTimer !== null) {
                    clearInterval(countdownTimer);
                    countdownTimer = null;
                }
                emailCountDownText.textContent = "";
                //인증완료된 이메일input disabled로 하면 null로 들어옴, readOnly로 수정
                emailInput.readOnly =true;
                emailVerifyBtn.disabled = true;
                emailVerifyBtn.textContent = "인증완료";
                emailVerifyBtn.classList.remove("btn-outline-secondary", "btn-primary");
                emailVerifyBtn.classList.add("btn-success");

                isEmailVerified = true;
            }
            alertModal.show();
        })
        .catch(error => {
            console.error(error);
            alertMessage.textContent = "잠시 후 다시 시도해 주세요.";
            alertModal.show();
        });
}

signUp = function (e) {
    if(!signUpForm.checkVisibility()) {
        e.preventDefault();
        e.stopPropagation();
        signUpForm.classList.add("was-validated");
    }

    if(!isEmailVerified) {
        alertMessage.textContent = "이메일 인증을 완료해 주세요.";
        alertModal.show();
        return;
    }
    signUpForm.submit();
}

// 이메일 input 체크
emailInput.addEventListener("input", emailButtonState)
// 이메일 인증코드 input 체크
emailCodeInput.addEventListener("input", emailCodeButtonState)
// 이메일 인증코드 발송 이벤트
emailVerifyBtn.addEventListener("click", function () {
    if(emailVerifyBtn.disabled) {
        return;
    }
    sendEmailCode();
})
// 이메일 인증코드 확인
emailCodeCheckBtn.addEventListener("click", function () {
    if(emailCodeCheckBtn.disabled) return;
    verifyEmailCode();
})
signupBtn.addEventListener("click", signUp);

// 이메일 인증코드 발송 후 인증 시간 카운트다운
startEmailCountdown = function (second) {
    if(countdownTimer !== null) {
        clearInterval(countdownTimer);
    }

    let remain = second;

    const updateText = () => {
        const min = String(Math.floor(remain / 60)).padStart(2, "0");
        const sec = String(remain % 60).padStart(2, "0");
        emailCountDownText.textContent = "만료 시간: " + min + ":" + sec;
    };
    updateText();

    countdownTimer = setInterval(() => {
        remain -= 1;

        if(remain <= 0) {
            clearInterval(countdownTimer);
            countdownTimer = null;
            emailCountDownText.textContent = "시간 만료";
            return;
        }
        updateText();
    }, 1000);
}

// 이메일 전송 모달 엔터, esc, 스페이스 keydown로 닫기
document.addEventListener("keydown", function (e) {
    const emailModalOpen = sendMailAlertModalDiv.classList.contains("show");
    if(!emailModalOpen) return;

    const key = e.key;
    if(key === "Escape" || key === " " || key === "Enter") {
        e.preventDefault();
        alertModal.hide();
    }
})
</script>
</body>
</html>
