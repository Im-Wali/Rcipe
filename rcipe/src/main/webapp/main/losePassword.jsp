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
										function() {
											var check = $('#isEmail').val();
											var loseEmail = $('#loseEmail')
													.val();
											if (check === 'false') {
												$('#sendCheckTempPwDiv')
														.html(
																function(index,
																		html) {
																	return "<span style='color:red;'>이메일을 제대로 작성되지 않았습니다.</span>";
																});
											} else {
												alert("인증번호를 발송했습니다. 5분내로 입력해주세요");
												$.get(
														"../app/email/send?email="
																+ loseEmail
																+ "&type=lose",
														function(data) {
															$('#randomNumber')
																	.val(data);
														});
												$("#sendCheckEmailTempPw")
														.html('인증번호 재발송');
												clearInterval(timer);
												$("#numberMinuteTimer").html(
														"5");
												$("#numberTimer").html(":");
												$("#numberSecondTimer").html(
														"00");
												timer = setInterval(
														function() {
															minute = $(
																	"#numberMinuteTimer")
																	.html();
															second = $(
																	"#numberSecondTimer")
																	.html();
															if (second == 0
																	&& minute == 0) {
																alert('인증시간이 끝났습니다.');
																$(
																		'#randomNumber')
																		.val(
																				'false');
																clearInterval(timer);
															} else {
																second--;
																// 분처리
																if (second < 0) {
																	minute--;
																	second = 59;
																}
															}
															$(
																	"#numberMinuteTimer")
																	.html(
																			minute);
															$(
																	"#numberSecondTimer")
																	.html(
																			second);
														}, 1000);/* millisecond 단위의 인터벌 */
											}
										});
						$("#checkSendTempPw").click(
								function() {
									var num = $('#randomNumber').val();
									var sendNum = $('#sendTempPw').val();
									if (num === "false") {
										alert("인증번호 발송이 되지않았습니다.");
										$('#sendTempPw').val('');
									} else if (sendNum === num) {
										alert('인증완료');
										$('#checkSendTempPw').attr('disabled',
												true);
										$('#checkSendTempPw').css(
												'background-color', '#838383');
										clearInterval(timer);
										isSubmit = true;
									} else {
										alert("인증번호가 일치하지않습니다.");
										$('#sendTempPw').val('');
									}
								});
					});
</script>
<input type='hidden' id='isEmail' value='false'>
<form method="POST" action="#" name="losePasswordForm"
	id="losePasswordForm">
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
						<div class="form-group">
							<label for="recipient-name" class="control-label">인증번호입력</label>
							<input type="text" class="form-control" id="sendTempPw"
								maxlength="8" placeholder="5분내로 입력해주세요">
							<div id="sendCheckTempPwDiv"></div>
							<div align="right" style="font: bold; font-size: 1.5em">
								<span id="numberMinuteTimer"></span><span id="numberTimer"></span><span
									id="numberSecondTimer"></span>
							</div>
						</div>
						<div align="right">
							<button id="sendCheckEmailTempPw" type="button"
								class="btn btn-primary"
								style="background-color: #FFFFFF; border-color: #FFFFFF; color: black; margin-bottom: 1%">인증번호
								발송</button>
							<button id="checkSendTempPw" type="button"
								class="btn btn-primary"
								style="background-color: #FFFFFF; border-color: #FFFFFF; color: black; margin-bottom: 1%">인증</button>
						</div>
						<div class="modal-footer" style="border-color: black">
							<button type="submit" class="btn btn-primary"
								id="losePasswardSubmit"
								style="background-color: #FFFFFF; border-color: #FFFFFF; color: black">확인</button>
							<!--          <input type="image" src="login.gif" alt="로그인" /> -->
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</form>