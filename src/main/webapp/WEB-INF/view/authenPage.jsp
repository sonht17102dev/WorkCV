<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/layouts/tagJSTL.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Work CV</title>
<%@ include file="/WEB-INF/view/layouts/head.jsp"%>
</head>

<body>
	<%@ include file="/WEB-INF/view/layouts/navHome.jsp"%>
	<div class="hero-wrap hero-wrap-2"
		style="background-image: url('${pageContext.request.contextPath}/resources/assets/images/bg_1.jpg');"
		data-stellar-background-ratio="0.5">
		<div class="overlay"></div>
		<div class="container">
			<div
				class="row no-gutters slider-text align-items-end justify-content-start">
				<div class="col-md-12 text-center mb-5">
					<p class="breadcrumbs mb-0">
						<span class="mr-3"><a
							href="${pageContext.request.contextPath}/">Trang chủ <i
								class="ion-ios-arrow-forward"></i></a></span> đăng nhập<span></span>
					</p>
					<h1 class="mb-3 bread">Đăng nhập / Đăng kí</h1>
				</div>
			</div>
		</div>
	</div>
	<c:if test='${ msg_register_success != null}'>
		<div class="toast" data-delay="2500"
			style="position: fixed; top: 100PX; right: 10PX; z-index: 2000; width: 300px">

			<script>
				swal({
					title : 'Đăng ký thành công',
					text : 'Hãy đăng nhập để sử dụng hệ thống',
					icon : 'success',
					timer : 2000,
					buttons : true,
					type : 'success'
				})
			</script>
		</div>
	</c:if>

	<c:if test='${ msg_register_error != null}'>
		<div class="toast" data-delay="2500"
			style="position: fixed; top: 100PX; right: 10PX; z-index: 2000; width: 300px">

			<script>
				swal({
					title : 'Đăng ký thất bại!',
					text : 'Có gì đó sai sai, bạn nhập lại nhé',
					icon : 'error',
					timer : 2000,
					buttons : true,
					type : 'error'
				})
			</script>
		</div>
	</c:if>
	<c:if test='${ msg_login_error != null}'>
		<div class="toast" data-delay="2500"
			style="position: fixed; top: 100PX; right: 10PX; z-index: 2000; width: 300px">

			<script>
				swal({
					title : 'Đăng nhập thất bại!',
					text : 'Có gì đó sai sai, bạn nhập lại nhé',
					icon : 'error',
					timer : 1000,
					buttons : true,
					type : 'error'
				})
			</script>
		</div>
	</c:if>
	<!-- HOME -->
	<section class="section-hero overlay inner-page bg-image"
		style="background-image: url('${pageContext.request.contextPath}/resources/assets/images/hero_1.jpg');"
		id="home-section">
		<div class="container">
			<div class="row">
				<div class="col-md-7">
					<h1 class="text-white font-weight-bold">Đăng kí / đăng nhập</h1>
					<div class="custom-breadcrumbs">
						<a href="${pageContext.request.contextPath}/">Trang chủ</a> <span
							class="mx-2 slash">/</span> <span class="text-white"><strong>Đăng
								nhập</strong></span>
					</div>
				</div>
			</div>
		</div>
	</section>

	<section class="site-section">
		<div class="container">
			<div class="row">
			<c:choose>
				<c:when test='${action == "signup"}'>
					<div class="col-lg-6 mb-5">
						<h2 class="mb-4">Đăng kí</h2>
						<form:form
							action="${pageContext.request.contextPath}/signup"
							method="POST" modelAttribute="userDTO" class="p-4 border rounded">

							<div class="row form-group">
								<div class="col-md-12 mb-3 mb-md-0">
									<label class="text-black" for="fname">Email</label>
									<form:input type="text" 
										class="form-control" path="emailSignUp" />
									<form:errors path="emailSignUp" cssClass="text-danger" />
								</div>
							</div>

							<div class="row form-group">
								<div class="col-md-12 mb-3 mb-md-0">
									<label class="text-black" for="fname">Họ và tên</label>
									<form:input type="text"
										class="form-control" path="fullName" />
									<form:errors path="fullName" cssClass="text-danger" />
								</div>
							</div>

							<div class="row form-group">
								<div class="col-md-12 mb-3 mb-md-0">
									<label class="text-black" for="fname">Mật khẩu</label>
									<form:input type="password"
										class="form-control" path="passwordSignup" />
									<form:errors path="passwordSignup" cssClass="text-danger" />
								</div>
							</div>
							<div class="row form-group mb-4">
								<div class="col-md-12 mb-3 mb-md-0">
									<label class="text-black" for="fname">Nhập lại mật khẩu</label>
									<form:input type="password" path="repassword"
										class="form-control" />
									<form:errors path="repassword" class="text-danger" />
								</div>
							</div>
							<div class="row form-group">
								<div class="col-md-12 mb-3 mb-md-0">
									<form:label class="text-black" path="roleName">Vai trò</form:label>
									<form:select class="form-control" path="roleName">
										<form:option value="">Chọn vai trò</form:option>
										<form:option value="user">Ứng cử viên</form:option>
										<form:option value="recruiter">Công ty</form:option>
									</form:select>
									<form:errors path="roleName" cssClass="text-danger" />
								</div>
							</div>
							<div class="row form-group">
								<div class="col-md-12">
									<input type="submit" value="Đăng kí"
										class="btn px-4 btn-primary text-white">
								</div>
							</div>
						</form:form>
					</div>
				</c:when>
				<c:otherwise >
					<div class="col-lg-6">
						<h2 class="mb-4">Đăng nhập</h2>
						<form:form action="${pageContext.request.contextPath}/login"
							method="POST" modelAttribute="userLoginDTO"
							class="p-4 border rounded">

							 <div class="row form-group">
            					<div class="col-md-12 mb-3 mb-md-0">
									<label class="text-black" for="fname">Email</label>
									<form:input type="text" 
										class="form-control" path="emailLogin" />
									<form:errors path="emailLogin" cssClass="text-danger" />
								</div>
							</div>
							<div class="row form-group mb-4">
            					<div class="col-md-12 mb-3 mb-md-0">
									<label class="text-black" for="fname">Mật khẩu</label>
									<form:input type="password" 
										class="form-control" path="passwordLogin" />
									<form:errors path="passwordLogin" cssClass="text-danger" />
								</div>
							</div>

							<div class="row form-group justify-content-between">
								<div class="col-md-6">
									<input type="submit" value="Đăng nhập"
										class="btn px-4 btn-primary text-white">
								</div>
							</div>

						</form:form>
					</div>
				</c:otherwise>
				</c:choose>
			</div>
		</div>
	</section>

	<%@ include file="/WEB-INF/view/layouts/footer.jsp"%>
</body>
</html>