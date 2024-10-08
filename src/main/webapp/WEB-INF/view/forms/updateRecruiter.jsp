<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/layouts/tagJSTL.jsp"%>
<div class="col-lg-6 mb-5">
	<h2 class="mb-4">Thông tin cá nhân</h2>
	<form:form
		action="${pageContext.request.contextPath}/user/update-profile"
		modelAttribute="userDTO" method="post">
		<form:hidden path="id"  />
		<form:hidden path="image" value="${userDTO.image}"/>
		<div class="row mb-5">
			<div class="col-lg-12">
				<div class="p-4 p-md-5 border rounded">
					<div class="form-group">
						<label for="email">Email</label>
						<form:input type="email" class="form-control" path="email"
							id="email" />
						<form:errors cssClass="text-danger" path="email" />
					</div>
					<div class="form-group">
						<label for="job-title">Họ và tên</label>
						<form:input type="text" class="form-control" path="fullName" />
						<form:errors cssClass="text-danger" path="fullName" />
					</div>
					<div class="form-group">
						<label for="job-location">Địa chỉ</label>
						<form:input type="text" path="address" class="form-control" />
						<form:errors cssClass="text-danger" path="address" />
					</div>
					<div class="form-group">
						<label for="job-location">Số điện thoại</label>
						<form:input type="text" path="phoneNumber" class="form-control" />
						<form:errors cssClass="text-danger" path="phoneNumber" />
					</div>
					<div class="form-group">
						<label for="job-location">Mô tả bản thân</label>
						<form:textarea path="description" class="form-control" id="editor1"/>
						<form:errors cssClass="text-danger" path="description" />

					</div>
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
