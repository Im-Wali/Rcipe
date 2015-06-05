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
					                                	$('#isEmail').val("true");
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
											if(loseEmail==''){
												alert("이메일을 입력해주세요!");
												event.preventDefault();
											}else if (check === 'false') {
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
												$.get(
														"../email/send?email="
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
		<div class="modal-dialog" style="background-color: #FF9933">
			<div class="modal-content" style="background-color: #FF9933;">
				<div class="modal-header"
					style="background-color: #FF9933; border-color: black">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="exampleModalLabel">비밀번호 찾기</h4>
				</div>
				<div class="modal-body">
					<div class="form-group">

						<label for="recipient-name" class="control-label">이메일</label> <input
							type="text" class="form-control" id="loseEmail" name="loseEmail">
						<div id="loseEmailDiv"></div>
						<div class="modal-footer" style="border-color: black">
							<button  class="btn btn-primary"
								id="sendCheckEmailTempPw"
								style="background-color: #FFFFFF; border-color: #FFFFFF; color: black">임시비밀번호발송</button>
							<!--          <input type="image" src="login.gif" alt="로그인" /> -->
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
