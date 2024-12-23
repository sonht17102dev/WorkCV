<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/layouts/tagJSTL.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>

<%@ include file="/WEB-INF/view/layouts/head.jsp"%>
<title>Work CV</title>
</head>

<body>
	<%@ include file="/WEB-INF/view/layouts/navHome.jsp"%>
	<c:set var="contextPath" value="${pageContext.request.contextPath}" />

	<div class="hero-wrap hero-wrap-2"
		style="background-image: url('${contextPath}/resources/assets/images/bg_1.jpg');"
		data-stellar-background-ratio="0.5">
		<div class="overlay"></div>
		<div class="container">
			<div
				class="row no-gutters slider-text align-items-end justify-content-start">
				<div class="col-md-12 text-center mb-5">
					<p class="breadcrumbs mb-0">
						<span class="mr-3"><a href="${contextPath}/">Trang chủ
								<i class="ion-ios-arrow-forward"></i>
						</a></span>Chi tiết <span></span>
					</p>
					<h1 class="mb-3 bread">Chi tiết công việc</h1>
				</div>
			</div>
		</div>
	</div>

	<section style="margin-top: 10px" class="site-section">
		<div class="container">
			<div class="row align-items-center mb-5">
				<div class="col-lg-8 mb-4 mb-lg-0">
					<div class="d-flex align-items-center">
						<div class="border p-2 d-inline-block mr-3 rounded">

							<c:url value="/resources/assets/images/${company.logo}"
								var="logo" />
							<a href="${contextPath}/user/detail-company/${company.id}"><img
								width="100" height="100" src="${logo}" alt="Image"></a>
						</div>
						<div>
							<h2></h2>
							<div>
								<span class="icon-briefcase mr-2"></span><a
									class="ml-0 mr-2 mb-2"></a> <span class="icon-room mr-2"></span><span
									class="m-2"></span> <span class="icon-clock-o mr-2"></span><span
									class="m-2"></span>
							</div>
							<input type="hidden">
						</div>
					</div>
				</div>
				<div class="col-lg-4">
					<div class="row">
						<div class="col-6">
							<a class="btn btn-block btn-light btn-md"
								onclick="save(${recruitment.id})"> <span
								class="icon-heart-o mr-2 text-danger"></span>Lưu
							</a>
						</div>
						<div class="col-6">
							<a data-toggle="modal"
								data-target="#exampleModal${recruitment.id}"
								class="btn btn-block btn-primary btn-md">Ứng tuyển</a>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-8">
					<div class="mb-5">

						<h3 class="h5 d-flex align-items-center mb-4 text-primary">
							<span class="icon-align-left mr-3"></span>Mô tả công việc
						</h3>
						<p>${recruitment.description}</p>
					</div>

				</div>
				<div class="col-lg-4">
					<div class="bg-light p-3 border rounded mb-4">
						<h3 class="text-primary  mt-3 h5 pl-3 mb-3 ">Tóm tắt công
							việc</h3>
						<ul class="list-unstyled pl-3 mb-0">
							<li class="mb-2"><strong class="text-black">Ngày
									tạo: </strong> <span>${recruitment.createdAt}</span></li>
							<li class="mb-2"><strong class="text-black">Kiểu
									công việc: </strong> <span>${recruitment.type}</span></li>
							<li class="mb-2"><strong class="text-black">Loại
									công việc: </strong> <span">${recruitment.category.name}</span></li>
							<li class="mb-2"><strong class="text-black">Kinh
									nghiệm: </strong> <span>${recruitment.experience} </span></li>
							<li class="mb-2"><strong class="text-black">Địa
									chỉ: </strong> <span> ${recruitment.address}</span></li>
							<li class="mb-2"><strong class="text-black">Lương:
							</strong> <span> ${recruitment.salary} </span></li>
							<li class="mb-2"><strong class="text-black">Số
									lượng: </strong><span>${recruitment.quantity}</span></li>
							<li class="mb-2"><strong class="text-black">Hạn nộp
									cv: </strong><span>${recruitment.deadline}</span></li>
						</ul>
					</div>

					<div class="bg-light p-3 border rounded">
						<h3 class="text-primary  mt-3 h5 pl-3 mb-3 ">Share</h3>
						<div class="px-3">
							<a href="#" class="pt-3 pb-3 pr-3 pl-0"><span
								class="icon-facebook"></span></a> <a href="#"
								class="pt-3 pb-3 pr-3 pl-0"><span class="icon-twitter"></span></a>
							<a href="#" class="pt-3 pb-3 pr-3 pl-0"><span
								class="icon-linkedin"></span></a> <a href="#"
								class="pt-3 pb-3 pr-3 pl-0"><span class="icon-pinterest"></span></a>
						</div>
					</div>

				</div>
			</div>
		</div>
	</section>
	<input type="hidden" id="idRe${recruitment.id}"
		value="${recruitment.id}">
	<!-- Modal -->
	<div class="modal fade" id="exampleModal${recruitment.id}"
		tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
		aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">
						Ứng tuyển: <span>${recruitment.title}</span>
					</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<form method="post" action="/user/apply-job">
					<input type="hidden" id="userLoginId" value="${userLogin.id}" />
					<div class="modal-body">
						<div class="row">
							<div class="col-12">
								<select id="choose${recruitment.id}"
									onchange="choosed(${recruitment.id})" class="form-control"
									aria-label="Default select example">
									<option selected>Chọn phương thức nộp</option>
									<option value="1">Dùng cv đã cập nhật</option>
									<option value="2">Nộp cv mới</option>
								</select>
							</div>
							<div id="loai1${recruitment.id}" style="display: none"
								class="col-12">
								<label for="fileUpload" class="col-form-label">Giới
									thiệu:</label>
								<textarea rows="10" cols="3" class="form-control"
									id="text${recruitment.id}"></textarea>
							</div>
							<div id="loai2${recruitment.id}" style="display: none"
								class="col-12">

								<label for="fileUpload" class="col-form-label">Chọn cv:</label>
								<input type="file" class="form-control"
									id="fileUpload${recruitment.id}" name="file" required>
								<p class="text-error" id="errorFile"></p>
								<label for="fileUpload" class="col-form-label">Giới
									thiệu:</label>
								<p class="text-error" id="errorText"></p>
								<textarea rows="10" cols="3" class="form-control"
									id="text${recruitment.id}"></textarea>
							</div>

						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary"
								data-dismiss="modal">Đóng</button>
							<button type="button" id="button1${recruitment.id}"
								style="display: none" onclick="apply1(${recruitment.id})"
								class="btn btn-primary">Nộp</button>
							<button type="button" id="button2${recruitment.id}"
								style="display: none" onclick="apply(${recruitment.id})"
								class="btn btn-primary">Nộp</button>
						</div>
					</div>
				</form>


			</div>
		</div>
	</div>
	<section class="site-section" id="next">
		<div class="container">

			<div class="row my-5 justify-content-center">
				<div class="col-md-7 text-center">
					<c:if test='${userLogin.role.roleName.equals("recruiter")}'>
						<a
							href="${contextPath}/recruitment/get-list-apply/${recruitmentId}">
							<h2 class="section-title mb-2">Danh sách ứng viên ứng tuyển
							</h2>
						</a>
					</c:if>
					<c:if test='${userLogin.role.roleName.equals("user")}'>
						<h2 class="section-title mb-2">Những công việc liên quan</h2>
					</c:if>
				</div>
			</div>
			<c:if
				test='${userLogin.role.roleName.equals("recruiter") && applyPosts != null}'>
				<div class="row">
					<div class="col-lg-12 pr-lg-4">
						<div class="row">
							<c:if test="${applyPosts.size() != 0}">
								<c:forEach var="applyPost" items="${applyPosts}">
									<div class="col-md-12"
										style="box-shadow: rgba(0, 0, 0, 0.4) 0px 0px 10px; margin: 20px auto;">
										<div class="team d-md-flex p-4 bg-white">
											<c:set var="imageApplyUser"
												value="${contextPath}/resources/assets/images/${applyPost.user.image}" />

											<img class="img"
												src="${applyPost.user.image != null ? imageApplyUser : 'https://st.quantrimang.com/photos/image/072015/22/avatar.jpg'}"></IMG>
											<div class="text pl-md-4">
												<h5 class="location mb-0">${applyPost.user.fullName}</h5>
												<p style="display: block; color: black">${applyPost.user.address}</p>
												<span class="position" style="display: block; color: black">${applyPost.user.email}</span>
												<p class="mb-4" style="width: 700px">${applyPost.user.description}</p>
												<div class="row">
													<c:if test="${applyPost.nameCv != null}">
														<c:set var="cvUrl"
															value="${contextPath}/resources/assets/images/${applyPost.nameCv}" />
														<p>
															<a class="btn btn-primary" href="${cvUrl}">Xem cv </a>
														</p>
													</c:if>
													<c:if test="${applyPost.status == 0}">
														<p style="margin-left: 10px">
															<a class="btn btn-outline-primary"
																href="${contextPath}/recruitment/approve?id=${applyPost.id}&recruitmentId=${applyPost.recruitment.id}">Duyệt</a>
														</p>
													</c:if>
													<c:if test="${applyPost.status == 1}">
														<p style="margin-left: 10px; margin-top: 15px">
															<span style="color: #1e7e34; font-weight: bold">Đã
																duyệt</span>
														</p>
													</c:if>
												</div>

											</div>
										</div>
									</div>
								</c:forEach>
							</c:if>
							<c:if
								test='${userLogin.role.roleName.equals("recruiter") && applyPosts.size() == 0}'>
								<p>Chưa có ứng cử viên nào ứng tuyển</p>
							</c:if>
						</div>
					</div>
				</div>
			</c:if>
			<c:if test='${userLogin.role.roleName.equals("user")}'>
				<c:forEach var="recruitment" items="${recruitment_list}">
					<div class="col-md-12 ">
						<div
							class="job-post-item p-4 d-block d-lg-flex align-items-center">
							<div class="one-third mb-4 mb-md-0">
								<div class="job-post-item-header align-items-center">
									<span class="subadge">${recruitment.type}</span>
									<h2 class="mr-3 text-black">
										<a href="${contextPath}/recruitment/detail/${recruitment.id}">${recruitment.title}</a>
									</h2>
								</div>
								<div class="job-post-item-body d-block d-md-flex">
									<div class="mr-3">
										<span class="icon-layers"></span> <a href="#">
											${recruitment.company.nameCompany} </a>
									</div>
									<div>
										<span class="icon-my_location"></span> <span>${recruitment.address}</span>
									</div>
								</div>
							</div>

							<div
								class="one-forth ml-auto d-flex align-items-center mt-4 md-md-0"
								style="width: 330px !important;">
								<a data-toggle="modal"
									data-target="#exampleModal${recruitment.id}"
									class="btn btn-primary py-2 ml-2">Apply Job</a>

							</div>
						</div>
					</div>
				</c:forEach>
			</c:if>

		</div>
	</section>
	<script>

	function save(id) {
		var name = "#idRe" + id;
		var idRe = $(name).val();
		var userIdInput = "#userLoginId";
		var userId = $(userIdInput).val();
		var formData = new FormData();
		formData.append('idRe', idRe);
		formData.append('userLoginId', userId);
		$.ajax({
			type: 'POST',
			url: '${contextPath}/save-job/save/',
			contentType: false,
			processData: false,
			data: formData,
			success: function(data) {
				console.log(data);
				if (data.message === 'error') {
					swal({
						title: 'Bạn cần phải đăng nhập!',
						icon: 'error',
						timer: 3000,
						buttons: true,
						type: 'error'
					})
				} else if (data.message === 'saveSuccess') {
					swal({
						title: 'Lưu thành công!',
						icon: 'success',
						timer: 3000,
						buttons: true,
						type: 'success'
					})
				} else if (data.message === 'unSaveSuccess') {
					swal({
						title: 'Bỏ lưu thành công!',
						icon: 'success',
						timer: 3000,
						buttons: true,
						type: 'success'
					})
				} 
	
			},
			error: function(err) {
				alert(err);
			}
		})
	}

	function choosed(id) {
		var name = '#choose' + id;
		var name1 = 'loai1' + id;
		var name2 = 'loai2' + id;
		var button1 = 'button1' + id;
		var button2 = 'button2' + id;
		var giaitri = $(name).val();
		if (giaitri == 1) {
			document.getElementById(name1).style.display = 'block'
			document.getElementById(name2).style.display = 'none'
			document.getElementById(button1).style.display = 'block'
			document.getElementById(button2).style.display = 'none'
		} else {
			document.getElementById(name2).style.display = 'block'
			document.getElementById(name1).style.display = 'none'
			document.getElementById(button2).style.display = 'block'
			document.getElementById(button1).style.display = 'none'
		}
	}

	function apply(id) {
		var name = "#idRe" + id;
		var userIdInput = "#userLoginId";
		var userId = $(userIdInput).val();
		var nameModal = "#exampleModal" + id;
		var nameFile = "#fileUpload" + id;
		var nameText = "#text" + id;
		var idRe = $(name).val();
		var textvalue = $(nameText).val();
		var fileUpload = $(nameFile).get(0);
		var files = fileUpload.files;
		var formData = new FormData();
		formData.append('file', files[0]);
		formData.append('idRe', idRe);
		formData.append('text', textvalue);
		formData.append('userLoginId', userId);
		console.log(textvalue);
		if (files[0] == null) {
			swal({
				title: 'Bạn cần phải chọn cv!',
				icon: 'error',
				timer: 3000,
				buttons: true,
				type: 'error'
			})
		} else {
			$.ajax({
				type: 'POST',
				url: '${contextPath}/user/apply-job/',
				contentType: false,
				processData: false,
				data: formData,
				success: function(data) {
					console.log(data)
					if (data.message == 'errorNotLogin') {
						swal({
							title: 'Bạn cần phải đăng nhập!',
							icon: 'error',
							timer: 3000,
							buttons: true,
							type: 'error'
						})
					}
					else if (data.message == "success") {
						swal({
							title: 'Ứng tuyển thành công!',
							icon: 'success',
							timer: 3000,
							buttons: true,
							type: 'success'
						})
						$(nameModal).modal('hide');
						$('#fileUpload').val("");
					}
					else {
						swal({
							title: 'Bạn đã ứng tuyển công việc này!',
							icon: 'error',
							timer: 3000,
							buttons: true,
							type: 'error'
						})
						$(nameModal).modal('hide');
						$('#fileUpload').val("");
					}
				},
				error: function(err) {
					alert(err);
				}
			})
		}

	}
	function apply1(id) {
		var name = "#idRe" + id;
		var userIdInput = "#userLoginId";
		var userId = $(userIdInput).val();
		var nameModal = "#exampleModal" + id;
		var nameFile = "#fileUpload" + id;
		var nameText = "#text" + id;
		var idRe = $(name).val();
		var textvalue = $(nameText).val();
		var formData = new FormData();
		formData.append('idRe', idRe);
		formData.append('text', textvalue);
		formData.append('userLoginId', userId);
		$.ajax({
			type: 'POST',
			url: '${contextPath}/user/apply-job1/',
			contentType: false,
			processData: false,
			data: formData,
			success: function(data) {
				console.log(data);
				if (data.message == 'errorNotLogin') {
					swal({
						title: 'Bạn cần phải đăng nhập!',
						icon: 'error',
						timer: 1000,
						buttons: true,
						type: 'error'
					})
				}
				else if (data.message == 'success') {
					swal({
						title: 'Ứng tuyển thành công!',
						icon: 'success',
						timer: 1000,
						buttons: true,
						type: 'success'
					})
					$(nameModal).modal('hide');
					$('#fileUpload').val("");
				}
				else {
					swal({
						title: 'Bạn đã ứng tuyển công việc này!',
						icon: 'error',
						timer: 1000,
						buttons: true,
						type: 'error'
					})
					$(nameModal).modal('hide');
					$('#fileUpload').val("");
				}
			},
			error: function(err) {
				alert(err);
			}
		})

	}		
	</script>


	<%@ include file="/WEB-INF/view/layouts/footer.jsp"%>
</body>
</html>