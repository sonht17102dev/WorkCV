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
	
	<c:if test='${ message != null}'>
	<div class="toast" data-delay="2500"
		style="position: fixed; top: 100PX; right: 10PX; z-index: 2000; width: 300px">
		
		<script>
			swal({
				title : 'Đã duyệt thành công',
				icon : 'success',
				timer : 2000,
				buttons : true,
				type : 'success'
			})
		</script>
	</div> 
	</c:if>
	<c:if test='${ delete_success != null}'>
	<div class="toast" data-delay="2500"
		style="position: fixed; top: 100PX; right: 10PX; z-index: 2000; width: 300px">
		<script>
			swal({
				title : 'Xoá công việc đã ứng tuyển thành công',
				icon : 'success',
				timer : 2000,
				buttons : true,
				type : 'success'
			})
		</script>
	</div> 
	</c:if>
	<div class="hero-wrap hero-wrap-2" style="background-image: url('/resources/assets/images/bg_1.jpg');" data-stellar-background-ratio="0.5" th:if="${session.user.role.id == 1 }">
	    <div class="overlay"></div>
	    <div class="container">
	        <div class="row no-gutters slider-text align-items-end justify-content-start">
	            <div class="col-md-12 text-center mb-5">
	                <p class="breadcrumbs mb-0"><span class="mr-3"><a href="${contextPath}/">Trang chủ <i class="ion-ios-arrow-forward"></i></a></span>
	                ${userLogin.role.roleName.equals("user") ? 'Công việc' : 'Ứng viên'} <span></span></p>
	                <h1 class="mb-3 bread">${userLogin.role.roleName.equals("user") ? 'Danh sách công việc đã ứng tuyển' : 'Danh sách Ứng viên đã ứng tuyển'}</h1>
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
	                                    <div>
	                                        <a data-toggle="modal" data-target="#deleteModal${applyJob.id}"
	                                        class="icon text-center d-flex justify-content-center align-items-center icon mr-2">
	                                            <span class="icon-delete"></span>
	                                        </a>
	                                    </div>
                                    	<p style="color: red;font-weight: bold;margin-top: 10px">Đợi duyệt</p>
                                    </c:if>
                                </div>
                            </div>
                        </div><!-- end -->
                         <!-- Modal delete-->
                        <div class="modal fade" id="deleteModal${applyJob.id}" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="exampleModalLabel">Bạn có chắc chắn muốn xóa ?</h5>
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                    <div class="modal-body">
                                        Công việc đang ứng tuyển: <span>${applyJob.recruitment.title}</span>
                                        <form action="${contextPath}/user/delete-apply/" method="post">
                                            <input type="hidden" name="id" value="${applyJob.id}">
                                            <div class="modal-footer mt-1">
                                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
                                                <button type="submit" class="btn btn-danger">Xóa</button>
                                            </div>
                                        </form>
                                    </div>

                                </div>
                            </div>
                        </div>
						</c:forEach>
	                </div>
	                </c:if>
	                <c:if test="${listApplyPosts.size() < 1}">
	                <div style="text-align: center">
	                    <p style="color:red;">Danh sách trống</p>
	                </div>
	                </c:if>
	                
	            </div>
	
	        </div>
	    </div>
	</section>
	</c:if>
	<c:if test='${userLogin.role.roleName.equals("recruiter") && listApplyPosts != null}'>
	<section class="ftco-section bg-light">
	    <div class="container">
        <div class="row">
            <div class="col-lg-12 pr-lg-4">
                <div class="row">
                	<c:if test="${listApplyPosts.size() > 0}">
                    <c:forEach var="applyPost" items="${listApplyPosts}">
                        <div class="col-md-12" style="box-shadow: rgba(0, 0, 0, 0.4) 0px 0px 10px;margin: 20px auto;">
                            <div class="team d-md-flex p-4 bg-white">
                            	<c:set var="imageApplyUser" value="${contextPath}/resources/assets/images/${applyPost.user.image}"/>
                            	
                                <img class="img" src="${applyPost.user.image != null ? imageApplyUser : 'https://st.quantrimang.com/photos/image/072015/22/avatar.jpg'}"></IMG>
                                <div class="text pl-md-4">
                                    <h5 class="location mb-0">${applyPost.user.fullName}</h5>
                                    <p style="display: block;color: black">${applyPost.user.address}</p>
                                    <span class="position" style="display: block;color: black">${applyPost.user.email}</span>
                                    <p class="mb-4" style="width: 700px" >${applyPost.user.description}</p>
                                    <div class="row">
                                      	<c:if test="${applyPost.nameCv != null}"> 
                                      	<c:set var="cvUrl" value="${contextPath}/resources/assets/images/${applyPost.nameCv}"/>
                                        <p>
                                        <a class="btn btn-primary"  href="${cvUrl}" >Xem cv </a>
                                        </p> 
                                      	</c:if>
                                        <c:if test="${applyPost.status == 0}">
                                        <p style="margin-left: 10px">
                                        	<a class="btn btn-outline-primary" 
                                        	href="${contextPath}/recruitment/approve?id=${applyPost.id}&recruitmentId=${applyPost.recruitment.id}" >Duyệt</a>
                                        </p>
                                        </c:if>
                                        <c:if test="${applyPost.status == 1}">
                                        <p style="margin-left: 10px;margin-top: 15px"><span style="color: #1e7e34;font-weight: bold" >Đã duyệt</span></p>
                                        </c:if>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </c:forEach>
                    </c:if>
                    <c:if test='${userLogin.role.roleName.equals("recruiter") && listApplyPosts.size() == 0}'>
                        <p>Chưa có ứng cử viên nào ứng tuyển</p>
					</c:if>
                </div>
            </div>
        </div>
    </div>
    </section>
	</c:if>
<%@ include file="/WEB-INF/view/layouts/footer.jsp"%>
</body>
</html>