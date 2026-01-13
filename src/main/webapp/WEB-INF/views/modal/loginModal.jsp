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
                    <small>아직 회원이 아니신가요? </small><a href="account/sign-up">회원 가입</a>
                </div>
            </div>
        </div>
    </div>
</div>
