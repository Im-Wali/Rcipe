<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
<!--
.row {
	margin-left: 0px;
	margin-right: 0px;
}

#wrapper {
	padding-left: 70px;
	transition: all .4s ease 0s;
	height: 100%
}

#sidebar-wrapper {
	margin-left: -195px;
	left: 70px;
	width: 170px;
	background: #222;
	position: fixed;
	height: 100%;
	z-index: 10000;
	transition: all .4s ease 0s;
}

.sidebar-nav {
	display: block;
	float: left;
	width: 170px;
	list-style: none;
	margin: 0;
	padding: 0;
}

#page-content-wrapper {
	padding-left: 0;
	margin-left: 0;
	width: 100%;
	height: auto;
}

#wrapper.active {
	padding-left: 250px;
}

#wrapper.active #sidebar-wrapper {
	left: 190px;
}

#page-content-wrapper {
	width: 100%;
}

#sidebar_menu li a, .sidebar-nav li a {
	color: #999;
	display: block;
	float: left;
	text-decoration: none;
	width: 170px;
	background: #252525;
	border-top: 1px solid #373737;
	border-bottom: 1px solid #1A1A1A;
	-webkit-transition: background .5s;
	-moz-transition: background .5s;
	-o-transition: background .5s;
	-ms-transition: background .5s;
	transition: background .5s;
}

.sidebar_name {
	padding-top: 25px;
	color: #fff;
	opacity: .7;
}

.sidebar-nav li {
	line-height: 40px;
	text-indent: 20px;
}

.sidebar-nav li a {
	color: #999999;
	display: block;
	text-decoration: none;
}

.sidebar-nav li a:hover {
	color: #fff;
	background: rgba(255, 255, 255, 0.2);
	text-decoration: none;
}

.sidebar-nav li a:active, .sidebar-nav li a:focus {
	text-decoration: none;
}

.sidebar-nav>.sidebar-brand {
	height: 65px;
	line-height: 60px;
	font-size: 18px;
}

.sidebar-nav>.sidebar-brand a {
	color: #999999;
}

.sidebar-nav>.sidebar-brand a:hover {
	color: #fff;
	background: none;
}

#main_icon {
	float: right;
	padding-right: 65px;
	padding-top: 20px;
}

.sub_icon {
	float: right;
	padding-right: 65px;
	padding-top: 10px;
}

.content-header {
	height: 65px;
	line-height: 65px;
}

.content-header h1 {
	margin: 0;
	margin-left: 20px;
	line-height: 65px;
	display: inline-block;
}

@media ( max-width :767px) {
	#wrapper {
		padding-left: 70px;
		transition: all .4s ease 0s;
	}
	#sidebar-wrapper {
		left: 70px;
	}
	#wrapper.active {
		padding-left: 150px;
	}
	#wrapper.active #sidebar-wrapper {
		left: 150px;
		width: 150px;
		transition: all .4s ease 0s;
	}
}
-->
</style>
<script type="text/javascript">
	$(document).ready(function() {
		$("#menu-toggle").click(function(e) {
			e.preventDefault();
			$("#wrapper").toggleClass("active");
		});
	});
</script>
<!-- login.jsp :로그인 모달을 가지고 있는 jsp파일 -->
<div id="wrapper">

	<!-- Sidebar -->
	<!-- Sidebar -->
	<div id="sidebar-wrapper">
		<ul id="sidebar_menu" class="sidebar-nav">
			<li class="sidebar-brand" style="margin-right: -2%"><a
				id="menu-toggle" href="#" style="color: white">Menu<span
					id="main_icon" class="glyphicon glyphicon-align-justify"
					style="margin-right: -50px"></span></a></li>
		</ul>
		<ul class="sidebar-nav" id="sidebar">
			<li><c:if test="${user.userImage == null }">
					<img
					src="../../images/userIcon.png"
					class="img-circle"
					style="width: 100px; height: 100px; margin-top: 1%;margin-right:-50px;background-color:#D7D7D7">
			</c:if> <c:if test="${user.userImage != null }"> 
					<img
						src="../../images/${user.userImage}"
						class="img-circle"
						style="width: 100px; height: 100px; margin-right: -50px;background-color:#D7D7D7">
				</c:if></li>
			<c:if test="${user.nickname == null }">
				<li style="background-color: #75DDFF"><a href="#"  data-toggle="modal"  class="btn"
					data-target="#loginModal" data-whatever="Login"
					data-backdrop="false" style="color: white; padding-right: 30px">로그인</a></li>
					
				<li style="background-color: #75DDFF"><a href="#" data-toggle="modal"  class="btn"
					data-target="#joinModal" data-whatever="Join" data-backdrop="false"
					style="color: white; padding-right: 30px" >회원가입</a></li>
					
				<li style="background-color: #75DDFF"><a data-target="#searchIngredient" class="btn"
					data-whatever="dialog" data-toggle="modal"
					data-backdrop="false" style="color: white; padding-right:30px">재료상세검색</a></li>
					
				<li style="background-color: #75DDFF"><a  class="btn"
					href="../../app/board/getBoardListFirst?searchCategory=0"
					style="color: white; padding-right: 30px">게시판리스트</a></li>
			</c:if>
			<c:if test="${user.nickname != null }">
				<li style="background-color: #75DDFF"><a
					href="../../app/user/userLogout"
					class="btn " style="color: white; padding-right: 30px">로그아웃</a></li>
				<li style="background-color: #75DDFF;"><a
					data-target="#searchIngredient" class="btn "
					style="color: white; padding-right: 30px" data-whatever="dialog"
					data-toggle="modal" data-backdrop="false">재료상세검색</a></li>
				<li style="background-color: #75DDFF;"><a
					href="../../app/board/getBoardListFirst?searchCategory=0"
					class="btn " style="color: white; padding-right: 30px">게시판리스트</a></li>
				<li style="background-color: #75DDFF;"><a
					href="../../app/recipe/viewInsertRecipe"
					class="btn " style="color: white; padding-right: 30px">레시피등록</a></li>
				<li style="background-color: #75DDFF"><a
					href="../../app/favorite/getfavoriteList"
					class="btn " style="color: white; padding-right: 30px">즐겨찾기</a></li>
				<li style="background-color: #75DDFF"><a
					href="../../app/user/viewUser"
					class="btn " style="color: white; padding-right: 30px">내정보보기</a></li>
			</c:if>
		</ul>
	</div>
</div>
