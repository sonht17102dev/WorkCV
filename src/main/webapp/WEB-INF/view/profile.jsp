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
<div class="hero-wrap hero-wrap-2" style="background-image: url('/resources/assets/images/bg_1.jpg');" data-stellar-background-ratio="0.5">
    <div class="overlay"></div>
    <div class="container">
        <div class="row no-gutters slider-text align-items-end justify-content-start">
            <div class="col-md-12 text-center mb-5">
                <h1 class="mb-3 bread">Hồ sơ </h1>
                <div class="form-group">
                	<form action="${pageContext.request.contextPath}/user/upload" method="post" enctype="multipart/form-data">
                    <label class="btn btn-dark btn-md btn-file">
                        Chọn ảnh<input type="file" name="file" id="fileUpload" >
                    </label>
                   <input type="hidden" name="recruiterId" value="${userLogin.id}" />
                    <button class="btn btn-primary" type="submit">Tải lên</button>
                    </form>
                </div>
                <c:url value="/resources/assets/images/${recruiterDTO.image}" var="urlImage"/>
                <div style="margin-left: 0px" id="divImage" >
                    <img id="avatar" height="100" width="100" style="border-radius: 50px" 
                  src="${recruiterDTO.image != null ? urlImage : 'https://st.quantrimang.com/photos/image/072015/22/avatar.jpg'}"
   					>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- HOME -->

<div th:if="${userInformation.status == 0}" class="container-fluid" style="text-align: center">
    <p style="font-size: 20px;font-weight: bold;color: #aaa;margin-top: 10px">Xác thực email đăng nhập</p>
    <div style="width: 600px;height: 400px;border-radius: 5px;
    box-shadow: rgba(0, 0, 0, 0.4) 0px 0px 10px;margin: 20px auto;padding: 15px">
        <p style="line-height: 35px;font-size: 16px">Xin chào, <span th:text="${userInformation.fullName}" ></span> và làm theo hướng dẫn trong email.
            Trường hợp không nhận được email, bạn vui lòng bấm nút Nhận email xác thực dưới đây.</p>
        <div class="row form-group">
            <form action="/user/confirm-account" method="post" class="col-md-12">
                <input type="hidden" th:value="${userInformation.email}" name="email" class="btn px-4 btn-primary text-white">
                <input type="submit" value="Nhận email xác thực" class="btn px-4 btn-primary text-white">
            </form>
        </div>
        <p>Mọi thắc mắc vui lòng liên hệ bộ phận CSKH của WorkCV:<br></p>
        - Điện thoại:<span style="color:#5f80ec">(024) 6680 5588</span><br>
        - Email: <a href="#" style="color:#5f80ec"> hotro@workcv.vn</a>
    </div>
    <div th:if="${comfirm_await}" style="width: 600px;height: 400px;border-radius: 5px;
    box-shadow: rgba(0, 0, 0, 0.4) 0px 0px 10px;margin: 20px auto;padding: 15px">
        <p style="line-height: 35px;font-size: 16px">Xin chào, <span th:text="${userInformation.fullName}" ></span> .Bạn đã gửi yêu cầu xác thực thành công,
            vui lòng kiểm tra mail để xác thực.Cảm ơn bạn!!!
        </p>
        <p>Mọi thắc mắc vui lòng liên hệ bộ phận CSKH của WorkCV:<br></p>
        - Điện thoại:<span style="color:#5f80ec">(024) 6680 5588</span><br>
        - Email: <a href="#" style="color:#5f80ec"> hotro@workcv.vn</a>
    </div>
</div>

<section th:if="${userInformation.status == 1 && userInformation.role.id == 1}" class="site-section" style="margin-top: 10px">
    <div class="container">
        <form enctype="multipart/form-data">
            <div class="row align-items-center mb-5">
                <div class="col-lg-8 ">
                    <div class="d-flex align-items-center">
                        <div class="form-group" style="margin-top: 15px">
                            <label class="btn btn-primary btn-md btn-file">
                                Chọn cv (pdf)<input type="file" name="file" id="fileUpload1" required hidden>
                            </label>
                        </div>
                    </div>
                    <p id="cvName" th:if="${Cv != null}" th:text="${Cv != null ? Cv.fileName :'Chưa cập nhập'}"></p>
                    <p id="cvName" th:if="${Cv == null}"></p>
                    <a id="nameCv" th:if="${Cv !=null}" th:href="${'http://localhost:8080/resources/uploads/'} +${Cv.fileName}" >Xem cv</a>
                    <a id="nameCv"  th:href="${'http://localhost:8080/resources/uploads/'}" ></a>
                    <a style="color: red;margin-left: 20px" th:if="${Cv !=null}" data-toggle="modal" data-target="#exampleModal" >Xóa cv</a>
                    <a style="color: red;margin-left: 20px" th:if="${Cv ==null}" id="xoa" data-toggle="modal" data-target="#exampleModal" ></a>
                </div>

                <div class="col-lg-4">
                    <div class="row">
<!--                        <div class="col-6">-->
<!--                            <button type="submit" id="myBtn" class="btn btn-block btn-light btn-md"><span class="icon-open_in_new mr-2"></span>Cập nhật cv</button>-->
<!--                        </div>-->
                    </div>
                </div>
            </div>
        </form>


        <form action="/user/update-profile" method="post" >
            <div class="row align-items-center mb-5">
                <div class="col-lg-8 mb-4 mb-lg-0">
                    <div class="d-flex align-items-center">
                        <div>
                            <h2>Cập nhật thông tin</h2>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="row">

                        <div class="col-6">
                            <button type="submit" class="btn btn-block btn-primary btn-md">Lưu thông tin</button>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row mb-5">
                <div class="col-lg-12">
                    <div class="p-4 p-md-5 border rounded" method="post">
                        <h3 class="text-black mb-5 border-bottom pb-2">Thông tin chi tiết</h3>
                        <div class="form-group">
                            <label for="email">Email</label>
                            <input type="email" class="form-control" id="email" name="email" th:value="${userInformation.email != null ? userInformation.email : null}" required placeholder="you@yourdomain.com">
                        </div>
                        <div class="form-group">
                            <label for="job-title">Full name</label>
                            <input type="text" class="form-control" name="fullName" th:value="${userInformation.fullName != null ? userInformation.fullName : null}" required id="job-title" placeholder="Full name">
                        </div>
                        <div class="form-group">
                            <label for="job-location">Địa chỉ</label>
                            <input type="text" name="address" th:value="${userInformation.address != null ? userInformation.address : null}" class="form-control" id="job-location" required placeholder="e.g. New York">
                        </div>
                        <div class="form-group">
                            <label for="job-location">Số điện thoại</label>
                            <input type="text" name="phoneNumber" th:value="${userInformation.phoneNumber != null ? userInformation.phoneNumber : null}" class="form-control" id="job-location" required placeholder="+ 84">
                        </div>
                        <div class="form-group">
                            <label for="job-location">Mô tả bản thân</label>
                            <textarea  name="description" th:text="${userInformation.description != null ? userInformation.description : null}" class="form-control" id="editor" placeholder="Mô tả"></textarea>
                        </div>

                    </div>

                </div>

            </div>
        </form>
    </div>
</section>

<!-- Modal -->
<div class="modal fade"  id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Bạn có chắc chắn muốn xóa ?</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                Cv : <span id="cvXoa" ></span>
                <span th:if="${Cv != null}" th:text="${Cv.fileName}"></span>
                <form action="/user/deleteCv" method="post">
                    <div class="modal-footer mt-1">
                        <input type="hidden"  name="idCv">
                        <button type="submit" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
                        <button type="submit" class="btn btn-danger">Xóa</button>
                    </div>
                </form>
            </div>

        </div>
    </div>
</div>
<c:if test='${userLogin.status.equals("active") && userLogin.role.roleName.equals("recruiter")}'>
<section class="site-section" style="margin-top: 10px">
    <div class="container">
        <div class="row">
            <%@ include file="/WEB-INF/view/forms/updateRecruiter.jsp"%>
            <%@ include file="/WEB-INF/view/forms/updateCompany.jsp"%>
            
        </div>
    </div>
</section>
</c:if>
<script>

	ClassicEditor.create(document.querySelector('#editor')).then(edit => {
	   	edit.setData("${recruiterDTO.description}")
	})
    .catch(error => {
        console.error(error);
    });
</script>


	<%@ include file="/WEB-INF/view/layouts/footer.jsp"%>
</body>
</html>