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
<c:if test='${delete_success != null}'>
<div class="toast" data-delay="2000" style="position:fixed;top: 100PX; right: 10PX;z-index: 2000;width: 300px">
    <script>
        swal({
            title: 'Xóa thành công!',
            /* text: 'Redirecting...', */
            icon: 'success',
            timer: 3000,
            buttons: true,
            type: 'success'
        })
    </script>
</div>
</c:if>
<!-- END nav -->
<div class="hero-wrap hero-wrap-2" style="background-image: url('user/assets/images/bg_1.jpg');" data-stellar-background-ratio="0.5" th:if="${session.user.role.id == 1 }">
    <div class="overlay"></div>
    <div class="container">
        <div class="row no-gutters slider-text align-items-end justify-content-start">
            <div class="col-md-12 text-center mb-5">
                <p class="breadcrumbs mb-0"><span class="mr-3"><a href="/">Trang chủ <i class="ion-ios-arrow-forward"></i></a></span>Công việc <span></span></p>
                <h1 class="mb-3 bread">Danh sách công việc đã lưu</h1>
            </div>
        </div>
    </div>
</div>
<%-- <div class="hero-wrap hero-wrap-2" style="background-image: url('user/assets/images/bg_1.jpg');" data-stellar-background-ratio="0.5" th:if="${session.user.role.id == 2 }">
    <div class="overlay"></div>
    <div class="container">
        <div class="row no-gutters slider-text align-items-end justify-content-start">
            <div class="col-md-12 text-center mb-5">

                <h1 class="mb-3 bread">Không tìm thấy trang yêu cầu</h1>
            </div>
        </div>
    </div>
</div> --%>
<c:if test='${userLogin.role.roleName.equals("user")}'>
<section class="ftco-section bg-light" >
    <div class="container">
        <div class="row">
            <div class="col-lg-12 pr-lg-5">
            	<c:if test="${saveJobList.size() > 0}">
                <div class="row">
                    <c:forEach var="saveJob" items="${saveJobList}">
                        <div class="col-md-12 ">
                            <div class="job-post-item p-4 d-block d-lg-flex align-items-center">
                                <div class="one-third mb-4 mb-md-0">
                                    <div class="job-post-item-header align-items-center">
                                        <span class="subadge">${saveJob.recruitment.type}</span>
                                        <h2 class="mr-3 text-black" ><a href="${contextPath}/recruitment/detail/${saveJob.recruitment.id}">${saveJob.recruitment.title}</a></h2>
                                    </div>
                                    <div class="job-post-item-body d-block d-md-flex">
                                        <div class="mr-3"><span class="icon-layers"></span> 
                                        <a href="#">${saveJob.recruitment.company.nameCompany}</a></div>
                                        <div><span class="icon-my_location"></span> <span>${saveJob.recruitment.address}</span></div>
                                    </div>
                                </div>
                                <input type="hidden" id="idRe${saveJob.recruitment.id}" value="${saveJob.recruitment.id}">
                                <div class="one-forth ml-auto d-flex align-items-center mt-4 md-md-0">
                                    <div>
                                        <a data-toggle="modal" data-target="#deleteModal${saveJob.recruitment.id}"
                                        class="icon btn text-center d-flex justify-content-center align-items-center icon mr-2">
                                            <span class="icon-delete"></span>
                                        </a>
                                    </div>
                                    <a  data-toggle="modal" data-target="#applyModal${saveJob.recruitment.id}" class="btn btn-primary py-2">Apply Job</a>
                                </div>
                            </div>
                        </div><!-- end -->
                        <!-- Modal delete-->
                        <div class="modal fade" id="deleteModal${saveJob.recruitment.id}" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="exampleModalLabel">Bạn có chắc chắn muốn xóa ?</h5>
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                    <div class="modal-body">
                                        Bài đăng : <span>${saveJob.recruitment.title}</span>
                                        <form action="${contextPath}/save-job/delete" method="post">
                                            <input type="hidden" class="form-control" name="id" value="${saveJob.id}">
                                            <div class="modal-footer mt-1">
                                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
                                                <button type="submit" class="btn btn-danger">Xóa</button>
                                            </div>
                                        </form>
                                    </div>

                                </div>
                            </div>
                        </div>
                        
                        <!-- Modal -->
                        <div class="modal fade" id="applyModal${saveJob.recruitment.id}" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="exampleModalLabel">Ứng tuyển: <span>${saveJob.recruitment.title}</span></h5>
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                    <form method="post" action="/user/apply-job">
                                        <div class="modal-body">
                                            <div class="row">
                                                <div class="col-12">
                                                    <select id="choose${saveJob.recruitment.id}" onchange="choosed(${saveJob.recruitment.id})" 
                                                    class="form-control" aria-label="Default select example">
                                                        <option selected>Chọn phương thức nộp</option>
                                                        <option value="1">Dùng cv đã cập nhật</option>
                                                        <option value="2">Nộp cv mới</option>
                                                    </select>
                                                </div>
                                                <div id="loai1${saveJob.recruitment.id}" style="display:none" class="col-12">
                                                    <label for="fileUpload"
                                                           class="col-form-label">Giới thiệu:</label>
                                                    <textarea rows="10" cols="3" class="form-control"  id="text${saveJob.recruitment.id}" >

                                                    </textarea>
                                                </div>
                                                <div id="loai2${saveJob.recruitment.id}" style="display:none" class="col-12">

                                                    <label for="fileUpload"
                                                           class="col-form-label">Chọn cv:</label>
                                                    <input type="file" class="form-control"
                                                           id="fileUpload${saveJob.recruitment.id}" name="file"   required>
                                                    <label for="fileUpload"
                                                           class="col-form-label">Giới thiệu:</label>
                                                    <textarea rows="10" cols="3" class="form-control"  id="text${saveJob.recruitment.id}" >

                                                    </textarea>
                                                </div>

                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
                                                <button type="button" id="button1${saveJob.recruitment.id}" style="display: none" 
                                                onclick="apply1(${saveJob.recruitment.id})" class="btn btn-primary">Nộp</button>
                                                <button type="button" id="button2${saveJob.recruitment.id}" style="display: none" 
                                                onclick="apply(${saveJob.recruitment.id})" class="btn btn-primary">Nộp</button>
                                            </div>
                                        </div>
                                    </form>
<!--                                    <form method="post" action="/user/apply-job">-->
<!--                                        <div class="modal-body">-->
<!--                                            <div class="row">-->
<!--                                                <div class="col-12">-->
<!--                                                    <label for="fileUpload"-->
<!--                                                           class="col-form-label">Chọn cv:</label>-->
<!--                                                    <input type="file" class="form-control"-->
<!--                                                           th:id="${'fileUpload'}+${saveJob.recruitment.id}" name="file"   required>-->
<!--                                                    <label for="fileUpload"-->
<!--                                                           class="col-form-label">Giới thiệu:</label>-->
<!--                                                    <textarea rows="10" cols="3" class="form-control"  th:id="${'text'}+${saveJob.recruitment.id}" >-->

<!--                                                    </textarea>-->
<!--                                                </div>-->

<!--                                            </div>-->
<!--                                            <div class="modal-footer">-->
<!--                                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>-->
<!--                                                <button type="button" th:onclick="'apply(' +${saveJob.recruitment.id}+ ')'" class="btn btn-primary">Nộp</button>-->
<!--                                            </div>-->
<!--                                        </div>-->
<!--                                    </form>-->


                                </div>
                            </div>
                        </div>
                    </c:forEach>

                </div>
                </c:if>
                <c:if test="${saveJobList.size() < 1}">
                <div style="text-align: center" >
                    <p style="color:red;">Danh sách trống</p>
                </div>
                </c:if>
                <%-- <div class="row mt-5">
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
                </div> --%>
            </div>

        </div>
    </div>
</section>
</c:if>
<script>
    function apply1(id){
        var name = "#idRe" +id;
        var nameModal = "#exampleModal" +id;
        var nameFile = "#fileUpload"+id;
        var nameText = "#text" +id;
        var idRe = $(name).val();
        var textvalue = $(nameText).val();
        var formData = new FormData();
        formData.append('idRe', idRe);
        formData.append('text', textvalue);
        $.ajax(
            {
                type: 'POST',
                url: '/user/apply-job1/',
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
    function choosed(id){
        var name = '#choose' + id;
        var name1 = 'loai1' + id;
        var name2 = 'loai2' + id;
        var button1 = 'button1' + id;
        var button2 = 'button2' + id;
        var giaitri = $(name).val();
        if(giaitri == 1){
            document.getElementById(name1).style.display = 'block'
            document.getElementById(name2).style.display = 'none'
            document.getElementById(button1).style.display = 'block'
            document.getElementById(button2).style.display = 'none'
        }else{
            document.getElementById(name2).style.display = 'block'
            document.getElementById(name1).style.display = 'none'
            document.getElementById(button2).style.display = 'block'
            document.getElementById(button1).style.display = 'none'
        }
    }

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
</body>
</html>