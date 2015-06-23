<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<div id="fb-root" style="background-color: green;"></div>


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

<img id="share_button" src="../../images/facebookIcon.jpg" height="55px"
	width="55px" class="img-rounded" style="cursor: pointer;">

<script type="text/javascript">
	$(document)
			.ready(
					function() {
						$('#share_button')
								.click(
										'click',
										function(e) {
											var Temp = document
													.getElementById("recipeNo").value;
											e.preventDefault();
											FB
													.ui({
														method : 'feed',
														name : 'This is the content of the "name" field.',
														link : 'http://127.0.0.1:8080/rcipe/app/recipe/viewRecipe?recipeNo='
																+ Temp,
														caption : 'This is the content of the "caption" field.',
														description : 'This is the content of the "description" field, below the caption.',
														message : 'This is text in the message box a user can add to or replace.'
													});
										});
					});
</script>