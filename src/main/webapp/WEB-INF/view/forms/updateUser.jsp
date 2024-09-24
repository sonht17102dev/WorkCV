<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/layouts/tagJSTL.jsp"%>
<form:form modelAttribute="userDTO"
	action="${contextPath}/user/update-profile" method="post">
	<form:hidden path="image" value="${user.image}" />
	<form:hidden path="id" />
	<div class="row align-items-center mb-5">
		<div class="col-lg-8 mb-4 mb-lg-0">
			<div class="d-flex align-items-center">
				<div>
					<h2>Cập nhật thông tin</h2>
				</div>
			</div>
		</div>
		<div class="col-lg-4">
			<div class="row">

				<div class="col-6">
					<button type="submit" class="btn btn-block btn-primary btn-md">Lưu
						thông tin</button>
				</div>
			</div>
		</div>
	</div>
	<div class="row mb-5">
		<div class="col-lg-12">
			<div class="p-4 p-md-5 border rounded">
				<h3 class="text-black mb-5 border-bottom pb-2">Thông tin chi
					tiết</h3>
				<div class="form-group">
					<label for="email">Email</label>
					<form:input type="text" class="form-control" id="email"
						path="email"
						placeholder="you@yourdomain.com" />
					<form:errors cssClass="text-danger" path="email" />
				</div>
				<div class="form-group">
					<label for="job-title">Full name</label>
					<form:input type="text" class="form-control" path="fullName"
						id="job-title" placeholder="Full name" />
					<form:errors cssClass="text-danger" path="fullName" />
				</div>
				<div class="form-group">
					<label for="job-location">Địa chỉ</label>
					<form:input type="text" path="address"
						class="form-control" id="job-location" placeholder="e.g. New York" />
					<form:errors cssClass="text-danger" path="address" />
				</div>
				<div class="form-group">
					<label for="job-location">Số điện thoại</label>
					<form:input type="text" path="phoneNumber"
						class="form-control" id="job-location" placeholder="+ 84" />
					<form:errors cssClass="text-danger" path="phoneNumber" />
				</div>
				<div class="form-group">
					<label for="job-location">Mô tả bản thân</label>
					<form:textarea path="description" class="form-control" id="editor"
						placeholder="Mô tả"
						/>
					<form:errors cssClass="text-danger" path="description" />
				</div>
			</div>
		</div>
	</div>
</form:form>