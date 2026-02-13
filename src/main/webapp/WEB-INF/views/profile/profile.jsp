<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="ko">

<%@ include file="../layout/header.jsp" %>
<link rel="stylesheet" href="/resources/css/page/profile.css">

<body>
<div class="container mt-5" style="max-width: 935px;">
    <div class="row mb-5 align-items-center">
        <div class="col-md-4 text-center">
            <img src="${user.profileImage != null ? user.profileImage : '/resources/images/default-profile.png'}"
                 class="rounded-circle border profile-img" alt="프로필 이미지">
        </div>
        <div class="col-md-8">
            <div class="d-flex align-items-center mb-3">
                <h2 class="fw-light mb-0 me-3">${user.username}</h2>
                <sec:authorize access="isAuthenticated()">
                    <c:if test="${user.id == principal.id}">
                        <a href="${pageContext.request.contextPath}/profile/edit" class="btn btn-outline-secondary btn-sm fw-bold">프로필 편집</a>
                    </c:if>
                </sec:authorize>
            </div>

            <div class="d-flex gap-4 mb-3">
                <span>게시물 <strong>${postCount}</strong></span>
                <span>팔로워 <strong>0</strong></span>
                <span>팔로우 <strong>0</strong></span>
            </div>

            <div>
                <span class="fw-bold">${user.nickname != null ? user.nickname : user.username}</span>
                <p class="mt-1">${user.bio != null ? user.bio : '러닝은 즐거워! 🏃‍♂️💨'}</p>
            </div>
        </div>
    </div>

    <hr class="my-4">

    <div class="row g-1">
        <c:choose>
            <c:when test="${empty posts}">
                <div class="text-center py-5">
                    <p class="text-secondary">아직 게시물이 없습니다.</p>
                </div>
            </c:when>
            <c:otherwise>
                <c:forEach var="post" items="${posts}">
                    <div class="col-4">
                        <div class="post-grid-item" onclick="location.href='${pageContext.request.contextPath}/post/${post.id}'">
                            <img src="${pageContext.request.contextPath}/upload/thumbnail/${post.photos[0]}" alt="게시글 이미지">
                            <div class="post-icons">
                                <i class="bi bi-heart-fill"></i> </div>
                        </div>
                    </div>
                </c:forEach>
            </c:otherwise>
        </c:choose>
    </div>
</div>

<%@ include file="../layout/footer.jsp" %>
</body>
</html>