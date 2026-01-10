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
                    <form action="/post/write" method="post" enctype="multipart/form-data">

                        <div class="mb-4">
                            <label class="form-label fw-semibold">러닝 사진</label>
                            <input type="file" name="photo" class="form-control rounded-3" id="photoInput" accept="image/*">
                            <div class="mt-3 text-center">
                                <img id="photoPreview"
                                     src="data:image/svg+xml;charset=UTF-8,%3Csvg xmlns='http://www.w3.org/2000/svg' width='600' height='400' viewBox='0 0 600 400'%3E%3Crect width='100%25' height='100%25' fill='%23ced4da'/%3E%3Ctext x='50%25' y='50%25' dominant-baseline='middle' text-anchor='middle' font-family='sans-serif' font-size='24' fill='%236c757d'%3E사진을 등록해 주세요%3C/text%3E%3C/svg%3E"
                                     alt="미리보기"
                                     class="preview-img border"
                                     style="max-width: 100%; height: auto; border-radius: 12px;">
                            </div>
                        </div>

                        <div class="row g-3 mb-4">
                            <div class="col-md-6">
                                <label class="form-label fw-semibold">달린 거리 (km)</label>
                                <input type="number" name="distance" step="0.01" class="form-control rounded-3" placeholder="0.00 km" required>
                            </div>
                            <div class="col-md-6">
                                <label class="form-label fw-semibold">달린 시간</label>
                                <div class="input-group">
                                    <input type="text" name="duration" class="form-control rounded-3" placeholder="00:00:00" required>
                                </div>
                                <small class="text-muted">예: 00:45:30</small>
                            </div>
                        </div>

                        <div class="mb-4">
                            <label class="form-label fw-semibold">오늘의 소감</label>
                            <textarea name="content" class="form-control rounded-3" rows="5" placeholder="오늘 러닝은 어떠셨나요?"></textarea>
                        </div>

                        <div class="d-grid gap-2">
                            <button type="submit" class="btn btn-primary btn-lg rounded-3">기록 완료</button>
                            <a href="javascript:history.back();" class="btn btn-outline-secondary btn-lg rounded-3">취소</a>
                        </div>

                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<%@ include file="../layout/footer.jsp" %>
<%@ include file="../modal/loginModal.jsp" %>
<%@ include file="../modal/alertModal.jsp" %>
<script src="${pageContext.request.contextPath}/resources/js/bootstrap.bundle.min.js" class="astro-vvvwv3sm"></script>
<script>
    document.getElementById('photoInput').onchange = function (evt) {
        const [file] = this.files;
        if (file) {
            const preview = document.getElementById('photoPreview');
            preview.src = URL.createObjectURL(file);
            preview.style.display = 'block';
        }
    }
</script>

</body>
</html>