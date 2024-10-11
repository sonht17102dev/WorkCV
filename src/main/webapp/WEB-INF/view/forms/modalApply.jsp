<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<!-- Modal -->
<div class="modal fade" id="exampleModal${recruitment.id}" tabindex="-1"
	role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">
					Ứng tuyển: <span>${recruitment.title}</span>
				</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<form method="post" action="/user/apply-job">
				<input type="hidden" id="userLoginId" value="${userLogin.id}" />
				<div class="modal-body">
					<div class="row">
						<div class="col-12">
							<select id="choose${recruitment.id}"
								onchange="choosed(${recruitment.id})" class="form-control"
								aria-label="Default select example">
								<option selected>Chọn phương thức nộp</option>
								<option value="1">Dùng cv đã cập nhật</option>
								<option value="2">Nộp cv mới</option>
							</select>
						</div>
						<div id="loai1${recruitment.id}" style="display: none"
							class="col-12">
							<label for="fileUpload" class="col-form-label">Giới
								thiệu:</label>
							<textarea rows="10" cols="3" class="form-control"
								id="text${recruitment.id}"></textarea>
						</div>
						<div id="loai2${recruitment.id}" style="display: none"
							class="col-12">

							<label for="fileUpload" class="col-form-label">Chọn cv:</label> <input
								type="file" class="form-control"
								id="fileUpload${recruitment.id}" name="file" required>
							<p class="text-error" id="errorFile"></p>
							<label for="fileUpload" class="col-form-label">Giới
								thiệu:</label>
							<p class="text-error" id="errorText"></p>
							<textarea rows="10" cols="3" class="form-control"
								id="text${recruitment.id}"></textarea>
						</div>

					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">Đóng</button>
						<button type="button" id="button1${recruitment.id}"
							style="display: none" onclick="apply1(${recruitment.id})"
							class="btn btn-primary">Nộp</button>
						<button type="button" id="button2${recruitment.id}"
							style="display: none" onclick="apply(${recruitment.id})"
							class="btn btn-primary">Nộp</button>
					</div>
				</div>
			</form>


		</div>
	</div>
</div>