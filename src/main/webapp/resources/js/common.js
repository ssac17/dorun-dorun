const CONST = {
    REGEX_PASSWORD: /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{10,}$/,
    FORM_URLENCODED: "application/x-www-form-urlencoded; charset=UTF-8",
    JSON: "application/json",
    ACCEPT_JSON: "application/json",
    POST: "POST",
    GET: "GET",
}

const MESSAGE = {
    REQUIRED_EMAIL: "이메일을 입력해 주세요!",
    REQUIRED_PASSWORD: "비밀번호를 입력해 주세요!",
    INVALID_PASSWORD: "비밀번호는 10자 이상이며 대문자, 소문자, 숫자, 특수문자를 모두 포함해야 합니다.",
    REQUIRED_LOGIN: "로그인을 먼저 해주세요.",
}