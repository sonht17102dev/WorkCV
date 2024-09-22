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
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
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
<div class="hero-wrap hero-wrap-2" style="background-image: url('${contextPath}/resources/assets/images/bg_1.jpg');" data-stellar-background-ratio="0.5">
    <div class="overlay"></div>
    <div class="container">
        <div class="row no-gutters slider-text align-items-end justify-content-start">
            <div class="col-md-12 text-center mb-5">
                <h1 class="mb-3 bread">Hồ sơ </h1>
                <div class="form-group">
                	<form action="${contextPath}/user/upload" method="post" enctype="multipart/form-data">
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

<c:if test='${userLogin.status.equals("active") && userLogin.role.roleName.equals("recruiter")}'>
	<div class="container-fluid" style="text-align: center">
	    <p style="font-size: 20px;font-weight: bold;color: #aaa;margin-top: 10px">Xác thực email đăng nhập</p>
	    <div style="width: 600px;height: 400px;border-radius: 5px;
	    box-shadow: rgba(0, 0, 0, 0.4) 0px 0px 10px;margin: 20px auto;padding: 15px">
	        <p style="line-height: 35px;font-size: 16px">Xin chào, <span>${userLogin.fullName}</span> và làm theo hướng dẫn trong email.
	            Trường hợp không nhận được email, bạn vui lòng bấm nút Nhận email xác thực dưới đây.</p>
	        <div class="row form-group">
	            <form action="/user/confirm-account" method="post" class="col-md-12">
	                <input type="hidden" value="${userLogin.email}" name="email" class="btn px-4 btn-primary text-white">
	                <input type="submit" value="Nhận email xác thực" class="btn px-4 btn-primary text-white">
	            </form>
	        </div>
	        <p>Mọi thắc mắc vui lòng liên hệ bộ phận CSKH của WorkCV:<br></p>
	        - Điện thoại:<span style="color:#5f80ec">(024) 6680 5588</span><br>
	        - Email: <a href="#" style="color:#5f80ec"> hotro@workcv.vn</a>
	    </div>
	    <div th:if="${comfirm_await}" style="width: 600px;height: 400px;border-radius: 5px;
	    box-shadow: rgba(0, 0, 0, 0.4) 0px 0px 10px;margin: 20px auto;padding: 15px">
	        <p style="line-height: 35px;font-size: 16px">Xin chào, <span>${userLogin.fullName}</span> .Bạn đã gửi yêu cầu xác thực thành công,
	            vui lòng kiểm tra mail để xác thực.Cảm ơn bạn!!!
	        </p>
	        <p>Mọi thắc mắc vui lòng liên hệ bộ phận CSKH của WorkCV:<br></p>
	        - Điện thoại:<span style="color:#5f80ec">(024) 6680 5588</span><br>
	        - Email: <a href="#" style="color:#5f80ec"> hotro@workcv.vn</a>
	    </div>
	</div>
</c:if>
 <c:if test='${userLogin.status.equals("active") && userLogin.role.roleName.equals("user")}'>
<section class="site-section" style="margin-top: 10px">
    <div class="container">
        <form enctype="multipart/form-data">
            <div class="row align-items-center mb-5">
                <div class="col-lg-8 ">
                    <div class="d-flex align-items-center">
                        <div class="form-group" style="margin-top: 15px">
                            <label class="btn btn-primary btn-md btn-file">
                                Chọn cv (pdf)<input type="file" path="file" id="fileUpload1" hidden/>
                            </label>
                        </div>
                    </div>
                    <c:if test="${Cv != null}">
                    	<p id="cvName">${Cv != null ? Cv.fileName :'Chưa cập nhập'}</p>
                    </c:if>
                    <c:if test="${Cv == null}">
                    	<p id="cvName"></p>
                    </c:if>
                    <c:if test="${Cv != null}">
                    	<a id="nameCv" href="${contextPath}/resources/uploads/${Cv.fileName}" >Xem cv</a>
                    </c:if>
                    	<a id="nameCv" href="${contextPath}/resources/uploads" ></a>
                    <c:if test="${Cv != null}">
                    	<a style="color: red;margin-left: 20px" data-toggle="modal" data-target="#exampleModal" >Xóa cv</a>
                    </c:if>
                    <c:if test="${Cv == null}">
                    	<a style="color: red;margin-left: 20px" id="xoa" data-toggle="modal" data-target="#exampleModal" ></a>
                    </c:if>
                </div>

                <div class="col-lg-4">
                    <div class="row">
                        <div class="col-6">
                            <button type="submit" id="myBtn" class="btn btn-block btn-light btn-md">
                            	<span class="icon-open_in_new mr-2"></span>Cập nhật cv
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </form>


        <form:form modelAttribute="user" action="${contextPath}/user/update-profile-user" method="post" >
        	<form:hidden path="id" />
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
                    <div class="p-4 p-md-5 border rounded">
                        <h3 class="text-black mb-5 border-bottom pb-2">Thông tin chi tiết</h3>
                        <div class="form-group">
                            <label for="email">Email</label>
                            <form:input type="text" class="form-control" id="email" path="email" 
                            value="${userLogin.email != null ? userLogin.email : null}" placeholder="you@yourdomain.com"/>
                            <form:errors cssClass="text-danger" path="email" />
                        </div>
                        <div class="form-group">
                            <label for="job-title">Full name</label>
                            <form:input type="text" class="form-control" path="fullName" 
                            value="${userLogin.fullName != null ? userLogin.fullName : null}" id="job-title" placeholder="Full name"/>
                        	<form:errors cssClass="text-danger" path="fullName" />
                        </div>
                        <div class="form-group">
                            <label for="job-location">Địa chỉ</label>
                            <form:input type="text" path="address" 
	                            value="${userLogin.address != null ? userLogin.address : null}" 
	                            class="form-control" id="job-location" placeholder="e.g. New York"/>
	                        <form:errors cssClass="text-danger" path="address" />
                        </div>
                        <div class="form-group">
                            <label for="job-location">Số điện thoại</label>
                            <form:input type="text" path="phoneNumber" 
	                            value="${userLogin.phoneNumber != null ? userLogin.phoneNumber : null}" 
	                            class="form-control" id="job-location" placeholder="+ 84"/>
	                        <form:errors cssClass="text-danger" path="phoneNumber" />
                        </div>
                        <div class="form-group">
                            <label for="job-location">Mô tả bản thân</label>
                            <form:textarea  path="description" class="form-control" 
                            id="editor" placeholder="Mô tả"
                            value="${userLogin.description != null ? userLogin.description : null}" />
                            <form:errors cssClass="text-danger" path="description" />
                        </div>
                    </div>
                </div>
            </div>
        </form:form>
    </div>
</section>
</c:if>
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
	   	edit.setData("${recruiterDTO.description != null ? recruiterDTO.description : user.description}")
	})
    .catch(error => {
        console.error(error);
    });
</script>


	<%@ include file="/WEB-INF/view/layouts/footer.jsp"%>
</body>
</html>