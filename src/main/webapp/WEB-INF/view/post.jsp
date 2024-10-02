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
	<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
	<c:if test="${msg_error != null }">
	<div class="toast" data-delay="2500" style="position:fixed; top: 100PX; left: 10PX;z-index: 2000;width: 300px">
	    <script>
	        swal({
	            title: '${msg_error}!',
	            text: 'Chuyển hướng về trang đăng bài...',
	            icon: 'error',
	            timer: 2000,
	            buttons: true,
	            type: 'error'
	        })
	    </script>
	</div>
	</c:if>
	<c:if test="${msg_success != null}">
	<div class="toast" data-delay="2500" style="position:fixed; top: 100PX; left: 10PX;z-index: 2000;width: 300px">
	    <script>
	        swal({
	            title: '${msg_success}!',
	            text: 'Chuyển hướng về trang Danh sách bài đăng...',
	            icon: 'success',
	            timer: 2000,
	            buttons: false,
	            type: 'success'
	        })
	         .then(() => {
	            // Điều hướng sau khi toast kết thúc
	            window.location.href = '${contextPath}/recruitment/list-post';
	        }); 
	    </script>
	</div>
	</c:if>
	<c:if test="${mgs_delete_success != null}">
	<div class="toast" data-delay="2500" style="position:fixed; top: 100PX; left: 10PX;z-index: 2000;width: 300px">
	    <script>
	        swal({
	            title: '${mgs_delete_success}!',
	            text: 'Chuyển hướng về trang Danh sách bài đăng...',
	            icon: 'success',
	            timer: 2000,
	            buttons: false,
	            type: 'success'
	        })
	         .then(() => {
	            // Điều hướng sau khi toast kết thúc
	            window.location.href = '${contextPath}/recruitment/list-post';
	        }); 
	    </script>
	</div>
	</c:if>
	<div class="hero-wrap hero-wrap-2" style="background-image: url('${contextPath}/resources/assets/images/bg_1.jpg');" data-stellar-background-ratio="0.5">
	    <div class="overlay"></div>
	    <div class="container">
	        <div class="row no-gutters slider-text align-items-end justify-content-start">
	            <div class="col-md-12 text-center mb-5">
	                <p class="breadcrumbs mb-0"><span class="mr-3"><a href="${contextPath}/">Trang chủ <i class="ion-ios-arrow-forward"></i></a></span> 
	                ${param.action.equals("add") ? "Đăng bài tuyển dụng" : "Cập nhật bài đăng"}<span></span></p>
	                <h1 class="mb-3 bread">${param.action.equals("add") ? "Đăng bài tuyển dụng" : "Cập nhật bài đăng"}</h1>
	            </div>
	        </div>
	    </div>
	</div>	


	<section class="section-hero overlay inner-page bg-image" 
	id="home-section" >
	    <div class="container">
	        <div class="row">
	            <div class="col-md-7">
	                <h1 class="text-white font-weight-bold">${param.action.equals("add") ? "Đăng bài tuyển dụng" : "Cập nhật bài đăng"}</h1>
	                <div class="custom-breadcrumbs">
	                    <a href="${contextPath}/">Trang chủ</a> <span class="mx-2 slash">/</span>
	                    <span class="text-white">
	                    	<strong>${param.action.equals("add") ? "Đăng bài tuyển dụng" : "Cập nhật bài đăng"}</strong>
	                    </span>
	                </div>
	            </div>
	        </div>
	    </div>
	</section>

	
	<section class="site-section">
	    <div class="container">
	    <form:form action="${contextPath}/recruitment/add" method="post" modelAttribute="recruitmentDTO">
	    	<form:input type="hidden" path="userId" value="${userLogin.id}" />
	    	<form:input type="hidden" path="id" />
	        <div class="row align-items-center mb-5">
	            <div class="col-lg-8 mb-4 mb-lg-0">
	                <div class="d-flex align-items-center">
	                    <div>
	                        <h2>${param.action.equals("add") ? "Đăng bài tuyển dụng" : "Cập nhật bài đăng"}</h2>
	                    </div>
	                </div>
	            </div>
	            <c:if test="${param.action.equals('add')}">
	            <div class="col-lg-4">
	                <div class="row">
	                    <div class="col-6">
	                        <a href="#" class="btn btn-block btn-light btn-md"></a>
	                    </div>
	                    <div class="col-6">
	                        <button type="submit" class="btn btn-block btn-primary btn-md">Đăng</button>
	                    </div>
	                </div>
	            </div>
	            </c:if>
	        </div>
	        <div class="row mb-5">
	            <div class="col-lg-12">
	                <div class="p-4 p-md-5 border rounded" method="post">
	                    <h3 class="text-black mb-5 border-bottom pb-2">Chi tiết bài tuyển dụng</h3>
	
	                    <div class="form-group">
	                        <label for="email">Tiêu đề</label>
	                        <form:input type="text" class="form-control" path="title" placeholder="Tiêu đề"/>
	                        <form:errors cssClass="text-danger" path="title" />
	                    </div>
	                    <div class="form-group">
	                        <label for="job-location">Mô tả công việc</label>
	                        <form:textarea path="description" class="form-control" id="editorN" placeholder="Mô tả công việc"/>
	                        <form:errors cssClass="text-danger" path="description" />
	                    </div>
	                    <div class="form-group">
	                        <label for="job-title">Kinh nghiệm</label>
	                        <form:input type="text" class="form-control" path="experience" placeholder="Kinh nghiệm"/>
	                        <form:errors cssClass="text-danger" path="experience" />
	                    </div>
	                    <div class="form-group">
	                        <label for="job-title">Số người cần tuyển</label>
	                        <form:input type="number" class="form-control" path="quantity" placeholder="Số người cần tuyển"/>
	                        <form:errors cssClass="text-danger" path="quantity" />
	                    </div>
	                    <div class="form-group">
	                        <label for="job-location">Địa chỉ</label>
	                        <form:input type="text" class="form-control"  path="address" placeholder="Địa chỉ công ty"/>
	                        <form:errors cssClass="text-danger" path="address" />
	                    </div>
	                    <div class="form-group">
	                        <label for="job-location">Hạn ứng tuyển</label>
	                        <form:input type="date" class="form-control"  path="deadline" placeholder="Địa chỉ công ty"/>
	                    	<form:errors cssClass="text-danger" path="deadline" />
	                    </div>
	                    <div class="form-group">
	                        <label for="job-location">Lương</label>
	                        <form:input type="text" class="form-control" path="salary" placeholder="Mức lương"/>
	                        <form:errors cssClass="text-danger" path="salary" />
	                    </div>
	
	                    <div class="form-group">
	                        <label for="job-region">Loại công việc</label>
	                        <form:select class="form-control" path="type" >
                            	<form:option value="">Chọn loại công việc</form:option>
	                            <c:forEach var="type" items="${types}">
	                                 <form:option value="${type}">${type}</form:option>
	                            </c:forEach>
	                        </form:select>
							<form:errors cssClass="text-danger" path="type" />
	
	                    </div>
	                    <div class="form-group">
	                        <label for="job-region">Danh mục công việc</label>
	                        <form:select class="form-control" path="category" >
                            	<form:option value="">Chọn danh mục công việc</form:option>
	                            <c:forEach var="cat" items="${categories}">
	                                 <form:option value="${cat}">${cat}</form:option>
	                            </c:forEach>
	                        </form:select>
							<form:errors cssClass="text-danger" path="category" />
	                    </div>
	                </div>
	            </div>
	
	        </div>
	        <c:if test='${param.action.equals("update")}'>
	        <div class="row align-items-center mb-5">
	            <div class="col-lg-4 ml-auto">
	                <div class="row">
	                    <div class="col-6">
	                        <a href="#" class="btn btn-block btn-light btn-md"></a>
	                    </div>
	                    <div class="col-6">
	                        <button type="submit" class="btn btn-block btn-primary btn-md">Cập nhật</button>
	                    </div>
	                </div>
	            </div>
	        </div>
	        </c:if>
	    </form:form>
	    </div>
	</section>

	<script>
	    ClassicEditor.create(document.querySelector('#editorN')).then(eidt => {
	        console.log("da" + eidt);
	    })
	        .catch(error => {
	            console.error(error);
	        });
	</script>
	<%@ include file="/WEB-INF/view/layouts/footer.jsp"%>
</body>
</html>