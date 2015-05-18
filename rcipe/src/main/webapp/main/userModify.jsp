<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script>
	$("document")
			.ready(
					function() {
						$("#updatePassword1")
								.bind(
										'keyup',
										function() {
											var p = $(this).val();
											chk1 = /^[a-z\d]{8,12}$/i; //a-z와 0-9이외의 문자가 있는지 확인
											chk2 = /[a-z]/i; //적어도 한개의 a-z 확인
											chk3 = /\d/; //적어도 한개의 0-9 확인
											if (!chk1.test(p)) {
												$('#updatePassword1Ckecked')
														.html(
																function(index,
																		html) {
																	return "<span style='color:red;'>영어,숫자 조합의 8자이상 12자이하을 입력하세요</span>";
																});
											} else if (!chk2.test(p)) {
												$('#updatePassword1Ckecked')
														.html(
																function(index,
																		html) {
																	return "<span style='color:red;'>적어도 하나이상의 영어가 들어가야합니다.</span>";
																});
											} else if (!chk3.test(p)) {
												$('#updatePassword1Ckecked')
														.html(
																function(index,
																		html) {
																	return "<span style='color:red;'>적어도 하나이상의 숫자가 들어가야합니다.</span>";
																});
											} else {
												$('#updatePassword1Ckecked')
														.html(
																function(index,
																		html) {
																	return "<span style='color:blue;'>올바른 비밀번호입니다.</span>";
																});
											}
											return chk1.test(p) && chk2.test(p)
													&& chk3.test(p);
										});
						$("#updatePassword2")
								.bind(
										'keyup',
										function() {
											var p = $(this).val();
											var s = $('#updatePassword1').val();
											if (p === s) {
												$('#updatePassword1Ckecked2')
														.html(
																function(index,
																		html) {
																	return "<span id='passwordCheck' style='color:blue;'>비밀번호 확인 완료</span>";
																});
											} else {
												$('#updatePassword1Ckecked2')
														.html(
																function(index,
																		html) {
																	return "<span id='passwordCheck' style='color:red;'>비밀번호가 같지 않습니다.</span>";
																});
											}
										});

						$("#passwardOK").click(
								function() {
									var p = $('#updatePassword2').val();
									// if($('#passwordCheck').val()==='비밀번호 확인 완료')
									$.get(
											"../app/user/updatePassword?newPassword="
													+ p, function(data) {

											});
												alert("비밀번호가 변경 되었습니다.");

								});
					});
</script>
<form method="POST" action="#">
	<div class="modal fade" id="modifyPasswordModal" tabindex="-1"
		role="dialog" aria-labelledby="modifyPasswordModal" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="exampleModalLabel">비밀번호 수정</h4>
				</div>
				<div class="modal-body">
					<div class="form-group">
						<label for="recipient-name" class="control-label">기존
							비밀번호입력</label> <input type="text" class="form-control" id="password">
					</div>
					<div class="form-group">
						<label for="message-text" class="control-label">변경 비밀번호</label> <input
							type="password" class="form-control" id="updatePassword1"
							placeholder="영어 또는 숫자로 이루어진 8자리 이상 15이하로 입력하세요 ">
						<div id="updatePassword1Ckecked"></div>
					</div>
					<div class="form-group">
						<label for="message-text" class="control-label">변경 비밀번호</label> <input
							type="password" class="form-control" id="updatePassword2"
							placeholder="비밀번호확인">
						<div id="updatePassword1Ckecked2"></div>
					</div>
				</div>
				<div class="modal-footer">
					<button id="passwardOK" type="submit" class="btn btn-primary">확인</button>
				</div>
			</div>
		</div>
	</div>
</form>

