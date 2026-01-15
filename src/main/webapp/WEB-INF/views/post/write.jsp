<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko" data-bs-theme="auto">

<%@ include file="../layout/header.jsp" %>
<%@ include file="../layout/theme-toggle.jsp" %>

<body>
<div class="container py-5">
    <div class="row justify-content-center">
        <div class="col-md-8 col-lg-6">
            <div class="card border-0 shadow rounded-4">
                <div class="card-header p-4 border-bottom-0">
                    <h2 class="fw-bold mb-0">오늘의 러닝 기록</h2>
                </div>

                <div class="card-body p-4 pt-0">
                    <form action="${pageContext.request.contextPath}/post/write" method="post" id="postFrom" enctype="multipart/form-data">
                        <!-- 운동명 -->
                        <div class="mb-4">
                            <input type="text" name="title" id="titleInput" class="form-control rounded-3"
                                   placeholder="아침 조깅, LSD, 10km, 빌드업" required>
                            <small class="text-muted">오늘의 운동을 적어주세요.</small>
                        </div>
                        <!-- 사진 -->
                        <div class="mb-4">
                            <label class="form-label fw-semibold">러닝 사진 (최대 4장)></label>
                            <input type="file" name="photos" class="form-control rounded-3" id="photoInput" accept="image/*" multiple>
                            <div id="previewContainer" class="row g-2 mt-3">
                                <div class="col-12 text-center text-muted" id="emptyMessage">
                                    <small>사진을 등록해 주세요 (최대 4장)</small>
                                </div>
                            </div>
                        </div>
                        <!-- 거리, 시간 -->
                        <div class="row g-3 mb-4">
                            <div class="col-md-6">
                                <label class="form-label fw-semibold">달린 거리 (km)</label>
                                <input type="number" id="distanceInput" name="distance" step="0.01" class="form-control rounded-3" placeholder="0.00 km" required>
                            </div>
                            <div class="col-md-6">
                                <label class="form-label fw-semibold">달린 시간</label>
                                <div class="input-group">
                                    <input type="text" id="durationInput" name="duration" class="form-control rounded-3" placeholder="00:00:00" required>
                                </div>
                                <small class="text-muted">예: 00:45:30</small>
                            </div>
                        </div>
                        <!-- 소감 -->
                        <div class="mb-4">
                            <label class="form-label fw-semibold">오늘의 소감</label>
                            <textarea name="content" id="contentInput" class="form-control rounded-3" rows="5" placeholder="오늘 운동은 어떠셨나요?"></textarea>
                        </div>

                        <div class="d-grid gap-2">
                            <button type="button" onclick="postSubmit()" class="btn btn-primary btn-lg rounded-3">기록 완료</button>
                            <a href="javascript:history.back();" class="btn btn-outline-secondary btn-lg rounded-3">취소</a>
                        </div>

                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<%@ include file="../layout/footer.jsp" %>
<%@ include file="../modal/alertModal.jsp" %>

<script src="${pageContext.request.contextPath}/resources/js/bootstrap.bundle.min.js" class="astro-vvvwv3sm"></script>
<script src="${pageContext.request.contextPath}/resources/js/common.js"></script>
<script>
const alertModalDiv = document.getElementById("alertModal");
const alertMessage = document.getElementById("alertMessage");
const alertModal = new bootstrap.Modal(alertModalDiv);

document.getElementById("photoInput").onchange = function (event) {
    const previewContainer = document.getElementById("previewContainer");
    const files = this.files;

    previewContainer.innerHTML = "";

    //사진 없을때
    if(files.length === 0) {
        previewContainer.innerHTML = "<div class='col-12 text-center text-muted'><small>사진을 등록해 주세요 (최대 4장)</small></div>";
        return;
    }

    //사진 4장으로 제한
    if (files.length > 4) {
        alertMessage.textContent = "사진은 최대 4장까지만 선택 가능합니다.";
        alertModal.show();
        this.value = ""; // 파일 선택 취소
        previewContainer.innerHTML = "<div class='col-12 text-center text-muted'><small>사진을 등록해 주세요 (최대 4장)</small></div>";
        return;
    }

    if(files && files.length > 0) {
        Array.from(files).forEach(file => {
            const reader = new FileReader();
            reader.onload = function (e) {
                const div = document.createElement("div");
                div.className = "col-6 col-md-3 position-relative";
                const img = document.createElement("img");
                img.src = e.target.result;
                img.className = 'preview-img border shadow-sm';
                img.style.width = '100%';
                img.style.height = '120px';
                img.style.objectFit = 'cover';
                img.style.borderRadius = '12px';

                div.appendChild(img);
                previewContainer.appendChild(div);
            }
            reader.readAsDataURL(file);
        })
    }
}

postSubmit = function () {
    const title = document.getElementById("titleInput").value.trim();
    const photo = document.getElementById("photoInput").files;
    const distance = document.getElementById("distanceInput").value.trim();
    const duration = document.getElementById("durationInput").value.trim();
    const content = document.getElementById("contentInput").value.trim();

    const validations = [
        {value: title, message: MESSAGE.EMPTY_TITLE, id: "titleInput"},
        {value: photo, message: MESSAGE.EMPTY_PHOTO, id: "photoInput"},
        {value: distance, message: MESSAGE.EMPTY_DISTANCE, id: "distanceInput"},
        {value: duration, message: MESSAGE.EMPTY_DURATION, id: "durationInput"},
    ]

    for (const item of validations) {
        if(!item.value || item.value.length === 0) {
            alertMessage.textContent = item.message;
            alertModal.show();
            showFocusAfterModal(item.id);
            return;
        }
    }

    document.getElementById("postFrom").submit();
}

showFocusAfterModal = function (inputId) {
    alertModalDiv.addEventListener("hidden.bs.modal", function () {
        document.getElementById(inputId).focus();
    }, {once: true})
}
</script>

</body>
</html>