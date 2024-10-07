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
                <p class="breadcrumbs mb-0"><span class="mr-3"><a href="/">Trang chủ <i class="ion-ios-arrow-forward"></i></a></span>Công ty <span></span></p>
                <h1 class="mb-3 bread">Danh sách công ty</h1>
            </div>
        </div>
    </div>
</div>
<section class="ftco-section bg-light" >
    <div class="container">
        <div class="row">
            <div class="col-lg-12 pr-lg-5">
            	<c:if test="${company_list.size() > 0}">
                <div class="row">
                    <c:forEach var="company" items="${company_list}">
                        <div class="col-md-12 ">
                            <div class="job-post-item p-4 d-block d-lg-flex align-items-center">
                                <div class="one-third mb-4 mb-md-0">
                                    <div class="job-post-item-header align-items-center">
                                        <h2 class="mr-3 text-black" >
                                        	<a href="${contextPath}/detail-company/${company.id}">${company.nameCompany}</a>
                                        </h2>
                                    </div>
                                    <div class="job-post-item-body d-block d-md-flex">
                                        <div class="mr-3"><span class="icon-layers"></span> <a href="#">${company.email}</a></div>
                                        <div class="mr-3"><span class="icon-my_location"></span> <span>${company.address}</span></div>
                                        <div style="margin-left: 10"><span class="icon-my_location"></span> 
                                        <span>${company.phoneNumber}</span></div>
                                    </div>
                                </div>
                                <input type="hidden" id="idRe${company.id}" value="${company.id}">
                                <div class="one-forth ml-auto d-flex align-items-center mt-4 md-md-0" style="width:370px !important;">
                                    <a href="${contextPath}/detail-company/${company.id}" class="btn btn-primary py-2">Chi tiết</a>
                                    <a href="${contextPath}/company-post/${company.id}" class="btn btn-warning py-2 ml-1">Danh sách bài đăng</a>
                                </div>
                            </div>
                        </div><!-- end -->
                    </c:forEach>

                </div>
                </c:if>
                <c:if test="${company_list.size() < 1}">
	                <div style="text-align: center">
	                    <p style="color:red;">Danh sách trống</p>
	                </div>
                </c:if>
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
				     <%--    </c:if> --%>
        
                    </div>
                </div>
            </div>

        </div>
    </div>
</section>
	
	<%@ include file="/WEB-INF/view/layouts/footer.jsp"%>
</body>
</html>