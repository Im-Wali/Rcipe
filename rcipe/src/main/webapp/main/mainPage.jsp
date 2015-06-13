<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<HTML>
<HEAD>
<title>Recipe</title>
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
	<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
<script src="${pageContext.servletContext.contextPath }/js/jquery.lazyload.js"></script>
<style type="text/css">
.form-login {
	background-color: #DDDDDD;
	padding-top: 10px;
	padding-bottom: 20px;
	padding-left: 20px;
	padding-right: 20px;
	border-radius: 15px;
	border-color: #d2d2d2;
	border-width: 5px;
	box-shadow: 0 1px 0 #cfcfcf;
}
</style>
</HEAD>
<BODY>
	<div><jsp:include page="menuBar.jsp"></jsp:include></div>
	<jsp:include page="imageSlider.jsp"></jsp:include>
	<!-- 가상의 입력 목록  start-->
	<jsp:include page="cardSession.jsp"/>
	<!-- 가상의 입력 목록  end-->
</BODY>
</HTML>