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

<%-- <div th:if="${success}" class="toast" data-delay="2000" style="position:fixed;top: 100PX; right: 10PX;z-index: 2000;width: 300px">
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
</div> --%>
<!-- END nav -->
<div class="hero-wrap hero-wrap-2" style="background-image: url('${contextPath}/resources/assets/images/bg_2.jpg');" data-stellar-background-ratio="0.5">
  <div class="overlay"></div>
  <div class="container">
    <div class="row no-gutters slider-text align-items-end justify-content-start">
      <div class="col-md-12 text-center mb-5">
        <p class="breadcrumbs mb-0"><span class="mr-3"><a href="/">Trang chủ <i class="ion-ios-arrow-forward"></i></a></span>Danh sách <span></span></p>
        <h1 class="mb-3 bread">Danh sách bài đăng</h1>
      </div>
    </div>
  </div>
</div>


<section class="ftco-section bg-light">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 pr-lg-4">
                <div class="row">
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
									<a href="${contextPath}/recruitment/detail/${recruitment.id}"  
                                    class="btn btn-primary py-2 ml-2">Xem chi tiết</a>
                                    <c:url var="urlUpdate" value="/recruitment/post">
	                            		<c:param name="action" value="update"/>
	                            		<c:param name="id" value="${recruitment.id}" />
	                            		<c:param name="userId" value="${sessionScope.userLogin.id}" />
	                            	</c:url>
                                </div>
                            </div>
                        </div><!-- end -->
                     </c:forEach>
                </div>
                <div class="row mt-5">
                    <div class="col text-center d-flex justify-content-center">
                       <!-- Pagination -->
				        <%-- <c:if test="${totalPages > 1}"> --%>
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
				       <%--  </c:if> --%>
        
                    </div>
                </div>
            </div>

        </div>
    </div>
</section>
	<%@ include file="/WEB-INF/view/layouts/footer.jsp"%>
</body>
</html>