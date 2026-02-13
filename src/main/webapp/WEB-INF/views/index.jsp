<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!doctype html>
<html lang="ko" data-bs-theme="auto">

<%@ include file="layout/header.jsp" %>

<link rel="stylesheet" href="/resources/css/page/index.css" >

<body>
<div class="container-fluid bg-body-tertiary">
    <div class="row justify-content-center py-4">
        <div class="col-md-10 col-lg-6 col-xl-5">

            <c:choose>
                <%--  post 없을 때 --%>
                <c:when test="${empty posts}">
                    <div class="text-center py-5 mt-5">
                        <i class="bi bi-pavement-check text-secondary" style="font-size: 5rem; opacity: 0.3;"></i>
                        <h4 class="fw-bold text-body">아직 올라온 기록이 없어요</h4>
                        <p class="text-body-secondary">첫 번째 러닝 주인공이 되어보세요! 🏃‍♂️💨</p>
                        <a href="${pageContext.request.contextPath}/post/write" class="btn btn-primary rounded-pill px-4 mt-3">첫 기록 남기기</a>
                    </div>
                </c:when>

                <%-- post 있을 때 --%>
                <c:otherwise>
                    <c:forEach var="post" items="${posts}">
                        <div class="card mb-4 border-0 shadow-sm rounded-4 mx-auto" style="max-width: 600px;">
                            <div class="card-header border-0 py-3 d-flex align-items-center bg-transparent">
                                <a href="${pageContext.request.contextPath}/profile/${post.userId}" class="text-decoration-none d-flex align-items-center">
                                    <div class="rounded-circle me-2 bg-secondary-subtle d-flex align-items-center justify-content-center" style="width: 32px; height: 32px;">
                                        <i class="bi bi-person-fill text-secondary"></i>
                                    </div>
                                    <span class="fw-bold text-body">${post.username}</span>
                                </a>
                            </div>

                            <div id="carousel-${post.id}" class="carousel slide" data-bs-ride="false">
                                <div class="carousel-indicators">
                                    <c:forEach var="photo" items="${post.photos}" varStatus="status">
                                        <button type="button" data-bs-target="#carousel-${post.id}"
                                                data-bs-slide-to="${status.index}"
                                                class="${status.first ? 'active' : ''}"
                                                aria-current="${status.first ? 'true' : 'false'}"></button>
                                    </c:forEach>
                                </div>
                                <div class="carousel-inner">
                                    <c:forEach var="photo" items="${post.photos}" varStatus="status">
                                        <div class="carousel-item ${status.first ? 'active' : ''}">
                                            <img src="${pageContext.request.contextPath}/upload/thumbnail/${photo}"
                                                 class="d-block w-100 card-img-top rounded-0"
                                                 style="aspect-ratio: 1/1; object-fit: cover;">
                                        </div>
                                    </c:forEach>
                                </div>

                                    <%-- 사진이 2장 이상일 때만 버튼 표시 --%>
                                <c:if test="${post.photos.size() > 1}">
                                    <button class="carousel-control-prev" type="button" data-bs-target="#carousel-${post.id}" data-bs-slide="prev">
                                        <span class="carousel-control-prev-icon"></span>
                                    </button>
                                    <button class="carousel-control-next" type="button" data-bs-target="#carousel-${post.id}" data-bs-slide="next">
                                        <span class="carousel-control-next-icon"></span>
                                    </button>
                                </c:if>
                            </div>

                            <div class="card-body">
                                <p class="card-text"><span class="fw-bold me-2">${post.username}</span>${post.content}</p>
                                <small class="text-body-secondary">${post.formattedDate}</small>
                            </div>
                        </div>
                    </c:forEach>
                </c:otherwise>
            </c:choose>

        </div>
    </div>
</div>
<%@ include file="layout/footer.jsp" %>

<script>
const alertModalDiv = document.getElementById("alertModal");
const alertMessage = document.getElementById("alertMessage");
const alertModal = new bootstrap.Modal(alertModalDiv);


window.onload = function () {
    //리다이렉트시 modal 띄우기
    const message = "${message}";
    if(message) {
        alertMessage.textContent = message;
        alertModal.show();
    }
}

</script>
</body>
</html>

