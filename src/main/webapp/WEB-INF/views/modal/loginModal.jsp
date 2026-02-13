<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%-- 로그인 모달 --%>
<div class="modal fade" tabindex="-1" role="dialog" id="modalLogin" aria-hidden="true" data-bs-backdrop="static">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content rounded-4 shadow">
            <div class="modal-header p-5 pb-4 border-bottom-0">
                <h1 class="fw-bold mb-0 fs-2">로그인</h1>
                <button
                        type="button"
                        class="btn-close"
                        data-bs-dismiss="modal"
                        aria-label="Close"
                ></button>
            </div>
            <div class="modal-body p-5 pt-0">
                <form id="loginForm">
                    <div class="form-floating mb-3">
                        <input type="email" class="form-control rounded-3" id="emailInput" name="email" placeholder="name@example.com" />
                        <label for="emailInput">Email address</label>
                    </div>
                    <div id="emailAlert"></div>
                    <div class="form-floating mb-3">
                        <input type="password" class="form-control rounded-3" id="passwordInput" name="password" placeholder="Password" autocomplete="current-password"/>
                        <label for="passwordInput">Password</label>
                    </div>
                    <div id="passwordAlert"></div>
                    <div class="form-check mb-3 text-start">
                        <input class="form-check-input" type="checkbox" name="remember-me" id="rememberMe">
                        <label class="form-check-label" for="rememberMe">
                            로그인 상태 유지 (1일)
                        </label>
                    </div>
                    <button class="w-100 mb-2 btn btn-lg rounded-3 btn-primary" type="button" id="LoginButon">Login</button>
                </form>
                <div>
                    <small>아직 회원이 아니신가요? </small><a href="${pageContext.request.contextPath}/account/sign-up">회원 가입</a>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
document.addEventListener("DOMContentLoaded", function () {
    const loginBtn = document.getElementById("LoginButon");
    if(loginBtn) {
        loginBtn.onclick = function (e) {
            e.preventDefault();
            login();
        }
    }
});

login = function () {
    const contextPath = "${pageContext.request.contextPath}";
    const email = document.getElementById("emailInput").value.trim();
    const password = document.getElementById("passwordInput").value.trim();
    const eAlert = document.getElementById("emailAlert");
    const pAlert = document.getElementById("passwordAlert");

    // 초기화
    if(eAlert) eAlert.innerHTML = "";
    if(pAlert) pAlert.innerHTML = "";

    let hasError = false;

    if(email === "") {
        setAlertContainer(eAlert, MESSAGE.REQUIRED_EMAIL);
        hasError = true;
    }
    if(password === "") {
        setAlertContainer(pAlert, MESSAGE.REQUIRED_PASSWORD);
        hasError = true;
    } else if(!CONST.REGEX_PASSWORD.test(password)) {
        setAlertContainer(pAlert, MESSAGE.INVALID_PASSWORD);
        hasError = true;
    }

    if(hasError) return;

    fetch(contextPath + "/account/check-email", {
        method: "POST",
        headers: {
            "Content-Type": "application/x-www-form-urlencoded",
            "Accept": "application/json"
        },
        body: new URLSearchParams({ email })
    })
        .then(res => res.json())
        .then((data) => {
            if(!data.exists) {
                setAlertContainer(eAlert, MESSAGE.UNREGISTERED_EMAIL);
            } else {
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
}

setAlertContainer = function (container, message) {
    if(container) {
        container.innerHTML = `
        <div class="alert alert-danger alert-dismissible fade show" role="alert">
            \${message}
            <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
        </div>
    `;
    }
}
</script>