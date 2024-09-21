<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/view/layouts/tagJSTL.jsp"%>   
<div class="col-md-12 nav-link-wrap">
	<div class="nav nav-pills text-center" id="v-pills-tab"
		role="tablist" aria-orientation="vertical">
		<a class="nav-link active mr-md-1" id="v-pills-1-tab"
			data-toggle="pill" href="#v-pills-1" role="tab"
			aria-controls="v-pills-1" aria-selected="true">Tìm công
			việc</a> <a class="nav-link" id="v-pills-2-tab"
			data-toggle="pill" href="#v-pills-2" role="tab"
			aria-controls="v-pills-2" aria-selected="false">Tìm theo công ty</a> 
			<a class="nav-link" id="v-pills-3-tab"
			data-toggle="pill" href="#v-pills-3" role="tab"
			aria-controls="v-pills-3" aria-selected="false">Tìm theo
			địa điểm</a>

	</div>
</div> 
<div class="col-md-12 tab-wrap">

	<div class="tab-content p-4" id="v-pills-tabContent">

		<div class="tab-pane fade show active" id="v-pills-1"
			role="tabpanel" aria-labelledby="v-pills-nextgen-tab">
			<form:form action="${contextPath}/search" method="post"
				class="search-job" modelAttribute="searchForm">
				<input type="hidden" name="type" value="job" >
				<div class="row no-gutters">

					<div class="col-md-10 mr-md-2">
						<div class="form-group">
							<div class="form-field">
								<div class="icon">
									<span class="icon-map-marker"></span>
								</div>
								<form:input type="text" path="keyword" class="form-control"
									placeholder="Tìm kiếm công việc"/>
								<form:errors path="keyword" cssClass="text-danger" />
							</div>
						</div>
					</div>
					<div class="col-md">
						<div class="form-group">
							<div class="form-field">
								<button type="submit"
									class="form-control btn btn-primary">Tìm kiếm</button>
							</div>
						</div>
					</div>
				</div>
			</form:form>
		</div>

		<div class="tab-pane fade" id="v-pills-2" role="tabpanel"
			aria-labelledby="v-pills-performance-tab">
			<form:form action="${contextPath}/search" method="post"
				class="search-job" modelAttribute="searchForm">
				<input type="hidden" name="type" value="company" >
				<div class="row no-gutters">

					<div class="col-md-10 mr-md-2">
						<div class="form-group">
							<div class="form-field">
								<div class="icon">
									<span class="icon-map-marker"></span>
								</div>
								<form:input type="text" path="keyword" class="form-control"
									placeholder="Tìm theo công ty"/>
							</div>
						</div>
					</div>
					<div class="col-md">
						<div class="form-group">
							<div class="form-field">
								<button type="submit"
									class="form-control btn btn-primary">Tìm kiếm</button>
							</div>
						</div>
					</div>
				</div>
			</form:form>
		</div>
		<div class="tab-pane fade" id="v-pills-3" role="tabpanel"
			aria-labelledby="v-pills-performance-tab">
			<form:form action="${contextPath}/search" method="post"
				class="search-job" modelAttribute="searchForm">
				<input type="hidden" name="type" value="address" >
				<div class="row no-gutters">
					<div class="col-md-10 mr-md-2">
						<div class="form-group">
							<div class="form-field">
								<div class="icon">
									<span class="icon-map-marker"></span>
								</div>
								<form:input type="text" path="keyword" class="form-control"
									placeholder="Tìm kiếm theo địa điểm"/>
							</div>
						</div>
					</div>
					<div class="col-md">
						<div class="form-group">
							<div class="form-field">
								<button type="submit"
									class="form-control btn btn-primary">Tìm kiếm</button>
							</div>
						</div>
					</div>
				</div>
			</form:form>
		</div>
	</div>
</div>