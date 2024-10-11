<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/layouts/tagJSTL.jsp"%>
<div class="col-lg-6">
	<h2 class="mb-4">Thông tin công ty</h2>
	<div class="form-group">
		<label for="company-website-tw d-block1">Cập nhật Logo</label> <br>
		<c:url value="/resources/assets/images/${companyDTO.logo}"
			var="urlCompanyImg" />
		<form
			action="${pageContext.request.contextPath}/user/uploadImgCompany"
			method="post" enctype="multipart/form-data">
			<label class="btn btn-primary btn-md btn-file"> <input
				type="file" name="file" id="fileUpload2">
			</label> <input type="hidden" name="recruiterId" value="${userLogin.id}" />
			<button class="btn btn-warning btn-md btn-file" type="submit">Tải
				lên</button>
		</form>
		<div id="divLogo">
			<img id="avatar1" height="100" width="100"
				style="border-radius: 50px"
				src="${companyDTO.logo != null ? urlCompanyImg : 
                        'https://st.quantrimang.com/photos/image/072015/22/avatar.jpg'}">
		</div>
	</div>
	<form:form
		action="${pageContext.request.contextPath}/user/update-company"
		modelAttribute="companyDTO" method="post">
		<div class="row mb-5">
			<div class="col-lg-12">
				<div class="p-4 p-md-5 border rounded">
					<div class="form-group">
						<label for="email">Email</label>
						<form:input type="text" class="form-control"
							path="email" />
						<form:errors cssClass="text-danger" path="email" />
					</div>
					<div class="form-group">
						<label for="job-title">Tên công ty</label>
						<form:input type="text" class="form-control" path="nameCompany" />
						<form:errors cssClass="text-danger" path="nameCompany" />
					</div>
					<div class="form-group">
						<label for="job-location">Địa chỉ</label>
						<form:input type="text" path="address" class="form-control" />
						<form:errors cssClass="text-danger" path="address" />
					</div>
					<div class="form-group">
						<label for="job-location">Số điện thoại công ty</label>
						<form:input type="text" path="phoneNumber" class="form-control" />
						<form:errors cssClass="text-danger" path="phoneNumber" />
					</div>
					<div class="form-group">
						<label for="job-location">Mô tả công ty</label>
						<form:textarea path="description" class="form-control"
							id="editor2"  />
						<form:errors cssClass="text-danger" path="description" />
					</div>

					<c:url value="/resources/assets/images/${companyDTO.logo}"
						var="urlCompanyImg" />
					<c:if test="${companyDTO.logo != null}">
						<div style="margin-left: 0px" id="divImag1">
							<img id="avatar" height="100" width="100"
								style="border-radius: 50px; margin-bottom: 15px"
								src="${urlCompanyImg}">
						</div>
					</c:if>
					<div class="row form-group">
						<div class="col-md-12">
							<input type="submit" value="Lưu thông tin"
								class="btn px-4 btn-primary text-white">
						</div>
					</div>
				</div>
			</div>
		</div>
	</form:form>
</div>
