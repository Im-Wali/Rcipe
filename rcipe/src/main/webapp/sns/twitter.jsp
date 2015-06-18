<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 <script type="text/javascript">
 $(document).ready(function () {
 $('#btnTweet').click(function(e){
	  //We tell our browser not to follow that link
	  e.preventDefault();
	  //We get the URL of the link
	  var loc = $(this).attr('name');
	  alert(loc);
	  //We get the title of the link
	  var title  = escape($(this).attr('title'));
	  //We trigger a new window with the Twitter dialog, in the middle of the page
	  window.open('http://twitter.com/share?url=' + loc + '&text=' + title + '&', 'twitterwindow', 'height=450, width=550, top='+($(window).height()/2 - 225) +', left='+$(window).width()/2 +', toolbar=0, location=0, menubar=0, directories=0, scrollbars=0');
	});
 });
</script>
	<button id="btnTweet" title="Rcipe recipe11 @Rcipe" style="border:none;"
		name="http://127.0.0.1:8080${pageContext.servletContext.contextPath }/app/recipe/viewRecipe?recipeNo=${recipe.recipeNo}">
		<img src="${pageContext.servletContext.contextPath}/images/twitterIcon.jpg""
		 height="55px" width="55px"class="img-rounded" style="cursor:pointer;  ">
	</button>