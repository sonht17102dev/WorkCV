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
	<c:if test='${userLogin.role.roleName.equals("user")}'>
	<section class="ftco-section bg-light">
	    <div class="container">
	        <div class="row">
	            <div class="col-lg-12 pr-lg-5">
	            	<c:if test="${listApplyPosts.size() > 0}">
	                <div class="row">
	                	<c:forEach var="applyJob" items="${listApplyPosts}">
                        <div class="col-md-12 ">
                            <div class="job-post-item p-4 d-block d-lg-flex align-items-center">
                                <div class="one-third mb-4 mb-md-0">
                                    <div class="job-post-item-header align-items-center">
                                        <span class="subadge">${applyJob.recruitment.type}</span>
                                        <h2 class="mr-3 text-black" >
                                        	<a href="${contextPath}/recruitment/detail/${applyJob.recruitment.id}">${applyJob.recruitment.title}</a>
                                       	</h2>
                                    </div>
                                    <div class="job-post-item-body d-block d-md-flex">
                                        <div class="mr-3"><span class="icon-layers"></span> 
                                        	<a href="${contextPath}/detail-company/${applyJob.recruitment.company.id}">
                                        		${applyJob.recruitment.company.nameCompany}</a>
                                       	</div>
                                        <div><span class="icon-my_location"></span> <span>${applyJob.recruitment.address}</span></div>
                                    </div>
                                </div>
                                <input type="hidden" id="idRe${applyJob.recruitment.id}" value="${applyJob.recruitment.id}">
                                <div class="one-forth ml-auto d-flex align-items-center mt-4 md-md-0">
                                    <c:if test="${applyJob.status == 1}">
                                    	<p style="color: #1e7e34;font-weight: bold;margin-top: 10px">Đã duyệt</p>
                                    </c:if>
                                    <c:if test="${applyJob.status == 0}">
                                    	<p style="color: red;font-weight: bold;margin-top: 10px">Đợi duyệt</p>
                                    </c:if>
                                </div>
                            </div>
                        </div><!-- end -->
						</c:forEach>
	                </div>
	                </c:if>
	                <c:if test="${listApplyPosts.size() < 1}">
	                <div style="text-align: center">
	                    <p style="color:red;">Danh sách trống</p>
	                </div>
	                </c:if>
	                <%-- <div class="row mt-5">
	                    <div class="col text-center">
	                        <div class="block-27">
	                            <ul>
	                            	<c:if test="${numberPage>0}">
	                                	<li><a href="${contextPath}/save-job/get-list?page=${saveJobList.number - 1}">&lt;</a></li>
	                                </c:if>
	                                <c:forEach var= "recruitment" items="${recruitmentList}">
	                                    <li class="${numberPage == state.index  ? 'active' : null }">
	                                   		<a href="${contextPath}/save-job/get-list?page=${state.index}">${state.index + 1}</a>
	                                    </li>
	                                </c:forEach>
	                                <c:if test="${numberPage<saveJobList.totalPages - 1}">
	                                	<li><a href="${contextPath}/save-job/get-list?page=${saveJobList.number + 1}">&gt;</a></li>
	                                </c:if>
	                            </ul>
	                        </div>
	                    </div>
	                </div> --%>
	            </div>
	
	        </div>
	    </div>
	</section>
	</c:if>
<%@ include file="/WEB-INF/view/layouts/footer.jsp"%>
</body>
</html>