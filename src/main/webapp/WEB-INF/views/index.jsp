<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<!doctype html>
<html lang="ko" data-bs-theme="auto">

<%-- head 공통 --%>
<%@ include file="layout/header.jsp" %>

<body>
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
<svg xmlns="http://www.w3.org/2000/svg" class="d-none">
    <symbol id="arrow-right-circle" viewBox="0 0 16 16">
        <path
                d="M8 0a8 8 0 1 1 0 16A8 8 0 0 1 8 0zM4.5 7.5a.5.5 0 0 0 0 1h5.793l-2.147 2.146a.5.5 0 0 0 .708.708l3-3a.5.5 0 0 0 0-.708l-3-3a.5.5 0 1 0-.708.708L10.293 7.5H4.5z"
        ></path>
    </symbol>
    <symbol id="bootstrap" viewBox="0 0 118 94">
        <title>Bootstrap</title>
        <path
                fill-rule="evenodd"
                clip-rule="evenodd"
                d="M24.509 0c-6.733 0-11.715 5.893-11.492 12.284.214 6.14-.064 14.092-2.066 20.577C8.943 39.365 5.547 43.485 0 44.014v5.972c5.547.529 8.943 4.649 10.951 11.153 2.002 6.485 2.28 14.437 2.066 20.577C12.794 88.106 17.776 94 24.51 94H93.5c6.733 0 11.714-5.893 11.491-12.284-.214-6.14.064-14.092 2.066-20.577 2.009-6.504 5.396-10.624 10.943-11.153v-5.972c-5.547-.529-8.934-4.649-10.943-11.153-2.002-6.484-2.28-14.437-2.066-20.577C105.214 5.894 100.233 0 93.5 0H24.508zM80 57.863C80 66.663 73.436 72 62.543 72H44a2 2 0 01-2-2V24a2 2 0 012-2h18.437c9.083 0 15.044 4.92 15.044 12.474 0 5.302-4.01 10.049-9.119 10.88v.277C75.317 46.394 80 51.21 80 57.863zM60.521 28.34H49.948v14.934h8.905c6.884 0 10.68-2.772 10.68-7.727 0-4.643-3.264-7.207-9.012-7.207zM49.948 49.2v16.458H60.91c7.167 0 10.964-2.876 10.964-8.281 0-5.406-3.903-8.178-11.425-8.178H49.948z"
        ></path>
    </symbol>
</svg>
<div class="col-lg-8 mx-auto p-4 py-md-5">
    <header
            class="d-flex flex-wrap align-items-center justify-content-center justify-content-md-between py-3 mb-4 border-bottom"
    >
        <div class="col-md-3 mb-2 mb-md-0">
            <a
                    href="/"
                    class="d-inline-flex link-body-emphasis text-decoration-none"
            >
                <svg
                        class="bi"
                        width="40"
                        height="32"
                        role="img"
                        aria-label="Bootstrap"
                >
                    <use xlink:href="${pageContext.request.contextPath}/resources/image/lightning.svg"></use>
                </svg>
            </a>
        </div>
        <ul
                class="nav col-12 col-md-auto mb-2 justify-content-center mb-md-0"
        >
            <li><a href="#" class="nav-link px-2 link-secondary">Home</a></li>
            <li><a href="#" class="nav-link px-2">Features</a></li>
            <li><a href="#" class="nav-link px-2">Pricing</a></li>
            <li><a href="#" class="nav-link px-2">FAQs</a></li>
            <li><a href="#" class="nav-link px-2">About</a></li>
        </ul>
        <div class="col-md-3 text-end">
            <button type="button" class="btn btn-outline-primary me-2">
                Login
            </button>
            <button type="button" class="btn btn-primary" data-bs-toggle="modal", data-bs-target="#modalSignUp">Sign-up</button>
        </div>
    </header>
    <main>
        <h1 class="text-body-emphasis">Get started with Bootstrap</h1>
        <p class="fs-5 col-md-8">
            Quickly and easily get started with Bootstrap's compiled,
            production-ready files with this barebones example featuring some
            basic HTML and helpful links. Download all our examples to get
            started.
        </p>
        <div class="mb-5">
            <a href="#" class="btn btn-primary btn-lg px-4"
            >gogogogogo</a
            >
        </div>
        <hr class="col-3 col-md-2 mb-5" />
        <div class="row g-5">
            <div class="col-md-6">
                <h2 class="text-body-emphasis">Starter projects</h2>
                <p>
                    Ready to go beyond the starter template? Check out these open
                    source projects that you can quickly duplicate to a new GitHub
                    repository.
                </p>
            </div>
        </div>
    </main>
    <footer class="pt-5 my-5 text-body-secondary border-top">
        Created by the Bootstrap team &middot; &copy; 2025
    </footer>
</div>
<div
        class="modal fade"
        tabindex="-1"
        role="dialog"
        id="modalSignUp"
        aria-hidden="true"
        data-bs-backdrop="static"
>
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content rounded-4 shadow">
            <div class="modal-header p-5 pb-4 border-bottom-0">
                <h1 class="fw-bold mb-0 fs-2">회원 가입을 해주세요</h1>
                <button
                        type="button"
                        class="btn-close"
                        data-bs-dismiss="modal"
                        aria-label="Close"
                ></button>
            </div>
            <div class="modal-body p-5 pt-0">
                <form class="">
                    <div class="form-floating mb-3">
                        <input
                                type="email"
                                class="form-control rounded-3"
                                id="emailInput"
                                placeholder="name@example.com"
                        />
                        <label for="floatingInput">Email address</label>
                    </div>
                    <div id="signUpAlert">

                    </div>
                    <small class="text-body-secondary d-block mt-1 mb-3"
                    >가입할 이메일을 입력해 주세요.</small
                    >
                    <button
                            class="w-100 mb-2 btn btn-lg rounded-3 btn-primary alert-dismissible"
                            type="button"
                            id="signUpButon"
                    >
                        Sign up
                    </button>
                    <hr class="my-4" />
                    <h2 class="fs-5 fw-bold mb-3">추후 수정</h2>
                    <button
                            class="w-100 py-2 mb-2 btn btn-outline-secondary rounded-3"
                            type="submit"
                    >
                        <svg class="bi me-1" width="16" height="16" aria-hidden="true">
                            <use xlink:href="#"></use>
                        </svg>
                        Sign up with Google
                    </button>
                    <button
                            class="w-100 py-2 mb-2 btn btn-outline-primary rounded-3"
                            type="submit"
                    >
                        <svg class="bi me-1" width="16" height="16" aria-hidden="true">
                            <use xlink:href="#"></use>
                        </svg>
                        Sign up with Facebook
                    </button>
                    <button
                            class="w-100 py-2 mb-2 btn btn-outline-secondary rounded-3"
                            type="submit"
                    >
                        <svg class="bi me-1" width="16" height="16" aria-hidden="true">
                            <use xlink:href="#"></use>
                        </svg>
                        Sign up with GitHub
                    </button>
                </form>
            </div>
        </div>
    </div>
</div>
<script
        src="${pageContext.request.contextPath}/resources/js/bootstrap.bundle.min.js"
        class="astro-vvvwv3sm"
></script>
<script>
window.onload = function () {
    const signUpBtn = document.getElementById("signUpButon");
    signUpBtn.addEventListener('click', function (e) {
        e.preventDefault();
        checkEmail();
    })
}

checkEmail = function () {
    const email = document.getElementById("emailInput").value;
    const contextPath = "${pageContext.request.contextPath}";

    fetch(contextPath + "/account/check-email", {
        method: "POST",
        headers: {
            "Content-Type": "application/x-www-form-urlencoded; charset=UTF-8",
            "Accept": "application/json"
        },
        body: new URLSearchParams({ email })
    })
        .then(res => res.json())
        .then((data) => {
            const alertContainer = document.getElementById("signUpAlert");
            if(data.exists) {
            alertContainer.innerHTML = `
                <div class="alert alert-danger alert-dismissible fade show" role="alert">
                        이미 가입된 이메일입니다.
                    <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                </div>
            `
        }else {
            //회원가입 페이지 이동, 이메일 값 넘겨주기
            location.href = contextPath + "account/sign-up?email=" + encodeURIComponent(email);
        }
    })
}

goSignUp = function () {

}
</script>
</body>
</html>

