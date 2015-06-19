<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script>
	$("document")
			.ready(
					function() {
						$('#loseEmail')
								.bind(
										'keyup',
										function() {
											var chk1 = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
											var p = $(this).val();
											if (!chk1.test(p)) {
												//이메일 형식이 알파벳+숫자@알파벳+숫자.알파벳+숫자 형식일 경우
												$('#loseEmailDiv')
														.html(
																function(index,
																		html) {
																	return "<span style='color:red;'>이메일 형식과 일치하지 않습니다.</span>";
																});
											} else {
												$('#loseEmailDiv')
														.html(
																function(index,
																		html) {
																	$(
																			'#isEmail')
																			.val(
																					"true");
																	return "<span style='color:blue;'>이메일 형식이 일치합니다.</span>";
																});
											}
										});
						$("#sendCheckEmailTempPw")
								.click(
										function(event) {
											var check = $('#isEmail').val();
											var loseEmail = $('#loseEmail')
													.val();
											if (loseEmail == '') {
												alert("이메일을 입력해주세요!");
												event.preventDefault();
											} else if (check === 'false') {
												alert("이메일을 정확히 입력하세요.");
												event.preventDefault();
												$('#sendCheckTempPwDiv')
														.html(
																function(index,
																		html) {
																	return "<span style='color:red;'>이메일을 제대로 작성되지 않았습니다.</span>";
																});
											} else {
												alert("임시 비밀번호가 발송되었습니다. 로그인해주세요.");
												$.get("../email/send?email="
														+ loseEmail
														+ "&type=lose",
														function(data) {
														});

											}
										});
					});
</script>
<input type='hidden' id='isEmail' value='false'>
<div class="modal fade" id="modifyLosePasswordModal" tabindex="-1"
	role="dialog" aria-labelledby="modifyLosePasswordModal"
	aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header" style="border-color: black" align="center">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title" id="exampleModalLabel"
					style="font-size: 2em">비밀번호 찾기</h4>
			</div>
			<div class="modal-body">
				<div class="form-group">

					<label for="recipient-name" class="control-label">이메일</label> <input
						type="text" class="form-control" id="loseEmail" name="loseEmail">
					<div id="loseEmailDiv"></div>
					<div align="center" style="margin:2%">
						<button class="btn btn-lg btn-info" id="sendCheckEmailTempPw"
							style="color: white;width:60%">임시비밀번호발송</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
