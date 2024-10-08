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
	<c:set var="contextPath" value="${pageContext.request.contextPath}" />
	<%@ include file="/WEB-INF/view/layouts/navHome.jsp"%>
	<c:if test='${ msg_userLogin_success != null}'>
		<div class="toast" data-delay="2500"
			style="position: fixed; top: 100PX; right: 10PX; z-index: 2000; width: 300px">
			<script>
			swal({
				title : 'Đăng nhập thành công',
				text : 'Hãy cập nhật thông tin công ty',
				icon : 'success',
				timer : 1000,
				buttons : true,
				type : 'success'
			})
		</script>
		</div>
	</c:if>
	<c:if test='${ msg_update_recruiter_success != null}'>
		<div class="toast" data-delay="2500"
			style="position: fixed; top: 100PX; right: 10PX; z-index: 2000; width: 300px">

			<script>
			swal({
				title : 'Cập nhật thông tin cá nhân thành công',
				text : 'Hãy cập nhật thông tin công ty',
				icon : 'success',
				timer : 1000,
				buttons : true,
				type : 'success'
			})
		</script>
		</div>
	</c:if>
	<c:if test='${ message_upload_cv.equals("success")}'>
		<div class="toast" data-delay="2500"
			style="position: fixed; top: 100PX; right: 10PX; z-index: 2000; width: 300px">

			<script>
			swal({
				title : 'Cập nhật Cv thành công',
				icon : 'success',
				timer : 1000,
				buttons : true,
				type : 'success'
			})
		</script>
		</div>
	</c:if>
	<c:if test='${ message_upload_cv.equals("error")}'>
		<div class="toast" data-delay="2500"
			style="position: fixed; top: 100PX; right: 10PX; z-index: 2000; width: 300px">

			<script>
			swal({
				title : 'Cập nhật Cv thất bại',
				text : 'Hãy chọn cv',
				icon : 'error',
				timer : 1000,
				buttons : true,
				type : 'error'
			})
		</script>
		</div>
	</c:if>

	<c:if test='${ msg_update_recruiter_error != null}'>
		<div class="toast" data-delay="2500"
			style="position: fixed; top: 100PX; right: 10PX; z-index: 2000; width: 300px">

			<script>
			swal({
				title : 'Cập nhật thông tin cá nhân thất bại!',
				text : 'Có gì đó sai sai, bạn nhập lại nhé',
				icon : 'error',
				timer : 1000,
				buttons : true,
				type : 'error'
			})
		</script>
		</div>
	</c:if>
	<c:if test='${ msg_update_user_success != null}'>
		<div class="toast" data-delay="2500"
			style="position: fixed; top: 100PX; right: 10PX; z-index: 2000; width: 300px">

			<script>
			swal({
				title : 'Cập nhật thông tin cá nhân thành công',
				icon : 'success',
				timer : 1000,
				buttons : true,
				type : 'success'
			})
		</script>
		</div>
	</c:if>
	<c:if test='${ msg_update_company_success != null}'>
		<div class="toast" data-delay="2500"
			style="position: fixed; top: 100PX; right: 10PX; z-index: 2000; width: 300px">

			<script>
			swal({
				title : 'Cập nhật thông tin công ty thành công',
				icon : 'success',
				timer : 1000,
				buttons : true,
				type : 'success'
			})
		</script>
		</div>
	</c:if>
	<c:if test='${ confirm_success != null}'>
		<div class="toast" data-delay="2500"
			style="position: fixed; top: 100PX; right: 10PX; z-index: 2000; width: 300px">

			<script>
			swal({
				title : 'Xác thực tài khoản thành công',
				icon : 'success',
				timer : 1000,
				buttons : true,
				type : 'success'
			})
		</script>
		</div>
	</c:if>

	<c:if test='${ msg_update_user_error != null}'>
		<div class="toast" data-delay="2500"
			style="position: fixed; top: 100PX; right: 10PX; z-index: 2000; width: 300px">

			<script>
			swal({
				title : 'Cập nhật thông tin cá nhân thất bại!',
				text : 'Có gì đó sai sai, bạn nhập lại nhé',
				icon : 'error',
				timer : 1000,
				buttons : true,
				type : 'error'
			})
		</script>
		</div>
	</c:if>

	<div class="hero-wrap hero-wrap-2"
		style="background-image: url('${contextPath}/resources/assets/images/bg_1.jpg');"
		data-stellar-background-ratio="0.5">
		<div class="overlay"></div>
		<div class="container">
			<div
				class="row no-gutters slider-text align-items-end justify-content-start">
				<div class="col-md-12 text-center mb-5">
					<h1 class="mb-3 bread">Hồ sơ</h1>
					<div class="form-group">
						<form action="${contextPath}/user/upload" method="post"
							enctype="multipart/form-data">
							<label class="btn btn-dark btn-md btn-file"> Chọn ảnh<input
								type="file" name="file" id="fileUpload">
							</label> <input type="hidden" name="recruiterId" value="${userLogin.id}" />
							<button class="btn btn-primary" type="submit">Tải lên</button>
						</form>
					</div>
					<c:url
						value="/resources/assets/images/${userDTO.image != null ? userDTO.image : user.image}"
						var="urlImage" />
					<div style="margin-left: 0px" id="divImage">
						<img id="avatar" height="100" width="100"
							style="border-radius: 50px"
							src="${userDTO.image != null ? urlImage : 'https://st.quantrimang.com/photos/image/072015/22/avatar.jpg'}">
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- HOME -->

	<c:if
		test='${userLogin.status.equals("active") && userLogin.role.roleName.equals("recruiter") && userLogin.isVerified == 0}'>
		<div class="container-fluid" style="text-align: center">
			<p
				style="font-size: 20px; font-weight: bold; color: #aaa; margin-top: 10px">Xác
				thực email đăng nhập</p>
			<div id="confirmEmail"
				class='${confirm_await != null ? "d-none" : ""}'
				style="width: 600px; height: 400px; border-radius: 5px; box-shadow: rgba(0, 0, 0, 0.4) 0px 0px 10px; margin: 20px auto; padding: 15px">
				<p style="line-height: 35px; font-size: 16px">
					Xin chào, <span>${userLogin.fullName}</span> và làm theo hướng dẫn
					trong email. Trường hợp không nhận được email, bạn vui lòng bấm nút
					Nhận email xác thực dưới đây.
				</p>
				<div class="row form-group">
					<form action="${contextPath}/user/confirm-account" method="post"
						class="col-md-12">
						<input type="hidden" value="${userLogin.email}" name="email"
							class="btn px-4 btn-primary text-white"> <input
							type="hidden" value="${userLogin.id}" name="idUser"
							class="btn px-4 btn-primary text-white"> <input
							type="submit" value="Nhận email xác thực"
							class="btn px-4 btn-primary text-white">
					</form>
				</div>
				<p>
					Mọi thắc mắc vui lòng liên hệ bộ phận CSKH của WorkCV:<br>
				</p>
				- Điện thoại:<span style="color: #5f80ec">(024) 6680 5588</span><br>
				- Email: <a href="#" style="color: #5f80ec"> hotro@workcv.vn</a>
			</div>

			<div id="confirmed" class='${confirm_await != null ? "" : "d-none"} '
				style="width: 600px; height: 400px; border-radius: 5px; box-shadow: rgba(0, 0, 0, 0.4) 0px 0px 10px; margin: 20px auto; padding: 15px">
				<p style="line-height: 35px; font-size: 16px">
					Xin chào, <span>${userLogin.fullName}</span> .Bạn đã gửi yêu cầu
					xác thực thành công, vui lòng kiểm tra mail để xác thực.Cảm ơn
					bạn!!!
				</p>
				<p>
					Mọi thắc mắc vui lòng liên hệ bộ phận CSKH của WorkCV:<br>
				</p>
				- Điện thoại:<span style="color: #5f80ec">(024) 6680 5588</span><br>
				- Email: <a href="#" style="color: #5f80ec"> hotro@workcv.vn</a>
			</div>
		</div>
	</c:if>

	<c:if
		test='${userLogin.status.equals("active") && userLogin.role.roleName.equals("user")}'>
		<section class="site-section" style="margin-top: 10px">
			<div class="container">
				<form action="${contextPath}/user/uploadCV" method="post"
					enctype="multipart/form-data">
					<input type="hidden" name="userIdUpload" value="${userLogin.id}" />
					<input type="hidden" name="idCv" value="${userLogin.cv.id}">
					<div class="row align-items-center mb-5">
						<div class="col-lg-8 ">
							<div class="d-flex align-items-center">
								<div class="form-group" style="margin-top: 15px">
									<label class="btn btn-primary btn-md btn-file"> Chọn cv
										(pdf)<input type="file" name="file" id="fileUpload1" hidden
										onchange="handlerChooseCV()" />
									</label>
								</div>
							</div>
							<c:if test="${userLogin.cv == null}">
								<p id="cvName">Chưa cập nhập</p>
							</c:if>
							<c:if test="${userLogin.cv != null}">
								<p id="cvName">
									<strong>Tên file Cv: </strong><em>${userLogin.cv.fileName}</em>
									<a class="btn btn-primary btn-sm text-light"
										href="${contextPath}/resources/assets/images/${userLogin.cv.fileName}"
										target="_blank">Xem cv</a> <a
										class="btn btn-danger btn-sm text-light" data-toggle="modal"
										data-target="#modalDeleteCV">Xóa cv</a>
								</p>

							</c:if>
						</div>

						<div class="col-lg-4">
							<div class="row">
								<div class="col-6">
									<button type="submit" id="myBtn"
										class="btn btn-block btn-light btn-md">
										<span class="icon-open_in_new mr-2"></span>Cập nhật cv
									</button>
								</div>
							</div>
						</div>
					</div>
				</form>
				<!-- Modal -->
				<div class="modal fade" id="modalDeleteCV" tabindex="-1"
					role="dialog" aria-labelledby="exampleModalLabel"
					aria-hidden="true">
					<div class="modal-dialog" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="exampleModalLabel">Bạn có chắc
									chắn muốn xóa ?</h5>
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<div class="modal-body">
								Cv : <span id="cvXoa"></span>
								<c:if test="${userLogin.cv != null}">
									<span>${userLogin.cv.fileName}</span>
								</c:if>
								<div class="modal-footer mt-1">
									<input type="hidden" name="idCv" value="${userLogin.cv.id}">
									<input type="hidden" name="userId" value="${userLogin.id}">
									<button type="button" class="btn btn-secondary"
										data-dismiss="modal">Đóng</button>
									<button type="button" class="btn btn-danger"
										onclick="handlerDeleteButton(${userLogin.cv.id})">Xóa</button>
								</div>
							</div>

						</div>
					</div>
				</div>
				<%@ include file="/WEB-INF/view/forms/updateUser.jsp"%>
			</div>
		</section>
	</c:if>

	<c:if
		test='${userLogin.status.equals("active") && userLogin.role.roleName.equals("recruiter") && userLogin.isVerified == 1}'>
		<section class="site-section" style="margin-top: 10px"
			id="recruiterForm">
			<div class="container">
				<div class="row">
					<%@ include file="/WEB-INF/view/forms/updateRecruiter.jsp"%>
					<%@ include file="/WEB-INF/view/forms/updateCompany.jsp"%>

				</div>
			</div>
		</section>
	</c:if>

	<script>
	
 	ClassicEditor.create(document.querySelector('#editor1'))
 	 .then(edit => {
	   	edit.setData("${userDTO.description}")
	}) 
    .catch(error => {
        console.error(error);
    }); 
 	
    ClassicEditor.create(document.querySelector('#editor2'))
     .then(edit => {
        edit.setData("${companyDTO.description}")
    }) 
    .catch(error => {
        console.error(error);
    });
    
	function handlerChooseCV() {
		document.getElementById("cvName").innerHTML = document.getElementById("fileUpload1").value;
	}
	
	function handlerDeleteButton(idCv) {
		 var nameModel = "#modalDeleteCV";
		 $.ajax({
            url: '${contextPath}/user/deleteCv?idCv=' + idCv,
            type: 'POST',
            success: function(response) {
                showToast(response.msg_delete_success, 'success');
                document.getElementById("cvName").innerHTML = "Chưa cập nhật";
                $(nameModel).hide();
                $(".modal-backdrop").hide();
            },
            error: function() {
                showToast('Có lỗi xảy ra khi xóa CV', 'error');
            }
	    });
	}
	
	 function showToast(message, icon) {
        const toastDiv = document.createElement('div');
        toastDiv.className = 'toast';
        toastDiv.style.cssText = 'position: fixed; top: 100px; right: 10px; z-index: 2000; width: 300px;';
        document.body.appendChild(toastDiv);

        swal({
            title: message,
            icon: icon,
            timer: 1000,
            buttons: true,
            type: icon
        }).then(() => {
            document.body.removeChild(toastDiv);
        });
    }
	 
</script>


	<%@ include file="/WEB-INF/view/layouts/footer.jsp"%>
</body>
</html>