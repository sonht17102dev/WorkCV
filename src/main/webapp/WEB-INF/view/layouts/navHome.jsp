<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/layouts/tagJSTL.jsp"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
	<div class="container-fluid px-md-4	">
		<a class="navbar-brand" href="${contextPath}/">Work
			CV</a>

		<div class="collapse navbar-collapse" id="ftco-nav">
			<ul class="navbar-nav ml-auto">
				<li class="nav-item active"><a
					href="${contextPath}/" class="nav-link">Trang
						chủ</a></li>
				<li class="'nav-item"><a href="/" class="nav-link">Công
						việc</a></li>
				<li class="nav-item"><a href="${contextPath}/list-apply-job" class="nav-link">Ứng cử
						viên</a></li>
				
				<c:choose>
					<c:when test="${userLogin.role.roleName == null }">
						<li class="nav-item cta cta-colored"><a
							href="${contextPath}/auth?action=login"
							class="nav-link">Đăng nhập</a></li>
						<li class="nav-item cta cta-colored"><a
							href="${contextPath}/auth?action=signup"
							class="nav-link">Đăng Ký</a></li>	
					</c:when>
					<c:otherwise>
					</c:otherwise>
				</c:choose>
				
				<c:if test='${userLogin.role.roleName.equals("recruiter")}'>
					<li class="nav-item cta cta-colored">
					<a class="dropdown-toggle nav-link" href="#" role="button"
						data-toggle="dropdown" aria-expanded="false"> ${userLogin.fullName} </a>
						<ul class="dropdown-menu bg-light">
							<li><a href="${contextPath}/user/profile/${userLogin.id}">Hồ Sơ</a></li>
							<li><a href="${contextPath}/recruitment/list-post">Danh sách bài đăng</a></li>
							<c:if test="${userLogin != null}">
							<li><a href="${contextPath}/logout">Đăng
									xuất</a></li>
							</c:if>
						</ul>
					</li>
					<li class="nav-item cta cta-colored"><a
						class="btn btn-primary" href="${contextPath}/recruitment/post?action=add" > Đăng Tuyển </a>
					</li>
				</c:if>
				<c:if test='${userLogin.role.roleName.equals("user")}'>
					<li class="nav-item cta cta-colored">
					<a class="dropdown-toggle nav-link" href="#" role="button"
						data-toggle="dropdown" aria-expanded="false"> ${userLogin.fullName} </a>
						<ul class="dropdown-menu bg-light">
							<li><a href="${contextPath}/user/profile/${userLogin.id}">Hồ Sơ</a></li>
							<c:if test="${userLogin != null}">
							<li><a href="${contextPath}/logout">Đăng
									xuất</a></li>
							</c:if>
						</ul>
					</li>
					<li class="nav-item cta cta-colored"><a
						class="btn btn-primary" href="${contextPath}/recruitment/post?action=add" > Đăng Tuyển </a>
					</li>
				</c:if>
			</ul>
		</div>
	</div>
</nav>

<%-- <nav class="header_menu" class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
    <div class="container-fluid px-md-4	">
        <a class="navbar-brand" href="${pageContext.request.contextPath}/">Work CV</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
          <span class="oi oi-menu"></span> Menu
        </button>
    
        <div class="collapse navbar-collapse" id="ftco-nav">
          <ul class="navbar-nav ml-auto">
            <li class="nav-item active"><a href="${pageContext.request.contextPath}/" class="nav-link">Trang chủ</a></li>
            <li class="'nav-item"><a href="/" class="nav-link">Công việc</a></li>
            <li class="nav-item"><a href="/" class="nav-link">Ứng cử viên</a></li>
    <!--        <li class="nav-item"><a href="blog.html" class="nav-link">Công ty</a></li>-->
    
            <li class="nav-item"><a href="/"class="nav-link" >Fullname
    
              <ul class="dropdown">
                <li><a href="/">Hồ Sơ</a></li>
    <!--            <li><a href="service-single.html">Đổi mật khẩu</a></li>-->
                <li ><a href="/save-job/get-list" >Công việc đã lưu</a></li>
                <li ><a href="/user/list-post" >Danh sách bài đăng</a></li>
                <li ><a href="/user/get-list-apply" >Công việc đã ứng tuyển</a></li>
                <li ><a href="/user/get-list-company" >Công ty đã theo dõi</a></li>
    <!--            <li th:if="${session.user.role.id == 2}"><a href="/auth/logout" >Ứng cử viên tiềm năng</a></li>-->
                <li><a href="${pageContext.request.contextPath}/auth/logout" >Đăng xuất</a></li>
    
              </ul>
              </a>
            </li>
    
              <li></li>
    
              <li class="nav-item cta mr-md-1"><a href="/recruitment/post" class="nav-link">Đăng tuyển</a></li>
            <li class="nav-item cta cta-colored"><a href="${pageContext.request.contextPath}/auth/login" class="nav-link">Đăng nhập</a></li>
            <li class="nav-item cta cta-colored"><a href="${pageContext.request.contextPath}/auth/signup" class="nav-link">Đăng Ký</a></li>
    
          </ul>
        </div>
      </div>
</nav> --%>
<!-- END nav -->