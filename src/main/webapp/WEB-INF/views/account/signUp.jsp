<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<!doctype html>
<html lang="ko" data-bs-theme="auto">

<%--<%@ include file="../layout/header.jsp" %>--%>

<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta name="description" content="" />
    <meta
            name="author"
            content="Mark Otto, Jacob Thornton, and Bootstrap contributors"
    />
    <meta name="generator" content="Astro v5.13.2" />
    <title>Checkout example · Bootstrap v5.3</title>
    <link
            rel="canonical"
            href="https://getbootstrap.com/docs/5.3/examples/checkout/"
    />
    <script src="${pageContext.request.contextPath}/resources/js/color-modes.js"></script>
    <link href="${pageContext.request.contextPath}/resources/css/bootstrap/bootstrap.min.css" rel="stylesheet" />
    <meta name="theme-color" content="#712cf9" />
    <link href="${pageContext.request.contextPath}/resources/css/bootstrap/checkout.css" rel="stylesheet" />
    <link href="${pageContext.request.contextPath}/resources/css/page/signUp.css" rel="stylesheet">
</head>
<body class="bg-body-tertiary">
<svg xmlns="http://www.w3.org/2000/svg" class="d-none">
    <symbol id="check2" viewBox="0 0 16 16">
        <path
                d="M13.854 3.646a.5.5 0 0 1 0 .708l-7 7a.5.5 0 0 1-.708 0l-3.5-3.5a.5.5 0 1 1 .708-.708L6.5 10.293l6.646-6.647a.5.5 0 0 1 .708 0z"
        ></path>
    </symbol>
    <symbol id="circle-half" viewBox="0 0 16 16">
        <path
                d="M8 15A7 7 0 1 0 8 1v14zm0 1A8 8 0 1 1 8 0a8 8 0 0 1 0 16z"
        ></path>
    </symbol>
    <symbol id="moon-stars-fill" viewBox="0 0 16 16">
        <path
                d="M6 .278a.768.768 0 0 1 .08.858 7.208 7.208 0 0 0-.878 3.46c0 4.021 3.278 7.277 7.318 7.277.527 0 1.04-.055 1.533-.16a.787.787 0 0 1 .81.316.733.733 0 0 1-.031.893A8.349 8.349 0 0 1 8.344 16C3.734 16 0 12.286 0 7.71 0 4.266 2.114 1.312 5.124.06A.752.752 0 0 1 6 .278z"
        ></path>
        <path
                d="M10.794 3.148a.217.217 0 0 1 .412 0l.387 1.162c.173.518.579.924 1.097 1.097l1.162.387a.217.217 0 0 1 0 .412l-1.162.387a1.734 1.734 0 0 0-1.097 1.097l-.387 1.162a.217.217 0 0 1-.412 0l-.387-1.162A1.734 1.734 0 0 0 9.31 6.593l-1.162-.387a.217.217 0 0 1 0-.412l1.162-.387a1.734 1.734 0 0 0 1.097-1.097l.387-1.162zM13.863.099a.145.145 0 0 1 .274 0l.258.774c.115.346.386.617.732.732l.774.258a.145.145 0 0 1 0 .274l-.774.258a1.156 1.156 0 0 0-.732.732l-.258.774a.145.145 0 0 1-.274 0l-.258-.774a1.156 1.156 0 0 0-.732-.732l-.774-.258a.145.145 0 0 1 0-.274l.774-.258c.346-.115.617-.386.732-.732L13.863.1z"
        ></path>
    </symbol>
    <symbol id="sun-fill" viewBox="0 0 16 16">
        <path
                d="M8 12a4 4 0 1 0 0-8 4 4 0 0 0 0 8zM8 0a.5.5 0 0 1 .5.5v2a.5.5 0 0 1-1 0v-2A.5.5 0 0 1 8 0zm0 13a.5.5 0 0 1 .5.5v2a.5.5 0 0 1-1 0v-2A.5.5 0 0 1 8 13zm8-5a.5.5 0 0 1-.5.5h-2a.5.5 0 0 1 0-1h2a.5.5 0 0 1 .5.5zM3 8a.5.5 0 0 1-.5.5h-2a.5.5 0 0 1 0-1h2A.5.5 0 0 1 3 8zm10.657-5.657a.5.5 0 0 1 0 .707l-1.414 1.415a.5.5 0 1 1-.707-.708l1.414-1.414a.5.5 0 0 1 .707 0zm-9.193 9.193a.5.5 0 0 1 0 .707L3.05 13.657a.5.5 0 0 1-.707-.707l1.414-1.414a.5.5 0 0 1 .707 0zm9.193 2.121a.5.5 0 0 1-.707 0l-1.414-1.414a.5.5 0 0 1 .707-.707l1.414 1.414a.5.5 0 0 1 0 .707zM4.464 4.465a.5.5 0 0 1-.707 0L2.343 3.05a.5.5 0 1 1 .707-.707l1.414 1.414a.5.5 0 0 1 0 .708z"
        ></path>
    </symbol>
</svg>
<div
        class="dropdown position-fixed bottom-0 end-0 mb-3 me-3 bd-mode-toggle"
>
    <button
            class="btn btn-bd-primary py-2 dropdown-toggle d-flex align-items-center"
            id="bd-theme"
            type="button"
            aria-expanded="false"
            data-bs-toggle="dropdown"
            aria-label="Toggle theme (auto)"
    >
        <svg class="bi my-1 theme-icon-active" aria-hidden="true">
            <use href="#circle-half"></use>
        </svg>
        <span class="visually-hidden" id="bd-theme-text">Toggle theme</span>
    </button>
    <ul
            class="dropdown-menu dropdown-menu-end shadow"
            aria-labelledby="bd-theme-text"
    >
        <li>
            <button
                    type="button"
                    class="dropdown-item d-flex align-items-center"
                    data-bs-theme-value="light"
                    aria-pressed="false"
            >
                <svg class="bi me-2 opacity-50" aria-hidden="true">
                    <use href="#sun-fill"></use>
                </svg>
                Light
                <svg class="bi ms-auto d-none" aria-hidden="true">
                    <use href="#check2"></use>
                </svg>
            </button>
        </li>
        <li>
            <button
                    type="button"
                    class="dropdown-item d-flex align-items-center"
                    data-bs-theme-value="dark"
                    aria-pressed="false"
            >
                <svg class="bi me-2 opacity-50" aria-hidden="true">
                    <use href="#moon-stars-fill"></use>
                </svg>
                Dark
                <svg class="bi ms-auto d-none" aria-hidden="true">
                    <use href="#check2"></use>
                </svg>
            </button>
        </li>
        <li>
            <button
                    type="button"
                    class="dropdown-item d-flex align-items-center active"
                    data-bs-theme-value="auto"
                    aria-pressed="true"
            >
                <svg class="bi me-2 opacity-50" aria-hidden="true">
                    <use href="#circle-half"></use>
                </svg>
                Auto
                <svg class="bi ms-auto d-none" aria-hidden="true">
                    <use href="#check2"></use>
                </svg>
            </button>
        </li>
    </ul>
</div>
<div class="container">
    <main>
        <div class="py-5 text-center">
            <a href="/">
                <img
                        class="d-block mx-auto mb-4"
                        src="${pageContext.request.contextPath}/resources/image/bootstrap-logo.svg"
                        alt=""
                        width="72"
                        height="57"
                />
            </a>
            <h1 class="h2">SIGN UP</h1>
            <p class="lead">
                회원 가입 페이지 입니다!!
            </p>
        </div>
        <div class="row g-5">
            <div class="col-md-7 col-lg-8 mx-auto">
                <h4 class="mb-3">어떤 문구가 들어가는게 좋을까?</h4>
                <form class="needs-validation" novalidate>
                    <div class="row g-3">
                        <!-- 이름 -->
                        <div class="col-12">
                            <div class="row align-items-center">
                                <div class="col-3 text-end">
                                    <label for="userName" class="col-form-label">Name</label>
                                </div>
                                <div class="col-9">
                                    <input
                                            type="text"
                                            class="form-control"
                                            id="userName"
                                            placeholder="John"
                                            required
                                    />
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
                                            <input
                                                    type="email"
                                                    class="form-control"
                                                    id="emailInput"
                                                    placeholder="you@example.com"
                                                    value="${email != null ? email : ""}"
                                                    required
                                            />
                                            <div class="invalid-feedback">
                                                Please enter a valid email address.
                                            </div>
                                        </div>
                                        <div class="col-3">
                                            <button class="btn btn-outline-secondary w-100" type="button" id="emailVerifyButton">
                                                이메일 인증
                                            </button>
                                        </div>
                                        <!-- 이메일 발송 알림 모달(alert) -->
                                        <div class="modal fade" id="sendEmailAlert" tabindex="-1"
                                             aria-hidden="true" data-bs-backdrop="static" data-bs-keyboard="false">
                                            <div class="modal-dialog modal-dialog-centered">
                                                <div class="modal-content rounded-4 shadow">
                                                    <div class="modal-header border-bottom-0">
                                                        <h1 class="modal-title fs-5">알림</h1>
                                                        <button type="button" class="btn-close"
                                                                data-bs-dismiss="modal" aria-label="Close"></button>
                                                    </div>
                                                    <div class="modal-body py-0">
                                                        <p id="sendMailAlertMessage">
                                                            이메일이 발송되었습니다.
                                                        </p>
                                                    </div>
                                                    <div class="modal-footer flex-column align-items-stretch w-100 gap-2 pb-3 border-top-0">
                                                        <button type="button" class="btn btn-lg btn-primary" data-bs-dismiss="modal">
                                                            확인
                                                        </button>
                                                    </div>
                                                </div>
                                            </div>
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
                                            <input
                                                    type="text"
                                                    class="form-control"
                                                    id="emailCode"
                                                    placeholder="Please enter the email code"
                                                    required
                                            />
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
                                    <label for="password1" class="col-form-label">Password</label>
                                </div>
                                <div class="col-9">
                                    <input
                                            type="password"
                                            class="form-control"
                                            id="password1"
                                            required
                                    />
                                    <div class="invalid-feedback">
                                        Please enter a valid password.
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- 비밀번호 확인 -->
                        <div class="col-12">
                            <div class="row align-items-center">
                                <div class="col-3 text-end">
                                    <label for="password2" class="col-form-label">Password Check</label>
                                </div>
                                <div class="col-9">
                                    <input
                                            type="password"
                                            class="form-control"
                                            id="password2"
                                            required
                                    />
                                    <div class="invalid-feedback">
                                        Please enter a valid password.
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <hr class="my-4" />
                    <button class="w-100 btn btn-primary btn-lg" type="submit">
                        회원 가입
                    </button>
                </form>

            </div>
        </div>
    </main>
    <footer class="my-5 pt-5 text-body-secondary text-center text-small">
        <p class="mb-1">&copy; 2017–2025 Company Name</p>
        <ul class="list-inline">
            <li class="list-inline-item"><a href="#">Privacy</a></li>
            <li class="list-inline-item"><a href="#">Terms</a></li>
            <li class="list-inline-item"><a href="#">Support</a></li>
        </ul>
    </footer>
</div>

<script src="${pageContext.request.contextPath}/resources/js/bootstrap.bundle.min.js" class="astro-vvvwv3sm"></script>
<script src="${pageContext.request.contextPath}/resources/js/checkout.js" class="astro-vvvwv3sm"></script>

<script>
const contextPath = "${pageContext.request.contextPath}";
const emailInput = document.getElementById("emailInput");
const emailVerifyBtn = document.getElementById("emailVerifyButton");
const emailCodeDiv = document.getElementById("emailCodeDiv");
const sendMailAlertModalDiv = document.getElementById("sendEmailAlert");
const sendMailAlertModal = new bootstrap.Modal(sendMailAlertModalDiv);
const sendMailAlertMessage = document.getElementById("sendMailAlertMessage");
const emailCountDownText = document.getElementById("emailCountDownText");
const emailCodeInput = document.getElementById("emailCode");
const emailCodeCheckBtn = document.getElementById("emailCodeCheckButton");
let countdownTimer = null;

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


sendEmailCode = function () {
    const email = emailInput.value;

    fetch(contextPath + "/account/send-code", {
        method: "POST",
        headers: {
            "Content-Type": "application/x-www-form-urlencoded; charset=UTF-8",
            "Accept": "application/json"
        },
        body: new URLSearchParams({ email })
    })
        .then(res => res.json())
        .then((data) => {
            sendMailAlertMessage.textContent = data.message;
            console.log(data)
            if (data.status) {
                emailVerifyBtn.classList.remove("btn-primary");
                emailVerifyBtn.classList.add("btn-outline-secondary");
                emailVerifyBtn.disabled = true;
                emailCodeDiv.classList.remove("d-none");
                startEmailCountdown(180);
            }
            sendMailAlertModal.show();
        })
        .catch(error => {
            console.error(error);
            sendMailAlertMessage.textContent = "잠시 후 다시 시도해 주세요.";
            sendMailAlertModal.show();
        });
};

emailInput.addEventListener("input", emailButtonState)
emailCodeInput.addEventListener("input", emailCodeButtonState)
emailVerifyBtn.addEventListener("click", function () {
    if(emailVerifyBtn.disabled) {
        return;
    }
    emailCodeDiv.classList.remove("d-none");
    sendEmailCode();
})


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

sendMailAlertModalDiv.addEventListener("hidden.bs.modal", function () {
    if(sendMailAlertModalDiv.contains(document.activeElement)) {
        document.activeElement.blur();
        document.body.focus();
    }
})
</script>

</body>
</html>
