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
    REQUIRED_LOGIN: "로그인을 먼저 해주세요!",
    EMPTY_TITLE: "운동 이름을 입력해 주세요!",
    EMPTY_PHOTO: "사진을 추가해 주세요!",
    EMPTY_DISTANCE: "달린 거리를 입력해 주세요!",
    EMPTY_DURATION: "달린 시간을 입력해 주세요!",
}