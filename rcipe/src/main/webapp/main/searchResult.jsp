<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<HTML>
<HEAD>
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
	<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
<Style>

#checklist {
	list-style-type: none;
}

.containerTap {
	margin: 15px;
}

.panel.with-nav-tabs .panel-heading {
	padding: 5px 5px 0 5px;
}

.panel.with-nav-tabs .nav-tabs {
	border-bottom: none;
}

.panel.with-nav-tabs .nav-justified {
	margin-bottom: -1px;
}
/*** PANEL SUCCESS ***/
.with-nav-tabs.panel-success .nav-tabs>li>a, .with-nav-tabs.panel-success .nav-tabs>li>a:hover,
	.with-nav-tabs.panel-success .nav-tabs>li>a:focus {
	color: #3c763d;
}

.with-nav-tabs.panel-success .nav-tabs>.open>a, .with-nav-tabs.panel-success .nav-tabs>.open>a:hover,
	.with-nav-tabs.panel-success .nav-tabs>.open>a:focus, .with-nav-tabs.panel-success .nav-tabs>li>a:hover,
	.with-nav-tabs.panel-success .nav-tabs>li>a:focus {
	color: #3c763d;
	background-color: #d6e9c6;
	border-color: transparent;
}

.with-nav-tabs.panel-success .nav-tabs>li.active>a, .with-nav-tabs.panel-success .nav-tabs>li.active>a:hover,
	.with-nav-tabs.panel-success .nav-tabs>li.active>a:focus {
	color: #3c763d;
	background-color: #fff;
	border-color: #d6e9c6;
	border-bottom-color: transparent;
}

.with-nav-tabs.panel-success .nav-tabs>li.dropdown .dropdown-menu {
	background-color: #dff0d8;
	border-color: #d6e9c6;
}

.with-nav-tabs.panel-success .nav-tabs>li.dropdown .dropdown-menu>li>a {
	color: #3c763d;
}

.with-nav-tabs.panel-success .nav-tabs>li.dropdown .dropdown-menu>li>a:hover,
	.with-nav-tabs.panel-success .nav-tabs>li.dropdown .dropdown-menu>li>a:focus
	{
	background-color: #d6e9c6;
}

.with-nav-tabs.panel-success .nav-tabs>li.dropdown .dropdown-menu>.active>a,
	.with-nav-tabs.panel-success .nav-tabs>li.dropdown .dropdown-menu>.active>a:hover,
	.with-nav-tabs.panel-success .nav-tabs>li.dropdown .dropdown-menu>.active>a:focus
	{
	color: #fff;
	background-color: #3c763d;
}
</Style>
</HEAD>

<BODY>
	<div><jsp:include page="menuBar.jsp"></jsp:include></div>
	<div class="containerTap">
		<div class="panel with-nav-tabs panel-success">
			<div class="panel-heading">
				<ul class="nav nav-tabs">
					<li class="active"><a href="#tab1success" data-toggle="tab">추천순</a></li>
					<li><a href="#tab2success" data-toggle="tab">조회순</a></li>
					<li><a href="#tab3success" data-toggle="tab">최신순</a></li>
				</ul>
			</div>
			<div class="panel-body">
				<div class="tab-content">
					<div class="tab-pane fade in active" id="tab1success">
						<h3>여기는 추천순</h3>
						<jsp:include page="cardSession.jsp" />
					</div>
					<div class="tab-pane fade" id="tab2success">
						<h3>여기는 조회순</h3>
						<jsp:include page="cardSession.jsp" /></div>
					<div class="tab-pane fade" id="tab3success">
						<h3>여기는 최신순</h3>
						<jsp:include page="cardSession.jsp" /></div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="/user/login.jsp"></jsp:include>

	<!-- jQuery -->
	<script src="js/jquery.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="js/bootstrap.min.js"></script>
</BODY>
</HTML>