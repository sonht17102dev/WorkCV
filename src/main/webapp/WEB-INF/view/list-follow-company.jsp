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
<div class="hero-wrap hero-wrap-2" style="background-image: url('user/assets/images/bg_1.jpg');" data-stellar-background-ratio="0.5" th:if="${session.user.role.id == 1 }">
    <div class="overlay"></div>
    <div class="container">
        <div class="row no-gutters slider-text align-items-end justify-content-start">
            <div class="col-md-12 text-center mb-5">
                <p class="breadcrumbs mb-0"><span class="mr-3"><a href="/">Trang chủ <i class="ion-ios-arrow-forward"></i></a></span>Công ty <span></span></p>
                <h1 class="mb-3 bread">Danh sách công ty đã theo dõi</h1>
            </div>
        </div>
    </div>
</div>
<div class="hero-wrap hero-wrap-2" style="background-image: url('user/assets/images/bg_1.jpg');" data-stellar-background-ratio="0.5" th:if="${session.user.role.id == 2 }">
    <div class="overlay"></div>
    <div class="container">
        <div class="row no-gutters slider-text align-items-end justify-content-start">
            <div class="col-md-12 text-center mb-5">

                <h1 class="mb-3 bread">Không tìm thấy trang yêu cầu</h1>
            </div>
        </div>
    </div>
</div>

<section class="ftco-section bg-light" th:if="${session.user.role.id == 1 }">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 pr-lg-5">
                <div th:if="${saveJobList.totalPages > 0}" class="row">
                    <th:block th:each="saveJob : ${saveJobList.content}">
                        <div class="col-md-12 ">
                            <div class="job-post-item p-4 d-block d-lg-flex align-items-center">
                                <div class="one-third mb-4 mb-md-0">
                                    <div class="job-post-item-header align-items-center">
<!--                                        <span class="subadge" th:text="${saveJob.com.type}"></span>-->
                                        <h2 class="mr-3 text-black" ><a th:text="${saveJob.company.nameCompany}" th:href="${'/user/detail-company/'}+${saveJob.company.id}"></a></h2>
                                    </div>
                                    <div class="job-post-item-body d-block d-md-flex">
                                        <div class="mr-3"><span class="icon-layers"></span> <a href="#" th:text="${saveJob.company.email}" ></a></div>
                                        <div class="mr-3"><span class="icon-my_location"></span> <span th:text="${saveJob.company.address}"></span></div>
                                        <div style="margin-left: 10"><span class="icon-my_location"></span> <span th:text="${saveJob.company.phoneNumber}"></span></div>
                                    </div>
                                </div>
                                <input type="hidden" th:id="${'idRe'}+${saveJob.company.id}" th:value="${saveJob.company.id}">
                                <div class="one-forth ml-auto d-flex align-items-center mt-4 md-md-0" style="width:370px !important;">
                                    <div>
                                        <a  th:href="${'/user/delete-follow/'}+${saveJob.id}" class="icon text-center d-flex justify-content-center align-items-center icon mr-2">
                                            <span class="icon-delete"></span>
                                        </a>
                                    </div>
                                    <a th:href="${'/user/detail-company/'}+${saveJob.company.id}" class="btn btn-primary py-2">Chi tiết</a>
                                    <a th:href="${'/user/company-post/'}+${saveJob.company.id}" class="btn btn-warning py-2 ml-1">Danh sách bài đăng</a>
                                </div>
                            </div>
                        </div><!-- end -->
                    </th:block>

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
</body>
</html>