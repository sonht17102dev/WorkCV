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
	<div class="hero-wrap hero-wrap-2" style="background-image: url('/resources/assets/images/bg_1.jpg');" data-stellar-background-ratio="0.5" th:if="${session.user.role.id == 1 }">
	    <div class="overlay"></div>
	    <div class="container">
	        <div class="row no-gutters slider-text align-items-end justify-content-start">
	            <div class="col-md-12 text-center mb-5">
	                <p class="breadcrumbs mb-0"><span class="mr-3"><a href="/">Trang chủ <i class="ion-ios-arrow-forward"></i></a></span>Công việc <span></span></p>
	                <h1 class="mb-3 bread">Danh sách công việc đã ứng tuyển</h1>
	            </div>
	        </div>
	    </div>
	</div>
	
	<section class="ftco-section bg-light" th:if="${session.user.role.id == 1 }">
	    <div class="container">
	        <div class="row">
	            <div class="col-lg-12 pr-lg-5">
	                <div th:if="${saveJobList.totalPages > 0}" class="row">
	                        <div class="col-md-12 ">
	                            <div class="job-post-item p-4 d-block d-lg-flex align-items-center">
	                                <div class="one-third mb-4 mb-md-0">
	                                    <div class="job-post-item-header align-items-center">
	                                        <span class="subadge" th:text="${saveJob.recruitment.type}"></span>
	                                        <h2 class="mr-3 text-black" ><a th:text="${saveJob.recruitment.title}" th:href="${'/recruitment/detail/'} +${saveJob.recruitment.id}"></a></h2>
	                                    </div>
	                                    <div class="job-post-item-body d-block d-md-flex">
	                                        <div class="mr-3"><span class="icon-layers"></span> <a href="#" th:text="${saveJob.recruitment.Company.nameCompany}" ></a></div>
	                                        <div><span class="icon-my_location"></span> <span th:text="${saveJob.recruitment.address}"></span></div>
	                                    </div>
	                                </div>
	                                <input type="hidden" th:id="${'idRe'}+${saveJob.recruitment.id}" th:value="${saveJob.recruitment.id}">
	                                <div class="one-forth ml-auto d-flex align-items-center mt-4 md-md-0">
	                                    <div>
	                                        <a  th:href="${'/user/delete-apply/'}+${saveJob.id}" class="icon text-center d-flex justify-content-center align-items-center icon mr-2">
	                                            <span class="icon-delete"></span>
	                                        </a>
	                                    </div>
	                                    <p th:if="${saveJob.status == 1}" style="color: #1e7e34;font-weight: bold;margin-top: 10px">Đã duyệt</p>
	                                    <p th:if="${saveJob.status == 0}" style="color: red;font-weight: bold;margin-top: 10px">Đợi duyệt</p>
	                                </div>
	                            </div>
	                        </div><!-- end -->
	                        <!-- Modal -->
	                        <div class="modal fade" th:id="${'exampleModal'}+${saveJob.recruitment.id}" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	                            <div class="modal-dialog" role="document">
	                                <div class="modal-content">
	                                    <div class="modal-header">
	                                        <h5 class="modal-title" id="exampleModalLabel">Ứng tuyển: <span th:text="${saveJob.recruitment.title}"></span></h5>
	                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	                                            <span aria-hidden="true">&times;</span>
	                                        </button>
	                                    </div>
	                                    <form method="post" action="/user/apply-job">
	                                        <div class="modal-body">
	                                            <div class="row">
	                                                <div class="col-12">
	                                                    <label for="fileUpload"
	                                                           class="col-form-label">Chọn cv:</label>
	                                                    <input type="file" class="form-control"
	                                                           th:id="${'fileUpload'}+${saveJob.recruitment.id}" name="file"   required>
	                                                    <label for="fileUpload"
	                                                           class="col-form-label">Giới thiệu:</label>
	                                                    <textarea rows="10" cols="3" class="form-control"  th:id="${'text'}+${saveJob.recruitment.id}" >
	
	                                                    </textarea>
	                                                </div>
	
	                                            </div>
	                                            <div class="modal-footer">
	                                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
	                                                <button type="button" th:onclick="'apply(' +${saveJob.recruitment.id}+ ')'" class="btn btn-primary">Nộp</button>
	                                            </div>
	                                        </div>
	                                    </form>
	
	
	                                </div>
	                            </div>
	                        </div>
	
	                </div>
	                <div style="text-align: center" th:if="${saveJobList.totalPages < 1}">
	                    <p style="color:red;">Danh sách trống</p>
	                </div>
	                <div class="row mt-5">
	                    <div class="col text-center">
	                        <div class="block-27">
	                            <ul>
	                                <li th:if="${numberPage>0}"><a th:href="@{/save-job/get-list(page = ${saveJobList.number - 1})}">&lt;</a></li>
	                                <th:block th:each="recruitment,state  : ${recruitmentList}">
	                                    <li th:class="${numberPage == state.index  ? 'active' : null }"><a th:href="@{/save-job/get-list(page = ${state.index})}" th:text="${state.index + 1}"></a></li>
	                                </th:block>
	                                <li th:if="${numberPage<saveJobList.totalPages - 1}"><a th:href="@{/save-job/get-list(page = ${saveJobList.number + 1})}">&gt;</a></li>
	                            </ul>
	                        </div>
	                    </div>
	                </div>
	            </div>
	
	        </div>
	    </div>
	</section>
	<script>
	    function apply(id){
	        var name = "#idRe" +id;
	        var nameModal = "#exampleModal" +id;
	        var nameFile = "#fileUpload"+id;
	        var nameText = "#text" +id;
	        var idRe = $(name).val();
	        var textvalue = $(nameText).val();
	        var fileUpload = $(nameFile).get(0);
	        var files = fileUpload.files;
	        var formData = new FormData();
	        formData.append('file', files[0]);
	        formData.append('idRe', idRe);
	        formData.append('text', textvalue);
	        if(files[0] == null){
	            swal({
	                title: 'Bạn cần phải chọn cv!',
	                /* text: 'Redirecting...', */
	                icon: 'error',
	                timer: 3000,
	                buttons: true,
	                type: 'error'
	            })
	        } else {
	            $.ajax(
	                {
	                    type: 'POST',
	                    url: '/user/apply-job/',
	                    contentType: false,
	                    processData: false,
	                    data: formData,
	                    success: function (data) {
	                        if(data == "false"){
	                            swal({
	                                title: 'Bạn cần phải đăng nhập!',
	                                /* text: 'Redirecting...', */
	                                icon: 'error',
	                                timer: 3000,
	                                buttons: true,
	                                type: 'error'
	                            })
	                        }else if(data == "true"){
	                            swal({
	                                title: 'Ứng tuyển thành công!',
	                                /* text: 'Redirecting...', */
	                                icon: 'success',
	                                timer: 3000,
	                                buttons: true,
	                                type: 'success'
	                            })
	                            $(nameModal).modal('hide');
	                            $('#fileUpload').val("");
	                        }else{
	                            swal({
	                                title: 'Bạn đã ứng tuyển công việc này!',
	                                /* text: 'Redirecting...', */
	                                icon: 'error',
	                                timer: 3000,
	                                buttons: true,
	                                type: 'error'
	                            })
	                            $(nameModal).modal('hide');
	                            $('#fileUpload').val("");
	                        }
	                    },
	                    error: function (err) {
	                        alert(err);
	                    }
	                }
	            )
	        }
	
	    }
	    function save(id){
	        var name = "#idRe" +id;
	        var idRe = $(name).val();
	        var formData = new FormData();
	        formData.append('idRe', idRe);
	        $.ajax(
	            {
	                type: 'POST',
	                url: '/save-job/save/',
	                contentType: false,
	                processData: false,
	                data: formData,
	                success: function (data) {
	                    if(data == "false"){
	                        swal({
	                            title: 'Bạn cần phải đăng nhập!',
	                            /* text: 'Redirecting...', */
	                            icon: 'error',
	                            timer: 3000,
	                            buttons: true,
	                            type: 'error'
	                        })
	                    }else if(data == "true"){
	                        swal({
	                            title: 'Lưu thành công!',
	                            /* text: 'Redirecting...', */
	                            icon: 'success',
	                            timer: 3000,
	                            buttons: true,
	                            type: 'success'
	                        })
	                    }else{
	                        swal({
	                            title: 'Bạn đã lưu bài này rồi!',
	                            /* text: 'Redirecting...', */
	                            icon: 'error',
	                            timer: 3000,
	                            buttons: true,
	                            type: 'error'
	                        })
	                    }
	                },
	                error: function (err) {
	                    alert(err);
	                }
	            }
	        )
	    }
	</script>
<%@ include file="/WEB-INF/view/layouts/footer.jsp"%>
</body>
</html>