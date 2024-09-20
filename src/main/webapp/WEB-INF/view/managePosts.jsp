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
<!-- Modal deleteCV -->

<div class="hero-wrap hero-wrap-2" style="background-image: url('${contextPath}/resources/assets/images/bg_1.jpg');" 
data-stellar-background-ratio="0.5" >
    <div class="overlay"></div>
    <div class="container">
        <div class="row no-gutters slider-text align-items-end justify-content-start">
            <div class="col-md-12 text-center mb-5">
                <p class="breadcrumbs mb-0"><span class="mr-3"><a href="${contextPath}/">Trang chủ <i class="ion-ios-arrow-forward"></i></a></span>Danh sách <span></span></p>
                <h1 class="mb-3 bread">Danh sách bài đăng</h1>
            </div>
        </div>
    </div>
</div>

<c:if test='${mgs_delete_success != null }'>
<div class="toast" data-delay="2500" style="position:fixed; top: 100PX; left: 10PX;z-index: 2000;width: 300px">
    <script>
        swal({
            title: 'Bài đăng đã xoá thành công!',
            text: 'Chuyển hướng về trang danh sách bài đăng...',
            icon: 'success',
            timer: 1000,
            buttons: true,
            type: 'success'
        })
    </script>
</div>
</c:if>
<section class="ftco-section bg-light">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 pr-lg-4">
                <div class="row">
                    
                        <div class="row form-group" >
                            <label for="company-website-tw d-block">Danh sách bài tuyển dụng </label> <br>
                            <div class="col-md-12">
                            	
                                <a href="${contextPath}/recruitment/post?action=add" class="btn px-4 btn-primary text-white">Đăng tuyển</a>
                            </div>
                        </div>

               			<c:forEach var="recruitment" items="${recruitment_list}">
                        <div class="col-md-12 ">
                            <div class="job-post-item p-4 d-block d-lg-flex align-items-center">
                                <div class="one-third mb-4 mb-md-0">
                                    <div class="job-post-item-header align-items-center">
                                        <span class="subadge" >${recruitment.type}</span>
                                        <h2 class="mr-3 text-black" >
                                        <a href="${contextPath}/recruitment/detail/${recruitment.id}">${recruitment.title}</a></h2>
                                    </div>
                                    <div class="job-post-item-body d-block d-md-flex">
                                        <div class="mr-3"><span class="icon-layers"></span> 
                                        <a href="#" >
                                        ${recruitment.company.nameCompany}
                                        </a>
                                        </div>
                                        <div><span class="icon-my_location"></span> <span>${recruitment.address}</span></div>
                                    </div>
                                </div>

                                <div class="one-forth ml-auto d-flex align-items-center mt-4 md-md-0" style="width: 330px !important;">
                                    <div>
                                        <a href="#" class="icon text-center d-flex justify-content-center align-items-center icon mr-2">
                                            <span class="icon-heart"></span>
                                        </a>
                                    </div>
                                    <a href="${contextPath}/recruitment/detail/${recruitment.id}"  
                                    class="btn btn-primary py-2 ml-2">Xem chi tiết</a>
                                    <c:url var="urlUpdate" value="/recruitment/post">
	                            		<c:param name="action" value="update"/>
	                            		<c:param name="id" value="${recruitment.id}" />
	                            		<c:param name="userId" value="${sessionScope.userLogin.id}" />
	                            	</c:url>
                                    <a href="${urlUpdate}"  class="btn btn-warning py-2 ml-2">Cập nhật</a>
                                    <button class="btn btn-danger py-2 ml-2" 
                                    data-toggle="modal" data-target="#modalDelete${recruitment.id}">Xóa</button>

                                </div>
                            </div>
                        </div><!-- end -->
                        <!-- Modal delete-->
                        <div class="modal fade" id="modalDelete${recruitment.id}" tabindex="-1"
                        aria-labelledby="exampleModalLabel" aria-hidden="true">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="exampleModalLabel">Bạn có chắc chắn muốn xóa ?</h5>
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                    <div class="modal-body">
                                        Bài đăng : <span>${recruitment.title}</span>
                                        <form action="${contextPath}/recruitment/delete" method="post">
                                            <input type="hidden" class="form-control" id="id" name="id" value="${recruitment.id}">
                                            <div class="modal-footer mt-1">
                                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
                                                <button type="submit" class="btn btn-danger">Xóa</button>
                                            </div>
                                        </form>
                                    </div>

                                </div>
                            </div>
                        </div>
                        <!-- Modal delete-->
                     </c:forEach>
                </div>
                <div class="row mt-5">
                    <div class="col text-center d-flex justify-content-center">
                       <!-- Pagination -->
				        <c:if test="${totalPages > 1}">
				            <nav aria-label="Page navigation">
				                <ul class="pagination justify-content-center">
				                    <li class="page-item ${currentPage == 1 ? 'disabled' : ''}">
				                        <a class="page-link" href="<c:url value='/recruitment/list-post?page=${currentPage - 1}&size=${pageSize}'/>">&lt;</a>
				                    </li>
				                    
				                    <c:forEach begin="1" end="${totalPages}" var="i">
				                        <li class="page-item ${currentPage == i ? 'active' : ''}">
				                            <a class="page-link" href="<c:url value='/recruitment/list-post?page=${i}&size=${pageSize}'/>">${i}</a>
				                        </li>
				                    </c:forEach>
				                    
				                    <li class="page-item ${currentPage == totalPages ? 'disabled' : ''}">
				                        <a class="page-link" href="<c:url value='/recruitment/list-post?page=${currentPage + 1}&size=${pageSize}'/>">&gt;</a>
				                    </li>
				                </ul>
				            </nav>
				        </c:if>
        
                    </div>
                </div>
            </div>

        </div>
    </div>
</section>

	<%@ include file="/WEB-INF/view/layouts/footer.jsp"%>
</body>
</html>