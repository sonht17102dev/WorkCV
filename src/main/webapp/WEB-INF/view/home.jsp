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
	<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
	<c:if test='${ userLogin != null}'>
	<div class="toast" data-delay="2500"
		style="position: fixed; top: 100PX; right: 10PX; z-index: 2000; width: 300px">
		
		<script>
			swal({
				title : 'Đăng nhập thành công',
				text: `Chào mừng ${userLogin.fullName} đã quay trở lại.`,
				icon : 'success',
				timer : 2000,
				buttons : true,
				type : 'success'
			})
		</script>
	</div> 
	</c:if>
	<div class="hero-wrap img"
		style="background-image: url(${contextPath}/resources/assets/images/bg_1.jpg);">
		<div class="overlay"></div>
		<div class="container">
			<div
				class="row d-md-flex no-gutters slider-text align-items-center justify-content-center">
				<div class="col-md-10 d-flex align-items-center ">
					<div class="text text-center pt-5 mt-md-5">
						<p class="mb-4">Tìm việc làm, Cơ hội việc làm và Nghề nghiệp</p>
						<h1 class="mb-5">Cách dễ dàng nhất để có được công việc mới
							của bạn</h1>
						<div class="ftco-counter ftco-no-pt ftco-no-pb">
							<div class="row">
								<div
									class="col-md-4 d-flex justify-content-center counter-wrap ">
									<div class="block-18">
										<div class="text d-flex">
											<div class="icon mr-2">
												<span class="flaticon-visitor"></span>
											</div>
											<div class="desc text-left">
												<strong class="number" data-number="46">${numberCandidate}</strong> 
												<span>Ứng cử viên</span>
											</div>
										</div>
									</div>
								</div>
								<div
									class="col-md-4 d-flex justify-content-center counter-wrap ">
									<div class="block-18 text-center">
										<div class="text d-flex">
											<div class="icon mr-2">
												<span class="flaticon-visitor"></span>
											</div>
											<div class="desc text-left">
												<strong class="number" data-number="450">${numberCompany}</strong> 
												<span>Công ty</span>
											</div>
										</div>
									</div>
								</div>
								<div class="col-md-4 d-flex justify-content-center counter-wrap">
									<div class="block-18 text-center">
										<div class="text d-flex">
											<div class="icon mr-2">
												<span class="flaticon-resume"></span>
											</div>
											<div class="desc text-left">
												<strong class="number" data-number="80000">${numberRecruitment}</strong> 
												<span>Tuyển dụng</span>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="ftco-search my-md-5">
							<div class="row">
								<%@ include file="/WEB-INF/view/forms/search-form.jsp"%>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<section class="ftco-section">
		<div class="container">
			<div class="row justify-content-center mb-5">

				<div style="display: block"
					class="col-md-7 heading-section text-center">
					<span class="subheading">Danh mục công việc</span>
					<h2 class="mb-0">Top Danh Mục</h2>
				</div>
			</div>
			<div class="row">
				<c:forEach items="${categories}" var="category">
					<div class="col-md-3 ">
						<ul class="category text-center">
							<li><a style="text-decoration: none !important;"
								href="/recruitment/category/${category.id}">
									<p>${category.name}</p>
									<span class="number">${category.numberChoose}</span>
									<span>Vị trí</span><i class="ion-ios-arrow-forward"></i>
							</a></li>
						</ul>
					</div>
				</c:forEach>
			</div>
		</div>
	</section>

	<section class="ftco-section services-section">
		<div class="container">
			<div class="row d-flex">
				<div class="col-md-3 d-flex align-self-stretch ">
					<div class="media block-6 services d-block">
						<div class="icon">
							<span class="flaticon-resume"></span>
						</div>
						<div class="media-body">
							<h3 class="heading mb-3">Tìm kiếm hàng triệu việc làm</h3>
							<p>Một con sông nhỏ tên là Duden chảy qua nơi ở và nguồn cung
								cấp của họ.</p>
						</div>
					</div>
				</div>
				<div class="col-md-3 d-flex align-self-stretch ">
					<div class="media block-6 services d-block">
						<div class="icon">
							<span class="flaticon-team"></span>
						</div>
						<div class="media-body">
							<h3 class="heading mb-3">Dễ dàng quản lý công việc</h3>
							<p>Một con sông nhỏ tên là Duden chảy qua nơi ở và nguồn cung
								cấp của họ.</p>
						</div>
					</div>
				</div>
				<div class="col-md-3 d-flex align-self-stretch ">
					<div class="media block-6 services d-block">
						<div class="icon">
							<span class="flaticon-career"></span>
						</div>
						<div class="media-body">
							<h3 class="heading mb-3">Top Nghề nghiệp</h3>
							<p>Một con sông nhỏ tên là Duden chảy qua nơi ở và nguồn cung
								cấp của họ.</p>
						</div>
					</div>
				</div>
				<div class="col-md-3 d-flex align-self-stretch ">
					<div class="media block-6 services d-block">
						<div class="icon">
							<span class="flaticon-employees"></span>
						</div>
						<div class="media-body">
							<h3 class="heading mb-3">Ứng viên Chuyên gia Tìm kiếm</h3>
							<p>Một con sông nhỏ tên là Duden chảy qua nơi ở và nguồn cung
								cấp của họ.</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<section class="ftco-section bg-light">
		<div class="container">
			<div class="row">
				<div class="col-lg-9 pr-lg-5">
					<div class="row justify-content-center pb-3">
						<div class="col-md-12 heading-section ">
							<span class="subheading">CÔNG VIỆC ĐƯỢC NHIỀU NGƯỜI ỨNG
								TUYỂN</span>
							<h2 class="mb-4">Các bài đăng về việc làm nổi bật</h2>

						</div>
					</div>
					<div class="row">
						<c:forEach var="recruitment" items="${recruitments}">
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
												<span class="icon-layers"></span> 
												<a href="${contextPath}/detail-company/${recruitment.company.id}">${recruitment.company.nameCompany}</a>
											</div>
											<div>
												<span class="icon-my_location"></span> 
												<span>${recruitment.address}</span>
											</div>
										</div>
									</div>
									<input type="hidden" id="idRe${recruitment.id}"
										value="${recruitment.id}">
									<c:if test="${userLogin != null}">
									<div class="one-forth ml-auto d-flex align-items-center mt-4 md-md-0">
										<div>
											<a onclick="save(${recruitment.id})'"
												class="icon text-center d-flex justify-content-center align-items-center icon mr-2">
												<span class="icon-heart"></span>
											</a>
										</div>
										<a data-toggle="modal"
											data-target="#exampleModal${recruitment.id}"
											class="btn btn-primary py-2">Apply Job</a>
									</div>
									</c:if>
									<c:if test='${userLogin == null}'>
									<div class="one-forth ml-auto d-flex align-items-center mt-4 md-md-0">
										<div>
											<a onclick="save(${recruitment.id})"
												class="icon text-center d-flex justify-content-center align-items-center icon mr-2">
												<span class="icon-heart"></span>
											</a>
										</div>
										<a data-toggle="modal"
											data-target="#exampleModal${recruitment.id}"
											class="btn btn-primary py-2">Apply Job</a>
									</div>
									</c:if>
								</div>
							</div>
							<!-- end -->
							<!-- Modal -->
							<div class="modal fade"
								id="exampleModal${recruitment.id}" tabindex="-1"
								role="dialog" aria-labelledby="exampleModalLabel"
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
											<input type="hidden" id="userLoginId" value="${userLogin.id}"/>
											<div class="modal-body">
												<div class="row">
													<div class="col-12">
														<select id="choose${recruitment.id}"
															onchange="choosed(${recruitment.id})"
															class="form-control" aria-label="Default select example">
															<option selected>Chọn phương thức nộp</option>
															<option value="1">Dùng cv đã cập nhật</option>
															<option value="2">Nộp cv mới</option>
														</select>
													</div>
													<div id="loai1${recruitment.id}"
														style="display: none" class="col-12">
														<label for="fileUpload" class="col-form-label">Giới
															thiệu:</label>
														<textarea rows="10" cols="3" class="form-control"
															id="text${recruitment.id}"></textarea>
													</div>
													<div id="loai2${recruitment.id}"
														style="display: none" class="col-12">

														<label for="fileUpload" class="col-form-label">Chọn
															cv:</label> <input type="file" class="form-control"
															id="fileUpload${recruitment.id}" name="file"
															required> <label for="fileUpload"
															class="col-form-label">Giới thiệu:</label>
														<textarea rows="10" cols="3" class="form-control"
															id="text${recruitment.id}"></textarea>
													</div>

												</div>
												<div class="modal-footer">
													<button type="button" class="btn btn-secondary"
														data-dismiss="modal">Đóng</button>
													<button type="button"
														id="button1${recruitment.id}"
														style="display: none"
														onclick="apply1(${recruitment.id})"
														class="btn btn-primary">Nộp</button>
													<button type="button"
														id="button2${recruitment.id}"
														style="display: none"
														onclick="apply(${recruitment.id})'"
														class="btn btn-primary">Nộp</button>
												</div>
											</div>
										</form>


									</div>
								</div>
							</div>
						</c:forEach>

					</div>
				</div>
				<div class="col-lg-3 sidebar">
					<div class="row justify-content-center pb-3">
						<div class="col-md-12 heading-section ">
							<h2 class="mb-4">Công ty nổi bật</h2>
						</div>
					</div>
					<c:forEach items="${companiesMap}" var="entry">
						<div class="sidebar-box">
							<div class="">
								<a href="${contextPath}/detail-company/${entry.key.id}"
									class="company-wrap"><img src="${contextPath}/resources/assets/images/${entry.key.logo}"
									class="img-fluid" alt="Colorlib Free Template"></a>
								<div class="text p-3">
									<h3>
										<a href="${contextPath}/detail-company/${entry.key.id}">${entry.key.nameCompany}</a>
									</h3>
									<p>
										<span class="number" style="color: black">${entry.value}</span> 
										<span>Vị trí ứng tuyển</span>
									</p>
								</div>
							</div>
						</div>
					</c:forEach> 
				</div>
			</div>
		</div>
	</section>
	<script>
		var isSaved = true;
		function save(id) {
			var name = "#idRe" + id;
			var idRe = $(name).val();
			var userIdInput = "#userLoginId";
			var userId = $(userIdInput).val();
			var formData = new FormData();
			formData.append('idRe', idRe);
			formData.append('userLoginId', userId);
			if(isSaved) {
				$.ajax({
					type : 'POST',
					url : '${contextPath}/save-job/save/',
					contentType : false,
					processData : false,
					data : formData,
					success : function(data) {
						console.log(data);
						if (data.message == 'error') {
							swal({
								title : 'Bạn cần phải đăng nhập!',
								/* text: 'Redirecting...', */
								icon : 'error',
								timer : 3000,
								buttons : true,
								type : 'error'
							})
						} else if (data.message == 'saveSuccess') {
							
							swal({
								title : 'Lưu thành công!',
								/* text: 'Redirecting...', */
								icon : 'success',
								timer : 3000,
								buttons : true,
								type : 'success'
							})
						} 
						
					},
					error : function(err) {
						alert(err);
					}
				})
			} else {
				$.ajax({
					type : 'POST',
					url : '${contextPath}/save-job/unsave/',
					contentType : false,
					processData : false,
					data : formData,
					success : function(data) {
						console.log(data);
						if (data.message == 'error') {
							swal({
								title : 'Bạn cần phải đăng nhập!',
								icon : 'error',
								timer : 3000,
								buttons : true,
								type : 'error'
							})
						} else if (data.message == 'unSaveSuccess') {
							
							swal({
								title : 'Bỏ lưu thành công!',
								icon : 'success',
								timer : 3000,
								buttons : true,
								type : 'success'
							})
						} 						
					},
					error : function(err) {
						alert(err);
					}
				})
				
			}
			isSaved = !isSaved; // Đảo trạng thái lưu
			
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
			if (files[0] == null) {
				swal({
					title : 'Bạn cần phải chọn cv!',
					/* text: 'Redirecting...', */
					icon : 'error',
					timer : 3000,
					buttons : true,
					type : 'error'
				})
			} else {
				$.ajax({
					type : 'POST',
					url : '${contextPath}/user/apply-job/',
					contentType : false,
					processData : false,
					data : formData,
					success : function(data) {
						console.log(data)
						/* if (data == "false") {
							swal({
								title : 'Bạn cần phải đăng nhập!',
								icon : 'error',
								timer : 3000,
								buttons : true,
								type : 'error'
							})
						} else if (data == "true") {
							swal({
								title : 'Ứng tuyển thành công!',
								icon : 'success',
								timer : 3000,
								buttons : true,
								type : 'success'
							})
							$(nameModal).modal('hide');
							$('#fileUpload').val("");
						} else {
							swal({
								title : 'Bạn đã ứng tuyển công việc này!',
								icon : 'error',
								timer : 3000,
								buttons : true,
								type : 'error'
							})
							$(nameModal).modal('hide');
							$('#fileUpload').val("");
						} */
					},
					error : function(err) {
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
				type : 'POST',
				url : '${contextPath}/user/apply-job1/',
				contentType : false,
				processData : false,
				data : formData,
				success : function(data) {
					console.log(data);
					if (data.message == 'error') {
						swal({
							title : 'Bạn cần phải đăng nhập!',
							icon : 'error',
							timer : 1000,
							buttons : true,
							type : 'error'
						})
					} 
					else if (data.message == 'success') {
						swal({
							title : 'Ứng tuyển thành công!',
							icon : 'success',
							timer : 1000,
							buttons : true,
							type : 'success'
						})
						$(nameModal).modal('hide');
						$('#fileUpload').val("");
					} 
					else {
						swal({
							title : 'Bạn đã ứng tuyển công việc này!',
							icon : 'error',
							timer : 1000,
							buttons : true,
							type : 'error'
						})
						$(nameModal).modal('hide');
						$('#fileUpload').val("");
					}
				},
				error : function(err) {
					alert(err);
				}
			})

		}
	</script>


	<%@ include file="/WEB-INF/view/layouts/footer.jsp"%>

</body>

</html>