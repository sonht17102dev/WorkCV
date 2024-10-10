<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/layouts/tagJSTL.jsp"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<nav class="navbar navbar-expand-lg navbar-light bg-light">
	<div class="container-fluid px-md-4	">
		<a class="navbar-brand" href="${contextPath}/">Work CV</a>

		<div class="collapse navbar-collapse" id="ftco-nav">
			<ul class="navbar-nav ml-auto">
				<li class="nav-item active"><a href="${contextPath}/"
					class="nav-link">Trang chủ</a></li>

				<c:choose>
					<c:when test="${userLogin.role.roleName == null }">
						<li class="nav-item cta cta-colored"><a
							href="${contextPath}/auth?action=login" class="nav-link">Đăng
								nhập</a></li>
						<li class="nav-item cta cta-colored"><a
							href="${contextPath}/auth?action=signup" class="nav-link">Đăng
								Ký</a></li>
					</c:when>
					<c:otherwise>
					</c:otherwise>
				</c:choose>

				<c:if test='${userLogin.role.roleName.equals("recruiter")}'>
					<li class="nav-item"><a
						href="${contextPath}/recruitment/get-list-apply/${recruitment_of_company.id}"
						class="nav-link">Ứng cử viên</a></li>
					<li class="nav-item cta cta-colored"><a
						class="dropdown-toggle nav-link" href="#" role="button"
						data-toggle="dropdown" aria-expanded="false">
							${userLogin.fullName} </a>
						<ul class="dropdown-menu bg-light">
							<li><a href="${contextPath}/user/profile/${userLogin.id}">Hồ
									Sơ</a></li>
							<li><a href="${contextPath}/recruitment/list-post">Danh
									sách bài đăng</a></li>
							<c:if test="${userLogin != null}">
								<li><a href="${contextPath}/logout">Đăng xuất</a></li>
							</c:if>
						</ul></li>
					<li class="nav-item cta cta-colored"><a
						class="btn btn-primary" href="${contextPath}/recruitment/post/add">
							Đăng Tuyển </a></li>
				</c:if>
				<c:if test='${userLogin.role.roleName.equals("user")}'>
					<li class="nav-item"><a href="${contextPath}/user/list-post"
						class="nav-link">Công việc</a></li>
					<li class="nav-item"><a
						href="${contextPath}/user/list-company" class="nav-link">Công
							ty</a></li>
					<li class="nav-item cta cta-colored"><a
						class="dropdown-toggle nav-link" href="#" role="button"
						data-toggle="dropdown" aria-expanded="false">
							${userLogin.fullName} </a>
						<ul class="dropdown-menu bg-light">
							<li><a href="${contextPath}/user/profile/${userLogin.id}">Hồ
									Sơ</a></li>
							<li><a href="${contextPath}/user/list-save-job">Công
									việc đã lưu</a></li>
							<li><a href="${contextPath}/user/list-follow-company">Công
									ty đã lưu</a></li>
							<li><a href="${contextPath}/user/get-list-apply">Công
									việc đã ứng tuyển</a></li>
							<c:if test="${userLogin != null}">
								<li><a href="${contextPath}/logout">Đăng xuất</a></li>
							</c:if>
						</ul></li>

				</c:if>
			</ul>
		</div>
	</div>
</nav>
