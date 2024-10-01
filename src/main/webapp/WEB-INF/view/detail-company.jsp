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
<div class="hero-wrap hero-wrap-2" style="background-image: url('${contextPath}/resources/assets/images/bg_1.jpg');" data-stellar-background-ratio="0.5">
    <div class="overlay"></div>
    <div class="container">
        <div class="row no-gutters slider-text align-items-end justify-content-start">
            <div class="col-md-12 text-center mb-5">
                <p class="breadcrumbs mb-0"><span class="mr-3"><a href="index.html">Trang chủ <i class="ion-ios-arrow-forward"></i></a></span>Chi tiết <span></span></p>
                <h1 class="mb-3 bread">Chi tiết công ty</h1>
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
                        <img width="100" height="100" src="${contextPath}/resources/assets/images/${company.logo}" alt="Image">
                    </div>
                    <div>
                        <h2>${company.nameCompany}</h2>
                        <div>
                            <span class="icon-briefcase mr-2"></span><span class="ml-0 mr-2 mb-2">${company.email}</span>
                            <span  class="icon-room mr-2"></span ><span class="m-2">${company.address}</span>

                        </div>
                        <input type="hidden" id="idCompany" value="${company.id}">
                        <input type="hidden" id="userLoginId" value="${userLogin.id}">
                    </div>
                </div>
            </div>
            <div class="col-lg-4">
                <div class="row">
                	<c:if test="${userLogin != null }">
                	
                    <div class="col-6">
                    	<c:if test='${userLogin.role.roleName.equals("user")}'>
	                        <a onclick="follow()" class="btn btn-block btn-light btn-md">
	                        <span class="icon-heart-o mr-2 text-danger"></span>Theo dõi</a>
                        </c:if>
                    </div>
                    </c:if>
                    <c:if test="${userLogin == null }">
                    <div class="col-6">
                        <a onclick="follow()" class="btn btn-block btn-light btn-md">
                        <span class="icon-heart-o mr-2 text-danger"></span>Theo dõi</a>
                    </div>
                    </c:if>
                    <div class="col-6">

                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-8">
                <div class="mb-5">

                    <h3 class="h5 d-flex align-items-center mb-4 text-primary"><span class="icon-align-left mr-3"></span>Mô tả công việc</h3>
                    <p>${company.description}</p>
                </div>

            </div>
            <div class="col-lg-4">
                <div class="bg-light p-3 border rounded mb-4">
                    <h3 class="text-primary  mt-3 h5 pl-3 mb-3 ">Tóm tắt công việc</h3>
                    <ul class="list-unstyled pl-3 mb-0">

                        <li class="mb-2"><strong class="text-black">Email công ty: </strong> <span>${company.email}</span></li>
                        <li class="mb-2"><strong class="text-black">Số điện thoại: </strong> <span>${company.phoneNumber}</span></li>
                        <li class="mb-2"><strong class="text-black">Đại chỉ: </strong> <span>${company.address}</span></li>
                    </ul>
                </div>

                <div class="bg-light p-3 border rounded">
                    <h3 class="text-primary  mt-3 h5 pl-3 mb-3 ">Share</h3>
                    <div class="px-3">
                        <a href="#" class="pt-3 pb-3 pr-3 pl-0"><span class="icon-facebook"></span></a>
                        <a href="#" class="pt-3 pb-3 pr-3 pl-0"><span class="icon-twitter"></span></a>
                        <a href="#" class="pt-3 pb-3 pr-3 pl-0"><span class="icon-linkedin"></span></a>
                        <a href="#" class="pt-3 pb-3 pr-3 pl-0"><span class="icon-pinterest"></span></a>
                    </div>
                </div>

            </div>
        </div>
    </div>
    <script>
    	var isFollowed = true;
        function follow(){
            var name = "#idCompany";
            var userLoginId = "#userLoginId";
            var idCompany = $(name).val();
            var idUser = $(userLoginId).val();
            var formData = new FormData();
            formData.append('idCompany', idCompany);
            formData.append('idUser', idUser);
            if(isFollowed) {
	            $.ajax({
	               type: 'POST',
	               url: '${contextPath}/user/follow-company/',
	               contentType: false,
	               processData: false,
	               data: formData,
	               success: function (data) {
	               	if (data.message == 'error') {
	                       swal({
	                           title: 'Bạn cần phải đăng nhập!',
	                           icon: 'error',
	                           timer: 3000,
	                           buttons: true,
	                           type: 'error'
	                       })
	                   }else if (data.message == 'saveSuccess') {
	                       swal({
	                           title: 'Theo dõi thành công!',
	                           icon: 'success',
	                           timer: 3000,
	                           buttons: true,
	                           type: 'success'
	                       })
	                   }
	               },
	               error: function (err) {
	                   alert(err);
	               }
	            })
            } else {
            	$.ajax({
 	               type: 'POST',
 	               url: '${contextPath}/user/unfollow-company/',
 	               contentType: false,
 	               processData: false,
 	               data: formData,
 	               success: function (data) {
 	               	if (data.message == 'error') {
 	                       swal({
 	                           title: 'Bạn cần phải đăng nhập!',
 	                           icon: 'error',
 	                           timer: 3000,
 	                           buttons: true,
 	                           type: 'error'
 	                       })
 	                   }else if (data.message == 'unSaveSuccess') {
 	                       swal({
 	                           title: 'Bỏ theo dõi thành công!',
 	                           icon: 'success',
 	                           timer: 3000,
 	                           buttons: true,
 	                           type: 'success'
 	                       })
 	                   }
 	               },
 	               error: function (err) {
 	                   alert(err);
 	               }
 	            })
            }
            isFollowed = !isFollowed;
        }
        
    </script>
</section>

<%@ include file="/WEB-INF/view/layouts/footer.jsp"%>
</body>
</html>