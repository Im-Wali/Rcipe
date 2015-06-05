<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html >


		<div id="fb-root" style="background-color:green;"></div>


		<script>
			window.fbAsyncInit = function() {
				FB.init({
					appId : '1603485886591063',
					status : true, // check login status
					cookie : true, // enable cookies to allow the server to access the session
					xfbml : true
				// parse XFBML
				});
			};

			(function() {
				var e = document.createElement('script');
				e.src = document.location.protocol
						+ '//connect.facebook.net/en_US/all.js';
				e.async = true;
				document.getElementById('fb-root').appendChild(e);
			}());
		</script>

		<img id="share_button" src="../img/facebook.png">

		<script type="text/javascript">
			$(document)
					.ready(
							function() {
								$('#share_button')
										.live(
												'click',
												function(e) {
													e.preventDefault();
													FB
															.ui({
																method : 'feed',
																name : 'This is the content of the "name" field.',
																link : ' http://www.naver.com/',	// �대�遺�� �����url濡������
																picture : 'sample.jpg',		// �대�遺�� ������대�吏�url
																caption : 'This is the content of the "caption" field.',
																description : 'This is the content of the "description" field, below the caption.',
																message : 'This is text in the message box a user can add to or replace.'
															});
												});
							});
		</script>
